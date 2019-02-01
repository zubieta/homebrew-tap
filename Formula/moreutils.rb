class Moreutils < Formula
  desc "Collection of tools that nobody wrote when UNIX was young. Excluding the parallel tool."
  homepage "https://joeyh.name/code/moreutils/"
  url "https://git.joeyh.name/git/moreutils.git",
    :tag      => "0.63",
    :revision => "aeddd0f4caa9d10aaa691040773fa4764e12ff46"
  head "https://git.joeyh.name/git/moreutils.git"

  depends_on "docbook-xsl" => :build

  conflicts_with "pwntools", :because => "Both install an `errno` executable."
  conflicts_with "task-spooler", :because => "Both install a `ts` executable."

  resource "Time::Duration" do
    url "https://cpan.metacpan.org/authors/id/N/NE/NEILB/Time-Duration-1.20.tar.gz"
    sha256 "458205b528818e741757b2854afac5f9af257f983000aae0c0b1d04b5a9cbbb8"
  end

  resource "IPC::Run" do
    url "https://cpan.metacpan.org/authors/id/T/TO/TODDR/IPC-Run-0.94.tar.gz"
    sha256 "2eb336c91a2b7ea61f98e5b2282d91020d39a484f16041e2365ffd30f8a5605b"
  end

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"

    resource("Time::Duration").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "--skipdeps"
      system "make", "install"
    end

    resource("IPC::Run").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make", "install"
    end

    inreplace "Makefile" do |s|
      s.gsub! "/usr/share/xml/docbook/stylesheet/docbook-xsl",
        "#{Formula["docbook-xsl"].opt_prefix}/docbook-xsl"
      s.gsub! (/^BINS=.*\Kparallel/), "", false
      s.gsub! (/^MANS=.*\Kparallel\.1/), ""
      s.gsub! (/^PERLSCRIPTS=.*\Kparallel/), "", false
    end
    system "make", "all"
    system "make", "check"
    system "make", "install", "PREFIX=#{prefix}"
    bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
  end

  test do
    pipe_output("#{bin}/isutf8", "hello", 0)
    pipe_output("#{bin}/isutf8", "\xca\xc0\xbd\xe7", 1)
  end
end
