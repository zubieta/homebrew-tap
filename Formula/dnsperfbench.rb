class Dnsperfbench < Formula
  desc "DNS Performance Benchmarker"
  homepage "https://ismydnsfast.com"
  url "https://github.com/turbobytes/dnsperfbench.git",
    :tag => "v0.1.7",
    :revision => "f7a17771ad959957a4c65e497ae0d06e1d75498a"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    dir = buildpath/"src/github.com/turbobytes/dnsperfbench"
    dir.install buildpath.children

    cd dir do
      system "pwd"
      system "dep", "ensure", "-vendor-only"
      system "go", "build", "-ldflags", "-X main.versionString=#{version}", "-o", bin/"dnsperfbench", "main.go"
      prefix.install_metafiles
    end
  end
end
