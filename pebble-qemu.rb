class PebbleQemu < Formula
  homepage "https://github.com/pebble/qemu"

  bottle do
    root_url "http://pebble-sdk-homebrew.s3.amazonaws.com"
    cellar :any
    sha256 "91cc0a6234f9d9d0e6843e072756c78854cb2fae71330d054288c06f5bae4017" => :el_capitan
  end

  url "https://github.com/pebble/qemu/archive/v2.5.0-pebble3.zip"
  sha256 "aeae67a9339d381761ba05b16358e438ad9d57779a3459acaa4335067d30d28d"
  version "2.5.0-pebble3"

  head "https://github.com/pebble/qemu.git"

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
                          "--extra-cflags=-DSTM32_UART_NO_BAUD_DELAY -DSKIP_QUIT_PROMPT",
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
