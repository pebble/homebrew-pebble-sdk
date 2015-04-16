require 'formula'

class PebbleSdk < Formula
  homepage 'https://developer.getpebble.com'
  url 'http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk2/PebbleSDK-3.0-dp8.tar.gz'
  sha1 '710522892ab81aa08f4f4f7c84f7a003b387d7c6'
  version '3.0-dp8'

  depends_on :macos => :mountain_lion
  depends_on 'freetype' => :recommended
  depends_on 'pebble-toolchain' => :build

  # List of resources can be obtained from requirements.txt
  resource 'freetype-py' do
    url 'https://pypi.python.org/packages/source/f/freetype-py/freetype-py-1.0.tar.gz'
    sha1 '3830e45ff9e9a96f1e209d786cbd5492f168127a'
  end

  resource 'sh' do
    url 'https://pypi.python.org/packages/source/s/sh/sh-1.09.tar.gz'
    sha1 '995c3cd38ddc065088f5fa991206665ec899e938'
  end

  resource 'twisted' do
    url 'https://pypi.python.org/packages/source/T/Twisted/Twisted-12.0.0.tar.bz2'
    sha1 '64b7f7fdeefbd4dd8e6bdffb12d9095106ee3d5d'
  end

  resource 'autobahn' do
    url 'https://pypi.python.org/packages/source/a/autobahn/autobahn-0.5.14.zip'
    sha1 '475ba5f281bdcc50858c6920c034a1a067b2ce2a'
  end

  resource 'websocket-client' do
    url 'https://pypi.python.org/packages/source/w/websocket-client/websocket-client-0.22.0.tar.gz'
    sha1 'f6d42683cf58b3a40b47ff0c78afca980df05abd'
  end

  resource 'pyserial' do
    url 'https://pypi.python.org/packages/source/p/pyserial/pyserial-2.7.tar.gz'
    sha1 'f15694b1bea9e4369c1931dc5cf09e37e5c562cf'
  end

  resource 'pypng' do
    url 'https://pypi.python.org/packages/source/p/pypng/pypng-0.0.17.tar.gz'
    sha1 '3821c58be15e833fc183dd361df02dece32ba180'
  end

  resource 'oauth2client' do
    url 'https://pypi.python.org/packages/source/o/oauth2client/oauth2client-1.3.tar.gz'
    sha1 '02c69758754be96c902225f3e55965cd5a392064'
  end

  resource 'backports.ssl_match_hostname' do
    url 'https://pypi.python.org/packages/source/b/backports.ssl_match_hostname/backports.ssl_match_hostname-3.4.0.2.tar.gz'
    sha1 'da4e41f3b110279d2382df47ac1e4f10c63cf954'
  end

  resource 'gevent' do
    url 'https://pypi.python.org/packages/source/g/gevent/gevent-1.0.1.tar.gz'
    sha1 '2cc1b6e1fa29b30ea881fa6a195e57faaf089ae8'
  end

  resource 'gevent-websocket' do
    url 'https://pypi.python.org/packages/source/g/gevent-websocket/gevent-websocket-0.9.3.tar.gz'
    sha1 '06da7a53cb3844a4094ce9279cfd6f70bde12172'
  end

  resource 'greenlet' do
    url 'https://pypi.python.org/packages/source/g/greenlet/greenlet-0.4.5.zip'
    sha1 '97f18d651595bd30243ad2f4702764791e57fa6e'
  end

  resource 'peewee' do
    url 'https://pypi.python.org/packages/source/p/peewee/peewee-2.4.7.tar.gz'
    sha1 '7803726847e109a3f56b456a092b04937ef3b6d2'
  end

  resource 'pygeoip' do
    url 'https://pypi.python.org/packages/source/p/pygeoip/pygeoip-0.3.2.tar.gz'
    sha1 '608365dc820b54ac44d368e6e33766444e0a5098'
  end

  resource 'python-dateutil' do
    url 'https://pypi.python.org/packages/source/p/python-dateutil/python-dateutil-2.4.1.post1.tar.gz'
    sha1 '55c712dac45ad14532d9bc05b64ba7e4bf6b56c6'
  end

  resource 'requests' do
    url 'https://pypi.python.org/packages/source/r/requests/requests-2.5.0.tar.gz'
    sha1 'd60dfaaa0b4b62a6646fcb6c3954ea369317ca9f'
  end

  resource 'six' do
    url 'https://pypi.python.org/packages/source/s/six/six-1.8.0.tar.gz'
    sha1 'aa3b0659cbc85c6c7a91efc51f2d1007040070cd'
  end

  resource 'wsgiref' do
    url 'https://pypi.python.org/packages/source/w/wsgiref/wsgiref-0.1.2.zip'
    sha1 '80b7e9b039e40a2f8419e00b393a6516d80cf8de'
  end

  def install
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

    %w[freetype-py sh twisted autobahn websocket-client pyserial pypng oauth2client
       backports.ssl_match_hostname gevent gevent-websocket freenlet peewee pygeoip
       python-dateutil requests six wsgiref].each do |r|
      resource(r).stage do
        system "python", *install_args
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
