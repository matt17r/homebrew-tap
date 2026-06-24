class Hc < Formula
  desc "CLI for the healthchecks.io Management API"
  homepage "https://github.com/matt17r/healthchecks-cli"
  url "https://github.com/matt17r/healthchecks-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6d72d9c54f614972f74c0ae5e5d2d38f8a8a399587bc5e7513bf6c1eb0ae7235"
  license "MIT"
  head "https://github.com/matt17r/healthchecks-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    # std_go_args builds to #{bin}/hc; inject the version into main.version.
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    assert_match "hc #{version}", shell_output("#{bin}/hc version")
  end
end
