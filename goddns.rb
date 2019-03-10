class Goddns < Formula
  desc "Dynamic DNS Updater for Google Domains"
  homepage "https://github.com/delphinus/goddns"
  url "https://github.com/delphinus/goddns/archive/v1.0.5.tar.gz"
  sha256 "256c52934f7f29ddd6e72a53fba42ebafef5676743a5410b08f93bc49b6a42fe"
  head "https://github.com/delphinus/goddns.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

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
          <string>--keep-in-foreground</string>
          <string>-C</string>
          <string>#{etc}/goddns.toml</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
      </dict>
    </plist>
  EOS
  end
end
