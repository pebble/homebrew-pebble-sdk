require 'curses'

class PebbleSdk < Formula
  class Version < ::Version
    def <=> (other)
      mine = ::Version.new(self.to_s.sub('dp', 'alpha'))
      other = ::Version.new(other.to_s.sub('dp', 'alpha'))
      mine <=> other
    end
  end

  homepage 'https://developer.getpebble.com'
  url "https://sdk.getpebble.com/download/3.6.2?source=homebrew"
  sha256 "4dc0d5310d44425deda3b4614c8036e17070de8d1cea07dd253bce18d474bac5"
  version PebbleSdk::Version.new("3.6.2")

  depends_on 'freetype' => :recommended

  depends_on 'pebble-toolchain'
  depends_on 'boost-python'
  depends_on 'glib'
  depends_on 'pixman'

  resource 'backports.ssl-match-hostname' do
    url 'https://pypi.python.org/packages/source/b/backports.ssl_match_hostname/backports.ssl_match_hostname-3.4.0.2.tar.gz'
    sha256 '07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae'
  end

  resource 'colorama' do
    url 'https://pypi.python.org/packages/source/c/colorama/colorama-0.3.3.tar.gz'
    sha256 'eb21f2ba718fbf357afdfdf6f641ab393901c7ca8d9f37edd0bee4806ffa269c'
  end

  resource 'enum34' do
    url 'https://pypi.python.org/packages/source/e/enum34/enum34-1.0.4.tar.gz'
    sha256 'd3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447'
  end

  resource 'freetype-py' do
    url 'https://pypi.python.org/packages/source/f/freetype-py/freetype-py-1.0.tar.gz'
    sha256 '1fc67817d5fb9f1329a1a431850a46f01f250a1d6380e4bcecdb54266023e99a'
  end

  resource 'gevent' do
    url 'https://pypi.python.org/packages/source/g/gevent/gevent-1.1b5.tar.gz'
    sha256 '39e5848b4e8bd20846a43772e1ec8f3c4b8b0cff43611e0d73d809b5dc63f6fb'
  end

  resource 'gevent-websocket' do
    url 'https://pypi.python.org/packages/source/g/gevent-websocket/gevent-websocket-0.9.3.tar.gz'
    sha256 '6475220340f9f8895a0f51bd2b9df3511bc7765dc055f49e997584bdaee3381f'
  end

  resource 'greenlet' do
    url 'https://pypi.python.org/packages/source/g/greenlet/greenlet-0.4.7.zip'
    sha256 'f32c4fa4e06443e1bdb0d32b69e7617c25ff772c3ffc6d0aa63d192e9fd795fe'
  end

  resource 'httplib2' do
    url 'https://pypi.python.org/packages/source/h/httplib2/httplib2-0.9.1.tar.gz'
    sha256 'bc6339919a5235b9d1aaee011ca5464184098f0c47c9098001f91c97176583f5'
  end

  resource 'libpebble2' do
    url 'https://pypi.python.org/packages/source/l/libpebble2/libpebble2-0.0.12.tar.gz'
    sha256 '3ada5d0cb611569b8c92dae38cf224ffef4633be427359f0b478bc8b7d5afb97'
  end

  resource 'oauth2client' do
    url 'https://pypi.python.org/packages/source/o/oauth2client/oauth2client-1.4.12.tar.gz'
    sha256 '74aa6c3beb90a4a7b9b8d0bc3cd60db34d45c5ee6136187bb9eabe85b4990e5e'
  end

  resource 'peewee' do
    url 'https://pypi.python.org/packages/source/p/peewee/peewee-2.4.7.tar.gz'
    sha256 '8ad1c4fb202332a969da83a0af712bca96ed6e2a70ca1523ab3d2a2234ed47bd'
  end

  resource 'progressbar2' do
    url 'https://pypi.python.org/packages/source/p/progressbar2/progressbar2-2.7.3.tar.gz'
    sha256 '8366ffc752ebe3c8e50db2699b7b1dc3cb6ff3750065e965a2591ac50270b794'
  end

  resource 'pyasn1' do
    url 'https://pypi.python.org/packages/source/p/pyasn1/pyasn1-0.1.8.tar.gz'
    sha256 '5d33be7ca0ec5997d76d29ea4c33b65c00c0231407fff975199d7f40530b8347'
  end

  resource 'pyasn1-modules' do
    url 'https://pypi.python.org/packages/source/p/pyasn1-modules/pyasn1-modules-0.0.6.tar.gz'
    sha256 '1f41d3f3da43e9a769e23649724368aa0b88afcfd1fe6e9f210d31d13322fc15'
  end

  resource 'pygeoip' do
    url 'https://pypi.python.org/packages/source/p/pygeoip/pygeoip-0.3.2.tar.gz'
    sha256 'f22c4e00ddf1213e0fae36dc60b46ee7c25a6339941ec1a975539014c1f9a96d'
  end

  resource 'pypng' do
    url 'https://pypi.python.org/packages/source/p/pypng/pypng-0.0.17.tar.gz'
    sha256 '2dfa74ac28a4c41ae61e62d243410548c7c174bd990528d30270324f15211544'
  end

  resource 'pyqrcode' do
    url 'https://pypi.python.org/packages/source/P/PyQRCode/PyQRCode-1.1.tar.gz'
    sha256 'a22814bf88c8632ebe496e3300793c12471bb448d3186032445990c44ddcdd51'
  end

  resource 'pyserial' do
    url 'https://pypi.python.org/packages/source/p/pyserial/pyserial-2.7.tar.gz'
    sha256 '3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477'
  end

  resource 'python-dateutil' do
    url 'https://pypi.python.org/packages/source/p/python-dateutil/python-dateutil-2.4.1.post1.tar.gz'
    sha256 'aa9bdbd60c395db90204609f1fb5aeb3797870f65c09f04f243476d22f8f4615'
  end

  resource 'requests' do
    url 'https://pypi.python.org/packages/source/r/requests/requests-2.7.0.tar.gz'
    sha256 '398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7ed5511517b4bb93d'
  end

  resource 'rsa' do
    url 'https://pypi.python.org/packages/source/r/rsa/rsa-3.1.4.tar.gz'
    sha256 'e2b0b05936c276b1edd2e1525553233b666df9e29b5c3ba223eed738277c82a0'
  end

  resource 'sh' do
    url 'https://pypi.python.org/packages/source/s/sh/sh-1.09.tar.gz'
    sha256 'f3d174e2ad25c39f28935bae672be51aa083063d3122405ceeb2a3e7a8239d45'
  end

  resource 'six' do
    url 'https://pypi.python.org/packages/source/s/six/six-1.9.0.tar.gz'
    sha256 'e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5'
  end

  resource 'websocket-client' do
    url 'https://pypi.python.org/packages/source/w/websocket-client/websocket_client-0.32.0.tar.gz'
    sha256 'cb3ab95617ed2098d24723e3ad04ed06c4fde661400b96daa1859af965bfe040'
  end

  resource 'wheel' do
    url 'https://pypi.python.org/packages/source/w/wheel/wheel-0.24.0.tar.gz'
    sha256 'ef832abfedea7ed86b6eae7400128f88053a1da81a37c00613b1279544d585aa'
  end

  resource 'wsgiref' do
    url 'https://pypi.python.org/packages/source/w/wsgiref/wsgiref-0.1.2.zip'
    sha256 'c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79'
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
      s.gsub! /^script_path = .*?$/m, "script_path = '#{libexec}/../pebble-tool/pebble.py'"

      # This replacement removes environment settings that were needed only
      # if installation was done with the official script
      s.gsub! /^local_python_env.*?=.*?\(.*?\)$/m, ""
      s.gsub! /^process = subprocess\.Popen\(args, shell=False, env=local_python_env\)/, "process = subprocess.Popen(args, shell=False)"
    end

    ENV["PYTHONPATH"] = lib+"python2.7/site-packages"
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    ENV.prepend_create_path "PATH", libexec/"bin"
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    %w[backports.ssl-match-hostname colorama enum34 freetype-py gevent gevent-websocket greenlet httplib2 libpebble2 pyasn1 pyasn1-modules oauth2client peewee progressbar2 pygeoip pypng pyqrcode pyserial python-dateutil requests rsa sh six websocket-client wheel wsgiref].each do |r|
      resource(r).stage { system "python", *install_args }
    end
    
    doc.install %w[Documentation Examples README.txt]
    prefix.install %w[Pebble bin pebble-tool requirements.txt version.txt]

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
