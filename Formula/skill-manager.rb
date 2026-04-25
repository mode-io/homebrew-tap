class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.2.1"
  preserve_rpath

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.2.1/skill-manager-v0.2.1-darwin-arm64.tar.gz"
    sha256 "4155cbd5c2a0e51134746d3b97c1fecefa76eabb4d289661b20f63bd55d82c4b"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.2.1/skill-manager-v0.2.1-darwin-x64.tar.gz"
    sha256 "3ede3c286647f1c99b35dc291dd03ca608658d204bc9671d4816bb9b3239f2e5"
  end

  def install
    staged_root = (buildpath/"skill-manager").directory? ? buildpath/"skill-manager" : buildpath
    libexec.install staged_root.children
    bin.install_symlink libexec/"skill-manager" => "skill-manager"
  end

  test do
    output = shell_output("#{bin}/skill-manager --version")
    assert_match "0.2.1", output
  end
end
