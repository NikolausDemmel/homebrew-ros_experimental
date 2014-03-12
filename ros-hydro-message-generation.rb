# This formula is generated, you should not edit it directly.
require 'formula'

class RosHydroMessageGeneration < Formula
  homepage 'http://ros.org/wiki/message_generation'
  url 'https://github.com/ros-gbp/message_generation-release.git', :tag => 'release/hydro/message_generation/0.2.10-0'
  version '0.2.10-0'

  # source repos often contain more than one package... not sure if we can handle this
  #head 'https://github.com/ros-gbp/message_generation-release.git', :branch => 'hydro-devel'

  # FIXEM: these are build depends
  depends_on "ros-hydro-catkin"

  depends_on "ros-hydro-gencpp"
  depends_on "ros-hydro-genlisp"
  depends_on "ros-hydro-genmsg"
  depends_on "ros-hydro-genpy"

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