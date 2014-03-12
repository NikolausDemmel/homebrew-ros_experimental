# This formula is generated, you should not edit it directly.
require 'formula'

class RosHydroRosComm < Formula
  homepage 'http://www.ros.org/wiki/ros_comm'
  url 'https://github.com/ros-gbp/ros_comm-release.git', :tag => 'release/hydro/ros_comm/1.10.2-0'
  version '1.10.2-0'

  # source repos often contain more than one package... not sure if we can handle this
  #head 'https://github.com/ros-gbp/ros_comm-release.git', :branch => 'hydro-devel'

  # FIXEM: these are build depends
  depends_on "ros-hydro-catkin"

  depends_on "ros-hydro-message-filters"
  depends_on "ros-hydro-ros"
  depends_on "ros-hydro-rosbag"
  depends_on "ros-hydro-rosconsole"
  depends_on "ros-hydro-roscpp"
  depends_on "ros-hydro-rosgraph"
  depends_on "ros-hydro-rosgraph-msgs"
  depends_on "ros-hydro-roslaunch"
  depends_on "ros-hydro-roslisp"
  depends_on "ros-hydro-rosmaster"
  depends_on "ros-hydro-rosmsg"
  depends_on "ros-hydro-rosnode"
  depends_on "ros-hydro-rosout"
  depends_on "ros-hydro-rosparam"
  depends_on "ros-hydro-rospy"
  depends_on "ros-hydro-rosservice"
  depends_on "ros-hydro-rostest"
  depends_on "ros-hydro-rostopic"
  depends_on "ros-hydro-roswtf"
  depends_on "ros-hydro-std-srvs"
  depends_on "ros-hydro-topic-tools"
  depends_on "ros-hydro-xmlrpcpp"

  option 'with-debug-info', "Build with debug info."

  def install
    args = std_cmake_args
    args.delete '-DCMAKE_BUILD_TYPE=None'
    args.delete_if {|s| s.match(/^-DCMAKE_INSTALL_PREFIX/) }
    args << "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    if build.with? "debug-info"
      args << '-DCMAKE_BUILD_TYPE=RelWithDebInfo'
    else
      args << '-DCMAKE_BUILD_TYPE=Release'
    end
    args << '-DCATKIN_BUILD_BINARY_PACKAGE=1'

    system "cmake", ".", *args
    system "make", "install"
  end
end
