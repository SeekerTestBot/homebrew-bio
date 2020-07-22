class Rcorrector < Formula
  # cite Song_2015: "https://doi.org/10.1186/s13742-015-0089-y"
  desc "Error correction for Illumina RNA-seq reads"
  homepage "https://github.com/mourisl/Rcorrector"
  url "https://github.com/mourisl/Rcorrector/archive/v1.0.4.tar.gz"
  sha256 "ac1754d71aff09b395b3643ec4248ad498e14675a6585296b33918e3c64c2f25"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-bio"
    cellar :any_skip_relocation
    sha256 "cbb94eed122b82034b56e1824e4c2a6a3424cf09c608b74701d99f641b899562" => :sierra
    sha256 "089eab745eb21dd1180eabf842c13257f9c8faa5167da193a4adefe37753d165" => :x86_64_linux
  end

  depends_on "brewsci/bio/jellyfish"

  uses_from_macos "zlib"

  def install
    system "make"
    bin.install "rcorrector", "run_rcorrector.pl"
    doc.install "LICENSE", "README.md", "Sample"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/rcorrector 2>&1")
    assert_match "Usage", shell_output("#{bin}/run_rcorrector.pl 2>&1", 255)
  end
end
