require 'formula'
require 'curses'

class PebbleSdkLegacy < Formula
  PEBBLE_SDK_REQUIREMENTS=[{'url' => 'https://pypi.python.org/packages/source/f/freetype-py/freetype-py-1.0.tar.gz', 'hash' => '1fc67817d5fb9f1329a1a431850a46f01f250a1d6380e4bcecdb54266023e99a', 'name' => 'freetype-py'}, {'url' => 'https://pypi.python.org/packages/source/s/sh/sh-1.08.tar.gz', 'hash' => '86c1a93764be62e353e4cd64860066af698f590f360fbe51231e9772052e19eb', 'name' => 'sh'}, {'url' => 'https://pypi.python.org/packages/source/T/Twisted/Twisted-12.0.0.tar.bz2', 'hash' => 'e5561c9714583fd052ea9e0b10331609a719b3878f9d2593e4c57eab0ba0effd', 'name' => 'twisted'}, {'url' => 'https://pypi.python.org/packages/source/a/autobahn/autobahn-0.5.14.zip', 'hash' => 'd56979d4dffae6dc4d9c840629b9a8092ac41ea75f55052d70943edf7e01979d', 'name' => 'autobahn'}, {'url' => 'https://pypi.python.org/packages/source/w/websocket-client/websocket-client-0.12.0.tar.gz', 'hash' => '2a289c1ba0631dfe4497562cb47fae1fd0a97ee49885f2f1da50ab4d6e6a6b0c', 'name' => 'websocket-client'}, {'url' => 'https://pypi.python.org/packages/source/p/pyserial/pyserial-2.6.tar.gz', 'hash' => '049dbcda0cd475d3be903e721d60889ee2cc4ec3b62892a81ecef144196413ed', 'name' => 'pyserial'}, {'url' => 'https://pypi.python.org/packages/source/p/pypng/pypng-0.0.16.tar.gz', 'hash' => 'ec578c4ba66704c64f552ceaf6234916819eb90c3ce7420c69ccb137ac154c20', 'name' => 'pypng'}]
  PEBBLE_SDK_VERSION='2.9'
  PEBBLE_SDK_SHA256='9eb9dee08c88f192a6403717d8b32d67f49e598efb1b6e530056f008c5a2f465'

  homepage 'https://developer.getpebble.com'
  url "http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk2/PebbleSDK-#{PEBBLE_SDK_VERSION}.tar.gz"
  sha256 "#{PEBBLE_SDK_SHA256}"
  version "#{PEBBLE_SDK_VERSION}"

  depends_on 'freetype' => :recommended

  depends_on 'pebble-toolchain'
  depends_on 'boost-python'
  depends_on 'glib'
  depends_on 'pixman'

  PEBBLE_SDK_REQUIREMENTS.each do |r|
    resource r["name"] do
      url r["url"]
      sha256 r["hash"]
    end
  end

  def cancel_install
    Curses.close_screen
    puts "To use the Pebble SDK, you must agree to the Pebble Terms of Use and Pebble Developer License."
    puts "Cancelling installation of Pebble SDK..."
  end

  def check_license_agreement
    Curses.noecho
    Curses.init_screen    
    
    Curses.addstr("To use the Pebble SDK, you must agree to the following:\n\nPEBBLE TERMS OF USE\nhttps://developer.getpebble.com/legal/terms-of-use\n\nPEBBLE DEVELOPER LICENSE\nhttps://developer.getpebble.com/legal/sdk-license\n\nDo you accept the Pebble Terms of Use and the Pebble Developer License (y/n)? ")

    loop do
      case Curses.getch
        when 'y'
          break
        when 'n'
          cancel_install
          exit
      end
    end

    Curses.close_screen
  end

  def install
    check_license_agreement
    inreplace 'bin/pebble' do |s|
      # This replacement fixes a path that gets messed up because of the
      # bin.env_script_all_files call (which relocates actual pebble.py script
      # to libexec/, causing problems with the absolute path expected below).
      s.gsub! /^script_path = .*?$/m, "script_path = '#{libexec}/../tools/pebble.py'"

      # This replacement removes environment settings that were needed only
      # if installation was done with the official script
      s.gsub! /^local_python_env.*?=.*?\(.*?\)$/m, ""
      s.gsub! /^process = subprocess\.Popen\(args, shell=False, env=local_python_env\)/, "process = subprocess.Popen(args, shell=False)"
    end

    ENV["PYTHONPATH"] = lib+"python2.7/site-packages"
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    PEBBLE_SDK_REQUIREMENTS.each do |r|
      resource(r["name"]).stage { system "python", *install_args }
    end
    
    doc.install %w[Documentation Examples README.txt]
    prefix.install %w[Pebble bin tools requirements.txt version.txt]

    ln_s "#{HOMEBREW_PREFIX}/Cellar/pebble-toolchain/2.0/arm-cs-tools", "#{prefix}"

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system bin/'pebble', 'new-project', 'test'
    cd 'test' do
      # We have to remove the default /usr/local/include from the CPATH
      # because the toolchain has -Werror=poison-system-directories set
      ENV['CPATH'] = ''
      system bin/'pebble', 'build'
    end
  end

  def caveats; <<-EOS.undent
      Documentation and examples can be found in
      #{doc}
    EOS
  end
end
