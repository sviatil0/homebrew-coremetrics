class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.1.0/coremetrics-v0.1.0-macos-arm64.tar.gz"
      sha256 "addf1c0a10a14e97ed1fa446d97b6f6b42ef7ad277a96ebc10be0f7bf1df93c9"
    end
    # v0.1.0 was built only on macos-latest (Apple Silicon). The Intel mac
    # tarball will land in v0.1.1 once the release workflow adds a macos-13
    # leg.
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.1.0/coremetrics-v0.1.0-linux-x86_64.tar.gz"
    sha256 "bccdfbbbb72c96143a34c0df6596a91b3fc5a9fc4a38ac4da40047d63d22f0ef"
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
    # SDL3 trio and that the lifecycle controls from upstream PR #5 work.
    system bin/"coremetrics", "--duration", "1"
  end
end
