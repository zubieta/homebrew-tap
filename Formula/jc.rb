class Jc < Formula
  include Language::Python::Virtualenv

  desc "This tool serializes the output of popular command line tools and filetypes to structured JSON output."
  homepage "https://github.com/kellyjonbrazil/jc/"
  url "https://files.pythonhosted.org/packages/08/0b/0bf1af360bb655ada565ab577090f2b2ab8d0ecef52290233e7d2d6e1b7d/jc-1.7.4.tar.gz"
  sha256 "9bded5889915ac85e31401c7d704bc814aa2a8acb44599962b78e649a4e6ce14"
  head "https://github.com/kellyjonbrazil/jc.git"

  depends_on "python"

  resource "ifconfig-parser" do
    url "https://files.pythonhosted.org/packages/19/58/887683fe9baa51f307e1fe58d8beea5beb714a210b2ff6e6430a1430bb34/ifconfig-parser-0.0.5.tar.gz"
    sha256 "6c512f12da0d7f314bb16f883e2d7d89d53198e88f6272a2465330cef117c58a"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/16/8b/54a26c1031595e5edd0e616028b922d78d8ffba8bc775f0a4faeada846cc/ruamel.yaml-0.16.10.tar.gz"
    sha256 "099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954"
  end

  resource "ruamel.yaml.clib" do
    url "https://files.pythonhosted.org/packages/92/28/612085de3fae9f82d62d80255d9f4cf05b1b341db1e180adcf28c1bf748d/ruamel.yaml.clib-0.2.0.tar.gz"
    sha256 "b66832ea8077d9b3f6e311c4a53d06273db5dc2db6e8a908550f3c14d67e718c"
  end

  resource "xmltodict" do
    url "https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49/xmltodict-0.12.0.tar.gz"
    sha256 "50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_equal "1    ls ~\n", pipe_output("#{bin}/jc .bar", '[{"line": 1, "command": "ls ~"}]')
  end
end
