class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.2.24"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.24/coremetrics-v0.2.24-macos-arm64.tar.gz"
      sha256 "e0c0ac296918c321d936789693139eadebd6102abd45bbf7fbc332711cc74185"
    end
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.24/coremetrics-v0.2.24-linux-x86_64.tar.gz"
    sha256 "2fa7ee0a28fd20e37ad17cb179dd257458e840bab0a1937cb2e634177f7c075e"
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
