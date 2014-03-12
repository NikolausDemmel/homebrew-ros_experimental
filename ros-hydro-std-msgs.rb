# This formula is generated, you should not edit it directly.
require 'formula'

class RosHydroStdMsgs < Formula
  homepage 'http://www.ros.org/wiki/std_msgs'
  url 'https://github.com/ros-gbp/std_msgs-release.git', :tag => 'release/hydro/std_msgs/0.5.8-0'
  version '0.5.8-0'

  # source repos often contain more than one package... not sure if we can handle this
  #head 'https://github.com/ros-gbp/std_msgs-release.git', :branch => 'hydro-devel'

  # FIXEM: these are build depends
  depends_on "ros-hydro-catkin"
  depends_on "ros-hydro-message-generation"

  depends_on "ros-hydro-message-runtime"

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
