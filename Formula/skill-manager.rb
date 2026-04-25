class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.2.0"
  preserve_rpath

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.2.0/skill-manager-v0.2.0-darwin-arm64.tar.gz"
    sha256 "3a3ee8d409865b9419eaeb000255ad6e13b8cf365183b85c2344f2501c68eed6"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.2.0/skill-manager-v0.2.0-darwin-x64.tar.gz"
    sha256 "aa0d6a0d54c9c5fcc170349a5cb20d817c0f9e377c792f4b95d0a69b05ef4516"
  end

  def install
    staged_root = (buildpath/"skill-manager").directory? ? buildpath/"skill-manager" : buildpath
    libexec.install staged_root.children
    bin.install_symlink libexec/"skill-manager" => "skill-manager"
  end

  test do
    output = shell_output("#{bin}/skill-manager --version")
    assert_match "0.2.0", output
  end
end
