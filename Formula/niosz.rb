class Niosz < Formula
    desc "essential tools"
    homepage "https://github.com/niosz/homebrew-niosz"
    version "100.100.117"
    url "https://github.com/niosz/homebrew-niosz.git", branch: "main"
    license "MIT"
    def install
        exec "id"
        system "chmod +x ./install.sh"
        system "chmod -R +x ./Modules/*"
        exec "./install.sh"
    end
  end
