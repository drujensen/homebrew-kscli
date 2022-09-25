class Kscli < Formula
  desc "kscli utility will manage your Kakfa Schema Registry"
  homepage "https://github.com/drujensen/kscli"
  url "https://github.com/drujensen/kscli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "df6cd8580e76a3c1829d2bef35ccf733b2375489975df3cda36e072f4ac8203c"

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
