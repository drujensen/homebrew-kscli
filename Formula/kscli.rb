class Kscli < Formula
  desc "kscli utility will manage your Kakfa Schema Registry"
  homepage "https://github.com/drujensen/kscli"
  url "https://github.com/drujensen/kscli/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "7573f168cd8a111b850b00c15575488bc05464e4ca1949cae9e94934ef6180ac"

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
