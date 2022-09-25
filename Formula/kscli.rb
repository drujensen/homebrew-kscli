class Kscli < Formula
  desc "kscli utility will manage your Kakfa Schema Registry"
  homepage "https://github.com/drujensen/kscli"
  url "https://github.com/drujensen/kscli/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "edc0bc0e220020d7cb785ea888c68e410207deb75910db173007c480e8cbcf52"

  depends_on "rust"

  def install
    system "cargo", "build", "--release"
    system "mkdir", "-p", "#{prefix}/bin"
    system "cp", "target/release/kscli", "#{prefix}/bin/kscli"
  end

  test do
    output = shell_output("#{prefix}/bin/kscli --help")
    assert output.includes? "Kafka Schema Registry CLI"
  end
end
