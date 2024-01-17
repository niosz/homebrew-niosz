class Niosz < Formula
    desc "NiosZ Shell System (nn) Installation/Repair/Upgrade"
    homepage "https://github.com/niosz/homebrew-niosz"
    version "100.100.122"
    url "https://github.com/niosz/homebrew-niosz.git", branch: "main"
    license "MIT"
    def install
        system "chmod +x nninit.sh"
        bin.install "nninit.sh" => "nninit"
        <<~EOS
        brew nn package installed, now
        please run one of this commands:
            - "nninit"
            - "/usr/local/bin/nninit" 
        for finalize installation / repair existent or update
        EOS
    end
  end
