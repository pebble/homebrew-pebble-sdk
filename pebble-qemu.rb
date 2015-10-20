class PebbleQemu < Formula
  homepage "https://github.com/pebble/qemu"
  url "https://github.com/pebble/qemu/archive/v2.1.1-pebble1.zip"
  sha256 "a7b1047492ab969725d90efa42a95ac22e69b271c7847a1a19606b3ea226f025"
  version "2.1.1-pebble1"

  bottle do
    root_url "http://pebble-homebrew.s3.amazonaws.com"
    cellar :any
    sha256 "ed312703b691e67c4cafd62f0447ae9f2eef3662cd8baf8597f02cd14293b7ed" => :el_capitan
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
    bin.install ["arm-softmmu/qemu-system-arm"]
    mv bin/"qemu-system-arm", bin/"qemu-pebble"
  end
end
