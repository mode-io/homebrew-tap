class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.3.0"
  preserve_rpath

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.3.0/skill-manager-v0.3.0-darwin-arm64.tar.gz"
    sha256 "4d427e681cf138e28ba1ca72da32fb4cff0ea19d00b1895d4adf452f0d94a2b3"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.3.0/skill-manager-v0.3.0-darwin-x64.tar.gz"
    sha256 "a746882bfc4e1e5fa42abafd9fca6f6dfe7b7379bcc7ade22496366f5f9fadfe"
  end

  def install
    staged_root = (buildpath/"skill-manager").directory? ? buildpath/"skill-manager" : buildpath
    libexec.install staged_root.children
    bin.install_symlink libexec/"skill-manager" => "skill-manager"
  end

  test do
    output = shell_output("#{bin}/skill-manager --version")
    assert_match "0.3.0", output
  end
end
