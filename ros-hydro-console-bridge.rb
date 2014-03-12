# This formula is generated, you should not edit it directly.
require 'formula'

class RosHydroConsoleBridge < Formula
  homepage 'https://github.com/ros/console_bridge'
  url 'https://github.com/ros-gbp/console_bridge-release.git', :tag => 'release/hydro/console_bridge/0.2.4-1'
  version '0.2.4-0'

  # source repos often contain more than one package... not sure if we can handle this
  #head 'https://github.com/ros-gbp/console_bridge-release.git', :branch => 'hydro-devel'

  # FIXEM: these are build depends
  depends_on "boost"
  depends_on "cmake"

  depends_on "boost"
  depends_on "ros-hydro-catkin"

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
