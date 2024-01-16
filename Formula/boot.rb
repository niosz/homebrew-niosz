class Boot < Formula
    desc "essential tools"
    homepage "https://github.com/niosz/homebrew-niosz"
    version "100.100.101"
    url "https://github.com/niosz/homebrew-niosz.git"
    license "MIT"
    def install
        system "./install.sh"
    end
  end
