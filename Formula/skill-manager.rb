class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.1.0"

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-arm64.tar.gz"
    sha256 "bc8c6f8420c7aa2a2c61d82f5c703f200e528310d2045c5252acbb287ff0b0d8"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-x64.tar.gz"
    sha256 "8b2d7a1dd5807c629513ac3c5ef5dbfa971ebbc103ec04db36f5a302613d8939"
  end

  def install
    libexec.install Dir["skill-manager/*"]
    bin.install_symlink libexec/"skill-manager" => "skill-manager"
  end

  test do
    output = shell_output("#{bin}/skill-manager --version")
    assert_match "0.1.0", output
  end
end
