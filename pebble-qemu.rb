class PebbleQemu < Formula
  homepage "https://github.com/pebble/qemu"
  url "https://github.com/pebble/qemu/archive/v2.1.1-pebble1.zip"
  sha256 "a7b1047492ab969725d90efa42a95ac22e69b271c7847a1a19606b3ea226f025"
  head "https://github.com/pebble/qemu.git"
  version "2.1.1-pebble1"
  revision 1

  bottle do
    root_url "http://pebble-sdk-homebrew.s3.amazonaws.com"
    cellar :any
    sha256 "b55b5940b9439c4ee0cb1484e7209d28d527d2d1e3dcb1e82a2ee5212d01a702" => :el_capitan
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
                          "--disable-mouse"

    system "make"
    # We only need the one binary.
    bin.install ["arm-softmmu/qemu-system-arm"]
    # Rename it to avoid conflicting with more standard QEMUs.
    mv bin/"qemu-system-arm", bin/"qemu-pebble"
  end
end
