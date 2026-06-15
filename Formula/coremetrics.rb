class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.2.11"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.11/coremetrics-v0.2.11-macos-arm64.tar.gz"
      sha256 "6aad68753e3a2eca131e7208b06bc630fa0922bbee37278d4ad5ccc9cf033eef"
    end
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.11/coremetrics-v0.2.11-linux-x86_64.tar.gz"
    sha256 "ef0c3b36542e5a8170f2e01a629e4bc308625f330880e9da1d50b50f681b1e4f"
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
