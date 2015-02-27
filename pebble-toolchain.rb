require 'formula'

class PebbleToolchain < Formula
  homepage 'https://github.com/pebble/arm-eabi-toolchain'
  url 'http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk/arm-cs-tools-macos-universal-static.tar.gz'
  sha1 'b1baaf455140d3c6e3a889217bb83986fe6527a0'
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
