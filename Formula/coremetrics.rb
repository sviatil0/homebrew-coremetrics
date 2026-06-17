class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.3.0/coremetrics-v0.3.0-macos-arm64.tar.gz"
      sha256 "7c1553a877c6f076849e76094707d9fe31dba231d4d6af8ee6d2cc90f6d68f88"
    end
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.3.0/coremetrics-v0.3.0-linux-x86_64.tar.gz"
    sha256 "866c7b3c09fb07421ab2a2a825042136a5befc47f835132bb0ab38e1816d1730"
  end

  depends_on "sdl3"
  depends_on "sdl3_ttf"
  depends_on "sdl3_image"

  def install
    bin.install "coremetrics"
    pkgshare.install "assets"
    pkgshare.install "base.xml" if File.exist?("base.xml")
    doc.install "README.md" if File.exist?("README.md")
    doc.install "CONTRIBUTING.md" if File.exist?("CONTRIBUTING.md")
    doc.install "INSTALL.txt" if File.exist?("INSTALL.txt")
  end

  test do
    system bin/"coremetrics", "--duration", "1"
  end
end
