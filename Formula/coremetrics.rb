class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.1/coremetrics-v0.2.1-macos-arm64.tar.gz"
      sha256 "5e318fc01df061aab20a3e7e2bae5f97382f8aa2c52cd2c13fc744495fe0e9e6"
    end
    # v0.2.1 was built only on macos-latest (Apple Silicon). The Intel mac
    # tarball will land in a future release once macos-13 joins the matrix.
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.1/coremetrics-v0.2.1-linux-x86_64.tar.gz"
    sha256 "6aa97bb1d8d9b7b8b18f4b2493ce3f1a9776615ff07a078d9a3f4cde815953f6"
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
    # Smoke test: --duration 1 launches the live UI and exits cleanly in
    # ~1 second. Confirms the binary is linkable against the depends_on
    # SDL3 trio and that the lifecycle controls work.
    system bin/"coremetrics", "--duration", "1"
  end
end
