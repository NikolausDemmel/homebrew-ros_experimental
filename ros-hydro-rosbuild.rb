# This formula is generated, you should not edit it directly.
require 'formula'

class RosHydroRosbuild < Formula
  homepage 'http://ros.org/wiki/rosbuild'
  url 'https://github.com/ros-gbp/ros-release.git', :tag => 'release/hydro/rosbuild/1.10.9-0'
  version '1.10.9-0'

  # source repos often contain more than one package... not sure if we can handle this
  #head 'https://github.com/ros-gbp/ros-release.git', :branch => 'hydro-devel'

  # FIXEM: these are build depends
  depends_on "pkg-config"
  depends_on "ros-hydro-catkin"

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

    system 'if [ -f "/usr/local/setup.sh" ]; then . "/usr/local/setup.sh"; fi && cmake . ' + args.join(" ") + " && make install"
  end
end
