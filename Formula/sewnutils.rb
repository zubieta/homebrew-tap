class Sewnutils < Formula
  desc "Set of small tailor-made tools."
  homepage "https://github.com/zubieta/sewnutils"
  url "https://github.com/zubieta/sewnutils/archive/v0.3.tar.gz"
  # sha256 "0accd5aa87e9bb36401cef3b38ae4ba76288d3b869913ae74d509b666f3f4b4b"
  sha256 "27462cde7338632154f418c2eae4cddd2bf6ca96dd7226088c64a5212d367ad7"
  head "https://github.com/zubieta/sewnutils.git"

  depends_on "make" => :build
  depends_on "pandoc" => :build

  def install
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make", "install"
  end
end
