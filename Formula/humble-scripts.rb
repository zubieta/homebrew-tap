class HumbleScripts < Formula
  desc "Set of useful bash scripts that aren't big enough to have its own repo."
  homepage "https://github.com/zubieta/humble-scripts"
  url "https://github.com/zubieta/humble-scripts/archive/v0.1.tar.gz"
  sha256 "f9382a2b1ddb0fbd4630e6f7f47aa19b2d53b6dc1522ed52b0549b60aaa2f676"
  head "https://github.com/zubieta/humble-scripts.git"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
