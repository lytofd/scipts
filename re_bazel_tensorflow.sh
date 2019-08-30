#/bin/bash
#this script used for rebazel tensorflow 
TENSORFLOW_BASE_DIR="/home/ly/tensorflow-mhb/tensorflow"
WHEEL_PATH="/tmp/tensorflow_pkg"
WHEEL_NAME="tensorflow-1.13.0rc0-cp27-cp27mu-linux_x86_64.whl"
cd $TENSORFLOW_BASE_DIR
bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
./bazel-bin/tensorflow/tools/pip_package/build_pip_package $WHEEL_PATH
cd $WHEEL_PATH
sudo pip2 uninstall tensorflow
sudo pip2 install $WHEEL_NAME
