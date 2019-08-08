class Sewnutils < Formula
  desc "Set of small tailor-made tools."
  homepage "https://github.com/zubieta/sewnutils"
  url "https://github.com/zubieta/sewnutils/archive/v0.2.tar.gz"
  sha256 "0accd5aa87e9bb36401cef3b38ae4ba76288d3b869913ae74d509b666f3f4b4b"
  head "https://github.com/zubieta/sewnutils.git"

  depends_on "make" => :build
  depends_on "pandoc" => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
