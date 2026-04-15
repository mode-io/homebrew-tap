class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.1.0"
  preserve_rpath

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-arm64.tar.gz"
    sha256 "29055776e8f190db5ed721b4e97e2e97e67903fb7a8fd896ea797f33188a9caa"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-x64.tar.gz"
    sha256 "5b0a765ce92cde675575eabbc3d73f22915368673f5e1c8673314c6c6b9f094b"
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
