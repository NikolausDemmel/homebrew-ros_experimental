# This formula is generated, you should not edit it directly.
require 'formula'

class RosHydroCatkin < Formula
  homepage 'http://www.ros.org/wiki/catkin'
  url 'https://github.com/ros-gbp/catkin-release.git', :tag => 'release/hydro/catkin/0.5.86-0'
  version '0.5.86-0'

  # source repos often contain more than one package... not sure if we can handle this
  #head 'https://github.com/ros-gbp/catkin-release.git', :branch => 'hydro-devel'

  # FIXEM: these are build depends
  #depends_on "argparse" => :python
  #depends_on "catkin-pkg" => :python
  #depends_on "empy" => :python
  #depends_on "nose" => :python
  depends_on "cmake"
  depends_on "gtest"

  #depends_on "argparse" => :python
  #depends_on "catkin-pkg" => :python
  #depends_on "empy" => :python
  #depends_on "nose" => :python
  depends_on "cmake"
  depends_on "gtest"

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
#    args << '-DCATKIN_BUILD_BINARY_PACKAGE=1'

    system 'if [ -f "/usr/local/setup.sh" ]; then . "/usr/local/setup.sh"; fi && cmake . ' + args.join(" ") + " && make install"
  end
end
