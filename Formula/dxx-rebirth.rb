class DxxRebirth < Formula
  desc "An enhanced source port of the Descent 1 and Descent ][ engines"
  homepage "https://www.dxx-rebirth.com"
  version "20211021"
  url "https://www.dxx-rebirth.com/download/dxx/rebirth/dxx-rebirth_#{version}-src.tar.xz"
  sha256 "ec0588d9ed394eaa6230311311a2c3d3997e7697408a664fd057717d53e2db9c"
  head "https://github.com/dxx-rebirth/dxx-rebirth.git"
  license "GPL-3.0-only"

  depends_on "scons" => :build
  depends_on "pkg-config" => :build
  depends_on "dylibbundler" => :build
  depends_on "sdl"
  depends_on "sdl_image"
  depends_on "sdl_mixer"
  depends_on "libpng"
  depends_on "physfs"

  def install
    system "scons", "macos_add_frameworks=False"
    prefix.install "D1X-Rebirth.app"
    prefix.install "D2X-Rebirth.app"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test dxx-rebirth`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "D1X-Rebirth.app/Contents/MacOS/d1x-rebirth -h"
  end
end
