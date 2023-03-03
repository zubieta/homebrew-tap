class Yamlfmt < Formula
  desc "An extensible command line tool or library to format yaml files."
  homepage "https://github.com/google/yamlfmt"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/yamlfmt_#{version}_Darwin_x86_64.tar.gz"
      sha256 "0843c0a822674d76c9c4f3114d8d0fce721b019eeb73897af85cb726f6b1fbe4"
    end
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/yamlfmt_#{version}_Darwin_arm64.tar.gz"
      sha256 "8cf20ddc2bab2d19d9d40fb2c121e3b124548d431c0695a566fcfdd1ad3c5828"
    end
  end

  def install
    bin.install "yamlfmt"
  end

  test do
    assert_match (/yamlfmt is a simple command line tool for formatting yaml files/), shell_output("#{bin}/yamlfmt -h", 0)
  end
end
