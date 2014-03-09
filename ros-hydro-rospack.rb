require "formula"

class RosHydroRospack < Formula
  homepage "http://www.ros.org/wiki/catkin"
  url "https://github.com/ros-gbp/rospack-release/archive/release/hydro/rospack/2.1.23-0.tar.gz"
  version "2.1.23-0"
  sha1 "1b7d829febb2f90874f3edaaf602d4feb6b74be4"

  depends_on "ros-hydro-catkin" => :build

  depends_on :python
  depends_on "rosdep" => [:python, "rosdep2"]
  depends_on "catkin-pkg" => [:python, "catkin_pkg"]
  depends_on "boost"
  depends_on "tinyxml"
  depends_on "gtest"
  depends_on "pkg-config"

  def install
    args = std_cmake_args
    args.delete '-DCMAKE_BUILD_TYPE=None'
    args.delete_if {|s| s.match(/^-DCMAKE_INSTALL_PREFIX/) }
    args << "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    args << '-DCMAKE_BUILD_TYPE=Release'

    system "cmake", ".", *args
    system "make", "install"

    # remove things only installed by the catkin package
    (etc/"catkin/profile.d/05.catkin_make.bash").delete
    (etc/"catkin/profile.d/05.catkin_make_isolated.bash").delete
  end
end
