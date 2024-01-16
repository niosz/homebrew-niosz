class Boot < Formula
    desc "essential tools"
    homepage "https://github.com/niosz/homebrew-niosz"
    version "100.100.102"
    url "https://github.com/niosz/homebrew-niosz.git"
    license "MIT"
    def install
        system "ls -lrt"
        system "./install.sh"
    end
  end
