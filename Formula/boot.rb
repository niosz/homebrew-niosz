class Boot < Formula
    desc "essential tools"
    homepage "https://github.com/niosz/homebrew-niosz"
    version "100.100.100"
    url "https://github.com/niosz/homebrew-niosz.git"
    license "MIT"
    def install
        system "echo '💾 installing visual studio code'"
        system "brew install --cask visual-studio-code"
    end
  end
