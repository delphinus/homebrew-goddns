class Goddns < Formula
  desc "Dynamic DNS Updater for Google Domains"
  homepage "https://github.com/delphinus/goddns"
  url "https://github.com/delphinus/goddns/archive/v1.1.1.tar.gz"
  sha256 "27941ef07c0a3c4ad01f3959f4a2b8b93456aac36ec28496f473f0c4c04bef44"
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
