class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.1.0"
  preserve_rpath

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-arm64.tar.gz"
    sha256 "e4f8eb666eb2440ec14544765149076ad83fec4e5b2d51e137509a749b2ee4b6"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-x64.tar.gz"
    sha256 "f5c3dae8bccba11c47b3939c4d1ff283db57ab0a670ac7701b5305b7bcd6f2be"
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
