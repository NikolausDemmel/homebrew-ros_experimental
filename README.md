# homebrew-ros_experimental

homebrew-ros_experimental is a testing ground for exploring the idea of
automatically serving ROS via homebrew by generating formulae with bloom.

## Usage

### 1. Install

This currently only works if homebrew is installed in /usr/local

    brew tap NikolausDemmel/ros_experimental
    brew install ros-hydro-catkin
    # manually create symlinks to the setup scripts in /usr/local/
    sh /usr/local/Library/Taps/nikolausdemmel-ros_experimental/create-links-catkin.sh
    brew install ros-hydro-ros-base
    # wait... dependecy resolution of homebrew does not scale at all
    source /usr/local/setup.bash
    # enjoy

## License

Code is under the [BSD 2 Clause (NetBSD) license][license].


[license]:https://github.com/NikolausDemmel/homebrew-ros_experimental/blob/master/LICENSE
