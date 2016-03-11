class PebbleQemu < Formula
  homepage "https://github.com/pebble/qemu"
  url "https://github.com/pebble/qemu/archive/v2.5.0-pebble1.zip"
  sha256 "511d654dea7901e0de848ef151e6033e13736c394dd278e00455937251ab1081"
  head "https://github.com/pebble/qemu.git"
  version "2.5.0-pebble1"

  bottle do
    root_url "http://pebble-sdk-homebrew.s3.amazonaws.com"
    cellar :any
    sha256 "1da010000c421fa80df70bb9d8b86d2ba143622faec4eb606a69b58172402039" => :yosemite
    sha256 "027dd405c464e4ee53c198f2257a9ef0f9f6953b6166cc7da769f47cf3a7fae0" => :el_capitan
  end

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "dtc" => :build

  depends_on "glib"
  depends_on "pixman"
  depends_on "libpng"
  depends_on "libjpeg"

  def install
    system "./configure", "--disable-werror",
                          "--enable-debug",
                          '--target-list=arm-softmmu',
                          "--extra-cflags=-DSTM32_UART_NO_BAUD_DELAY",
                          "--prefix=#{prefix}",
                          "--disable-mouse",
                          "--disable-docs"

    system "make"
    # We only need the one binary.
    bin.install ["arm-softmmu/qemu-system-arm"]
    # Rename it to avoid conflicting with more standard QEMUs.
    mv bin/"qemu-system-arm", bin/"qemu-pebble"
  end
end
