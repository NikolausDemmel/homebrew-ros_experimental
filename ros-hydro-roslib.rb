require "formula"

class RosHydroRoslib < Formula
  homepage "http://www.ros.org/wiki/roslib"
  url "https://github.com/ros-gbp/ros-release/archive/release/hydro/roslib/1.10.9-0.tar.gz"
  version "1.10.9-0"
  sha1 "a9fe3bd5f62d2b95d483aa2c77ce0d2c3544d477"

  depends_on "boost" => :build

  depends_on "rospkg" => [:python, "rospkg"]
  depends_on "ros-hydro-catkin"  
  depends_on "ros-hydro-rospack"

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
