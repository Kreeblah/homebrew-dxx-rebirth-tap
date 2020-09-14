class DxxRebirth < Formula
  desc "An enhanced source port of the Descent 1 and Descent ][ engines"
  homepage "https://www.dxx-rebirth.com"
  version "20200828"
#  url "https://www.dxx-rebirth.com/download/dxx/rebirth/dxx-rebirth_#{version}-src.tar.xz"
#  sha256 "6cb932fab46359a7f154d4bcc0562c49bbfd3174d513966e191014708ac3c6a4"
  head "https://github.com/dxx-rebirth/dxx-rebirth.git"
  license "GPL-3.0-only"

  depends_on "scons" => :build
  depends_on "sdl"
  depends_on "sdl_image"
  depends_on "sdl_mixer"
  depends_on "libpng"
  depends_on "physfs"

  head do
    patch do
      url "https://github.com/Kreeblah/dxx-rebirth/commit/a36f6866dac0b58c586724d5013da44740ada727.patch"
      sha256 "33724bdb61362c90caf635c788753bb2a40db28905f08fa1277c5a1c5041a0af"
    end
  end

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
