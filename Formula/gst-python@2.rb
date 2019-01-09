class GstPythonAT2 < Formula
  desc "Python@2 overrides for gobject-introspection-based pygst bindings"
  homepage "https://gstreamer.freedesktop.org/modules/gst-python.html"
  url "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.14.4.tar.xz"
  sha256 "d0fdb24f93b6d889f309d2f526b8ea9577e0084ff0a62b4623ef1aed52e85a1b"
  revision 1

  depends_on "gst-plugins-base"
  depends_on "pygobject3" => "with-python@2"
  depends_on "python@2"

  conflicts_with "gst-python", :because => "Gstreamer only supports to be installed with python version at a time"

  def install
    python_version = Language::Python.major_minor_version("python2")
    # pygi-overrides-dir switch ensures files don't break out of sandbox.
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-pygi-overrides-dir=#{lib}/python#{python_version}/site-packages/gi/overrides",
                          "PYTHON=python2"
      system "make", "install"
  end

  test do
    system "#{Formula["gstreamer"].opt_bin}/gst-inspect-1.0", "python2"
    # Without gst-python raises "TypeError: object() takes no parameters"
    system "python2", "-c", <<~EOS
      import gi
      gi.require_version('Gst', '1.0')
      from gi.repository import Gst
      print (Gst.Fraction(num=3, denom=5))
    EOS
  end
end