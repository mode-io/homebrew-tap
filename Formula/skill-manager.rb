class SkillManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/mode-io/skill-manager"
  license "MIT"
  version "0.3.1"
  preserve_rpath

  on_arm do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.3.1/skill-manager-v0.3.1-darwin-arm64.tar.gz"
    sha256 "004bc9e9197b681605dd4fb10b4a2e0d7876ac46f9d2bcc0654ff7a3ba2f0997"
  end

  on_intel do
    url "https://github.com/mode-io/skill-manager/releases/download/v0.3.1/skill-manager-v0.3.1-darwin-x64.tar.gz"
    sha256 "f46e612aef52de9f92bcf78241afde0a0808ceb275a5b12095fe513904a53d6c"
  end

  def install
    staged_root = (buildpath/"skill-manager").directory? ? buildpath/"skill-manager" : buildpath
    libexec.install staged_root.children
    bin.install_symlink libexec/"skill-manager" => "skill-manager"
  end

  test do
    output = shell_output("#{bin}/skill-manager --version")
    assert_match "0.3.1", output
  end
end
