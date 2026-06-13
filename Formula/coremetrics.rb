class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.1.1/coremetrics-v0.1.1-macos-arm64.tar.gz"
      sha256 "0569f03d2e3aed9419a7be0e431230bd8b02f0d51df0430476fb6efd0facaa7c"
    end
    # v0.1.1 was built only on macos-latest (Apple Silicon). The Intel mac
    # tarball will land in a future release once macos-13 joins the matrix.
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.1.1/coremetrics-v0.1.1-linux-x86_64.tar.gz"
    sha256 "a0bfdf1cda959417d2a3ea4b53fa7a8f24616cb91d51c38cbf991f458ec605f6"
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
