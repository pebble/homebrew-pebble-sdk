require 'formula'
require 'curses'

class PebbleSdk < Formula
  PEBBLE_SDK_REQUIREMENTS=[{'url' => 'https://pypi.python.org/packages/source/f/freetype-py/freetype-py-1.0.tar.gz', 'hash' => '1fc67817d5fb9f1329a1a431850a46f01f250a1d6380e4bcecdb54266023e99a', 'name' => 'freetype-py'}, {'url' => 'https://pypi.python.org/packages/source/s/sh/sh-1.09.tar.gz', 'hash' => 'f3d174e2ad25c39f28935bae672be51aa083063d3122405ceeb2a3e7a8239d45', 'name' => 'sh'}, {'url' => 'https://pypi.python.org/packages/source/T/Twisted/Twisted-12.0.0.tar.bz2', 'hash' => 'e5561c9714583fd052ea9e0b10331609a719b3878f9d2593e4c57eab0ba0effd', 'name' => 'twisted'}, {'url' => 'https://pypi.python.org/packages/source/a/autobahn/autobahn-0.5.14.zip', 'hash' => 'd56979d4dffae6dc4d9c840629b9a8092ac41ea75f55052d70943edf7e01979d', 'name' => 'autobahn'}, {'url' => 'https://pypi.python.org/packages/source/w/websocket-client/websocket-client-0.22.0.tar.gz', 'hash' => '83a173ea32ef4209a1933b3e0f5bfafe533b909073ff8d657f044b5792b8c7b5', 'name' => 'websocket-client'}, {'url' => 'https://pypi.python.org/packages/source/p/pyserial/pyserial-2.6.tar.gz', 'hash' => '049dbcda0cd475d3be903e721d60889ee2cc4ec3b62892a81ecef144196413ed', 'name' => 'pyserial'}, {'url' => 'https://pypi.python.org/packages/source/p/pypng/pypng-0.0.17.tar.gz', 'hash' => '2dfa74ac28a4c41ae61e62d243410548c7c174bd990528d30270324f15211544', 'name' => 'pypng'}, {'url' => 'https://pypi.python.org/packages/source/o/oauth2client/oauth2client-1.3.tar.gz', 'hash' => '668ffe5a9a6df1f5fca50a851da9ce97286dc10f190b05e84763a8cd9716141b', 'name' => 'oauth2client'}, {'url' => 'https://pypi.python.org/packages/source/b/backports.ssl_match_hostname/backports.ssl_match_hostname-3.4.0.2.tar.gz', 'hash' => '07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae', 'name' => 'backports.ssl-match-hostname'}, {'url' => 'https://s3.amazonaws.com/assets.getpebble.com/sdk/gevent-102-with-ssl279.tar.gz#egg=gevent', 'hash' => 'c75bb3cd3ee07a509684948e29ce490b2f4e4b9c2835262f6403b0e55df1b304', 'name' => 'gevent'}. {'url' => 'https://pypi.python.org/packages/source/C/Cython/cython-0.22.tar.gz', 'hash' => '14307e7a69af9a0d0e0024d446af7e51cc0e3e4d0dfb10d36ba837e5e5844015', 'name' => 'cython'}, {'url' => 'https://pypi.python.org/packages/source/g/gevent-websocket/gevent-websocket-0.9.3.tar.gz', 'hash' => '6475220340f9f8895a0f51bd2b9df3511bc7765dc055f49e997584bdaee3381f', 'name' => 'gevent-websocket'}, {'url' => 'https://pypi.python.org/packages/source/g/greenlet/greenlet-0.4.5.zip', 'hash' => 'b990f00f120c4cfb6672eec2acd32210990a2c7b70b815c034d1d8cbf08e2dbe', 'name' => 'greenlet'}, {'url' => 'https://pypi.python.org/packages/source/p/peewee/peewee-2.4.7.tar.gz', 'hash' => '8ad1c4fb202332a969da83a0af712bca96ed6e2a70ca1523ab3d2a2234ed47bd', 'name' => 'peewee'}, {'url' => 'https://pypi.python.org/packages/source/p/pygeoip/pygeoip-0.3.2.tar.gz', 'hash' => 'f22c4e00ddf1213e0fae36dc60b46ee7c25a6339941ec1a975539014c1f9a96d', 'name' => 'pygeoip'}, {'url' => 'https://pypi.python.org/packages/source/p/python-dateutil/python-dateutil-2.4.1.post1.tar.gz', 'hash' => 'aa9bdbd60c395db90204609f1fb5aeb3797870f65c09f04f243476d22f8f4615', 'name' => 'python-dateutil'}, {'url' => 'https://pypi.python.org/packages/source/r/requests/requests-2.5.0.tar.gz', 'hash' => 'd2daef4919fc87262b8b3cb5a9d214cac8ce1e50950f8423bbc1d31c2e63d38e', 'name' => 'requests'}, {'url' => 'https://pypi.python.org/packages/source/s/six/six-1.8.0.tar.gz', 'hash' => '047bbbba41bac37c444c75ddfdf0573dd6e2f1fbd824e6247bb26fa7d8fa3830', 'name' => 'six'}, {'url' => 'https://pypi.python.org/packages/source/w/wsgiref/wsgiref-0.1.2.zip', 'hash' => 'c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79', 'name' => 'wsgiref'}]
  PEBBLE_SDK_VERSION='3.0-beta10'
  PEBBLE_SDK_SHA256='d310a20b39f7243247803b1a48c489a59983cd20d4e421c1213693d2a9b39339'

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
      
      Documentation can be found online at https://developer.getpebble.com/docs or in
      #{doc}

      Examples can be found online at https://github.com/pebble-examples

    EOS
  end
end
