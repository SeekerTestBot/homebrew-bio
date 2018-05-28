class Orfm < Formula
  # cite Woodcroft_2016: "https://doi.org/10.1093/bioinformatics/btw241"
  desc "Simple and not slow ORF caller for NGS reads"
  homepage "https://github.com/wwood/OrfM"
  url "https://github.com/wwood/OrfM/releases/download/v0.7.1/orfm-0.7.1.tar.gz"
  sha256 "19f39c72bcc48127b757613c5eef4abae95ee6c82dccf96b041db527b27f319a"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "zlib" unless OS.mac?

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orfm -v 2>&1")
  end
end
