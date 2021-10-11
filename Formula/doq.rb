class Doq < Formula
  include Language::Python::Virtualenv

  desc "Docstring generator"
  homepage "https://github.com/heavenshell/py-doq"
  url "https://files.pythonhosted.org/packages/50/5e/1d3b20e8c4a627224efbacc5c9d19392b11c0352b91e5de0bac61018b59b/doq-0.8.1.tar.gz"
  sha256 "80021765a8b5ac30a42859b7c2e6b56ccaa5b2b215db4bbf8c257acc2ea4338f"
  license "BSD-3-Clause"

  depends_on "python@3.9"

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/f8/86/7c0eb6e8b05385d1ce682abc0f994abd1668e148fb52603fa86e15d4c110/Jinja2-3.0.2.tar.gz"
    sha256 "827a0e32839ab1600d4eb1c4c33ec5a8edfbc5cb42dafa13b81f182f97784b45"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e/MarkupSafe-2.0.1.tar.gz"
    sha256 "594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a"
  end

  resource "parso" do
    url "https://files.pythonhosted.org/packages/5e/61/d119e2683138a934550e47fc8ec023eb7f11b194883e9085dca3af5d4951/parso-0.8.2.tar.gz"
    sha256 "12b83492c6239ce32ff5eed6d3639d6a536170723c6f3f1506869f1ace413398"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    run_output = shell_output("echo 'def spam(arg2, arg2: str) -> str:\n\tpass' | #{bin}/doq", 0)
    assert_equal "def spam(arg2, arg2: str) -> str:\n    \"\"\"spam.\n\n    :param arg2:\n    :param arg2:\n    :type arg2: str\n    :rtype: str\n    \"\"\"\n\tpass\n", run_output
  end
end
