class K3sup < Formula
  desc "Bootstrap Kubernetes with k3s over SSH < 1 min"
  homepage "https://github.com/alexellis/k3sup"
  url "https://github.com/alexellis/k3sup/archive/0.9.5.tar.gz"
  sha256 "1c8ffe901729089cf55a0ad77b2b3e2ec1763ab185a8132cfbb62dc24f436ab9"
  license "MIT"
  head "https://github.com/alexellis/k3sup.git"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "dist"
    bin.install "bin/k3sup-darwin" => "k3sup"
  end

  test do
    version_cmd = "#{bin}/k3sup version | ' \
      'awk '/Version:/ {print substr($2, 1, match($2, \"-\")-1)}'"
    assert_match version.to_s, shell_output(version_cmd)
  end
end
