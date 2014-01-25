require 'formula'

class Fakeroot < Formula
  homepage 'http://packages.qa.debian.org/f/fakeroot.html'
  url 'http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.20.orig.tar.bz2'
  sha1 '3a8e90c77f44248c55333f73fdc8de4c3f3f5531'

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  def install
    system "./bootstrap"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--disable-static",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/fakeroot", "-v"
  end
end
