class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.0/coremetrics-v0.2.0-macos-arm64.tar.gz"
      sha256 "d4fb86e83f9230e3f55e3eb51c4f1a38730671853c4d0d0a07503c00f6836d66"
    end
    # v0.2.0 was built only on macos-latest (Apple Silicon). The Intel mac
    # tarball will land in a future release once macos-13 joins the matrix.
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.0/coremetrics-v0.2.0-linux-x86_64.tar.gz"
    sha256 "84d62bcc6eb4613561d8fa00cf7c5270e6a5c32837b41ab25bf7dfe55fb56f9e"
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
