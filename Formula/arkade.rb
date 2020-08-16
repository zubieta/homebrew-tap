class Arkade < Formula
  desc "Get Kubernetes apps the easy way"
  homepage "https://github.com/alexellis/arkade"
  url "https://github.com/alexellis/arkade/archive/0.6.1.tar.gz"
  sha256 "84baf7f017bc776b2b5546f1b0d984648c0b5494b69e99946ebc382672631e51"
  license "MIT"
  head "https://github.com/alexellis/arkade.git"

  depends_on "go" => :build
  depends_on "make" => :build
  depends_on "awk" => :test

  def install
    system "make", "dist"
    bin.install "bin/arkade-darwin" => "arkade"
    bin.install_symlink "arkade" => "ark"
  end

  test do
    version_cmd = "#{bin}/arkade version | ' \
      'awk '/Version:/ {print substr($2, 1, match($2, \"-\")-1)}'"
    assert_match version.to_s, shell_output(version_cmd)
  end
end
