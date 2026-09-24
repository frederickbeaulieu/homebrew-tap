class Tuitui < Formula
  desc "Terminal user interface for Jujutsu (jj) version control"
  homepage "https://github.com/frederickbeaulieu/tuitui"
  url "https://github.com/frederickbeaulieu/tuitui/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "86050af5fe0c412d939839d1cce2ce4b96c91bf6d97080f7c5d2a202c7d68cd4"
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
