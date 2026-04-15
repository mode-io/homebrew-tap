class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.1.0"
  preserve_rpath

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-arm64.tar.gz"
    sha256 "ccd79defa3a93543236f5c249ade3711bf3c9b6d5b41e7f04e00de19109542eb"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-x64.tar.gz"
    sha256 "74c67e0b7066f341ed3e30ea49e224828013130e7f54d556628399d1baf7a3b5"
  end

  def install
    staged_root = (buildpath/"skill-manager").directory? ? buildpath/"skill-manager" : buildpath
    libexec.install staged_root.children
    bin.install_symlink libexec/"skill-manager" => "skill-manager"
  end

  test do
    output = shell_output("#{bin}/skill-manager --version")
    assert_match "0.1.0", output
  end
end
