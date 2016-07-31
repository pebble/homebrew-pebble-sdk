require 'formula'

class PebbleToolchain < Formula
  homepage 'https://github.com/pebble/arm-eabi-toolchain'
  url 'http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk/arm-cs-tools-macos-universal-static.tar.gz'
  sha256 '49a1ddaed13d44b928a7148fa344f9362d6ae6823496fb5077ea451230222c4b'
  version '2.0'

  keg_only 'Not linked to avoid conflicts.'

  depends_on 'mpfr' => :build
  depends_on 'gmp' => :build
  depends_on 'libmpc' => :build
  depends_on 'libelf' => :build
  depends_on 'texinfo' => :build

  def install
    cp_r "#{buildpath}", "#{prefix}"
  end
end
