class PebbleSdk < Formula
  class Version < ::Version
    def <=> (other)
      mine = ::Version.new(self.to_s.sub('dp', 'alpha').to_s.sub('rc', 'beta'))
      other = ::Version.new(other.to_s.sub('dp', 'alpha').to_s.sub('rc', 'beta'))
      mine <=> other
    end
  end

  homepage 'https://developer.pebble.com'
  stable do
    version PebbleSdk::Version.new("4.3")
    url 'https://github.com/pebble/pebble-tool/archive/v4.3.zip'
    sha256 '0f2370c416da981251c63bf9cd7d6236a747f540aa276f8491f84457e66b0e9b'

    resource 'pypkjs' do
      url 'https://s3-us-west-2.amazonaws.com/pebble-sdk-homebrew/pypkjs-1.0.1.tar.gz'
      sha256 '7806b62c4be86268096dbc97c586d58e3c0c6eee598df30e7e91ed0e896e1df4'
    end

    resource 'libpebble2' do
      url 'https://pypi.python.org/packages/source/l/libpebble2/libpebble2-0.0.18.tar.gz'
      sha256 '25d6695bb3e4101a632e100bd61853536142430e4f8c7dea2a4b9a7f1ae8e6e9'
    end
  end
  devel do
    version PebbleSdk::Version.new("4.4-dp2")
    url 'https://github.com/pebble/pebble-tool/archive/v4.4-dp2.zip'
    sha256 '6340147ef060123aa742221b4c8703ea94600a56cf435c123175baf8a3394a8c'

    resource 'pypkjs' do
      url 'https://s3-us-west-2.amazonaws.com/pebble-sdk-homebrew/pypkjs-1.0.3.tar.gz'
      sha256 '553b26faabbd31496cd36c7f3ba98c5867e070f5dc5d09311f401292717b3a9b'
    end

    resource 'libpebble2' do
      url 'https://pypi.python.org/packages/55/5c/17f00e8282621817db29245cdab9ab8c68811a734adc6eee989d9a132a7d/libpebble2-0.0.20.tar.gz'
      sha256 '392454716877e4c7e36f7e203cced2907a1241933fd0b086ee48ebc979a646e9'
    end
  end

  option "without-emulator", "Build without emulator support"
  option "without-node", "Build without support for Pebble packages"

  depends_on 'node' => :recommended
  depends_on 'freetype' => :recommended

  depends_on 'pebble-toolchain'
  depends_on 'boost-python' unless build.without? "emulator"
  depends_on 'pebble-qemu' unless build.without? "emulator"

  depends_on :python if MacOS.version <= :snow_leopard

  resource 'gevent' do
    url 'https://pypi.python.org/packages/source/g/gevent/gevent-1.1.1.tar.gz'
    sha256 '6ee5b9851b2acde08df7ab9b9a2903f58b4b0e555405c444f4b1dd16f71caeea'
  end

  resource 'greenlet' do
    url 'https://pypi.python.org/packages/source/g/greenlet/greenlet-0.4.9.zip'
    sha256 '58b2f3a2e7075c655616bf95e82868db4980f3bb6661db70ad02a51e4ddd2252'
  end

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

  resource 'gevent-websocket' do
    url 'https://pypi.python.org/packages/source/g/gevent-websocket/gevent-websocket-0.9.3.tar.gz'
    sha256 '6475220340f9f8895a0f51bd2b9df3511bc7765dc055f49e997584bdaee3381f'
  end

  resource 'httplib2' do
    url 'https://pypi.python.org/packages/source/h/httplib2/httplib2-0.9.1.tar.gz'
    sha256 'bc6339919a5235b9d1aaee011ca5464184098f0c47c9098001f91c97176583f5'
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

  resource 'netaddr' do
    url 'https://pypi.python.org/packages/source/n/netaddr/netaddr-0.7.18.zip'
    sha256 'c64c570ac612e20e8b8a6eee72034c924fff9d76c7a46f50a9f919085f1bfbed'
  end

  resource 'virtualenv' do
    url 'https://pypi.python.org/packages/source/v/virtualenv/virtualenv-13.1.2.tar.gz'
    sha256 'aabc8ef18cddbd8a2a9c7f92bc43e2fea54b1147330d65db920ef3ce9812e3dc'
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"

    deps = %w[pypkjs backports.ssl-match-hostname colorama enum34 freetype-py greenlet httplib2 libpebble2 pyasn1 pyasn1-modules oauth2client peewee progressbar2 pygeoip pypng pyqrcode pyserial python-dateutil requests rsa sh six websocket-client wheel wsgiref netaddr virtualenv]
    # worth extracting these as they take time to compile
    deps += %w[gevent gevent-websocket] unless build.without? "emulator"
    deps.each do |r|
      resource(r).stage { system "python", *Language::Python.setup_install_args(libexec/"vendor") }
    end

    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(
      libexec/"bin",
      :PYTHONPATH => ENV["PYTHONPATH"],
      :PHONESIM_PATH => libexec/"vendor/bin/pypkjs",
      :PEBBLE_TOOLCHAIN_PATH => HOMEBREW_PREFIX/"Cellar/pebble-toolchain/2.0/arm-cs-tools/bin",
      :PEBBLE_IS_HOMEBREW => "1",
    )
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
      
      Documentation can be found online at https://developer.pebble.com/docs

      Examples can be found online at https://github.com/pebble-examples

    EOS
  end
end
