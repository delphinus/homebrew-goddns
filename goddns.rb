class Goddns < Formula
  desc "Dynamic DNS Updater for Google Domains"
  homepage "https://github.com/delphinus/goddns"
  url "https://github.com/delphinus/goddns/archive/v1.1.0.tar.gz"
  sha256 "887a7ae94e87e4a1335c514c8f62fde30d5744cecf26fdd6782c891a7ad42ae1"
  head "https://github.com/delphinus/goddns.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "goddns"
    bin.install "goddns"
  end

  plist_options :startup => true

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/goddns</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
      </dict>
    </plist>
  EOS
  end
end
