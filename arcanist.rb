require "formula"

class Arcanist < Formula
  homepage "http://phabricator.org/"
  head "https://github.com/uber/arcanist.git"

  resource "libphutil" do
    url "https://github.com/phacility/libphutil.git"
  end

  def install
    (prefix/"libphutil").install resource("libphutil")

    (prefix/"arcanist").install %w{bin externals resources scripts src}
    bin.install_symlink prefix + "arcanist/bin/arc"
  end

  test do
    system bin/"arc", "help"
  end

  def caveats
    <<-EOS.undent
    Arcanist will be unable to update itself via the normal means (`arc update`).
    To update Arcanist, use `brew reinstall arcanist --HEAD`.
    EOS
  end
end
