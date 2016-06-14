class PebbleQemu < Formula
  homepage "https://github.com/pebble/qemu"
  url "https://github.com/pebble/qemu/archive/v2.5.0-pebble2.zip"
  sha256 "c0fc5ad44c011a53a1c676cdd29e620f90838546f36f47b55cc8a2de9215b621"
  head "https://github.com/pebble/qemu.git"
  version "2.5.0-pebble2"

  bottle do
    root_url "http://pebble-sdk-homebrew.s3.amazonaws.com"
    cellar :any
    sha256 "91cc0a6234f9d9d0e6843e072756c78854cb2fae71330d054288c06f5bae4017" => :el_capitan
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
