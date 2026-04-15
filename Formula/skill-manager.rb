class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.1.0"
  preserve_rpath

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-arm64.tar.gz"
    sha256 "a35759cadc6165344fa42508ec7a3c1f3e62f92892f0e27afef594f3411fc3e7"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.1.0/skill-manager-v0.1.0-darwin-x64.tar.gz"
    sha256 "e2c711a6becd31df21558fc766fb733cc6ad22bee0c76ad49f563cba4609e1c1"
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
