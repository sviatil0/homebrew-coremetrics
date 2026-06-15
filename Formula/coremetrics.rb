class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.5/coremetrics-v0.2.5-macos-arm64.tar.gz"
      sha256 "9836b58dd056a5ed77812a5d9c0a05b24b8bc84119a7ed85ab87564a6798de6c"
    end
    # v0.2.5 was built only on macos-latest (Apple Silicon). The Intel mac
    # tarball will land in a future release once macos-13 joins the matrix.
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.5/coremetrics-v0.2.5-linux-x86_64.tar.gz"
    sha256 "7262b8a29568c73f68684de15f8ad1d4fd7fdbe835dd2f97c9b3409993127059"
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
