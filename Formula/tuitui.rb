class Tuitui < Formula
  desc "Terminal user interface for Jujutsu (jj) version control"
  homepage "https://github.com/frederickbeaulieu/tuitui"
  url "https://github.com/frederickbeaulieu/tuitui/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "301916a07d4b7d32e0ab3d35234bc80f47efdaae69eb4d670f1606b228e7f600"
  license "MIT"
  head "https://github.com/frederickbeaulieu/tuitui.git", branch: "main"

  depends_on "go" => :build
  depends_on "git-delta"
  depends_on "jj"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tuitui --version")
  end
end
