require "formula"

class RosHydroCatkin < Formula
  homepage "http://www.ros.org/wiki/catkin"
  url "https://github.com/ros-gbp/catkin-release/archive/release/hydro/catkin/0.5.86-0.tar.gz"
  version "0.5.86-0"
  sha1 "a5cf127b78d54c665586be2434aece917bae064e"

  depends_on "cmake"
  depends_on "empy" => [:python, "em"]
  depends_on "catkin-pkg" => [:python, "catkin_pkg"]
  depends_on "argparse" => :python
  depends_on "gtest"
  depends_on "nose" => :python

  def install
    args = std_cmake_args
    args.delete '-DCMAKE_BUILD_TYPE=None'
    args.delete_if {|s| s.match(/^-DCMAKE_INSTALL_PREFIX/) }
    args << "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    args << '-DCMAKE_BUILD_TYPE=Release'

    system "cmake", ".", *args
    system "make", "install"
  end
end
