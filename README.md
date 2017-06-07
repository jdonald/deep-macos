# Deep macOS

## An example of running deep neural-net image classifier in torch

### Installing torch
```
Clone [torch](http://torch.ch/) distribution:
```
git clone https://github.com/torch/distro.git ~/torch --recursive
```
cd ~/torch
./install.sh
```
After ./install.sh is finished - it will ask if you want to update .bashrc to include call to initialize torch environment every time you login. If you  don't want it, you will have to execute command `. ~/torch/install/bin/torch-activate` before you will be able to lauch th. 

### Running MNIST digit classifier from torch demos
You can install various torch example from https://github.com/torch/demos, here is an output from MNIST digit classieifer training session:

```
bash-3.2:~/src/demos/train-a-digit-classifier $ th train-on-mnist.lua 
<torch> set nb of threads to 4	
<mnist> using model:	
nn.Sequential {
  [input -> (1) -> (2) -> (3) -> (4) -> (5) -> (6) -> (7) -> (8) -> (9) -> (10) -> output]
  (1): nn.SpatialConvolutionMM(1 -> 32, 5x5)
  (2): nn.Tanh
  (3): nn.SpatialMaxPooling(3x3, 3,3, 1,1)
  (4): nn.SpatialConvolutionMM(32 -> 64, 5x5)
  (5): nn.Tanh
  (6): nn.SpatialMaxPooling(2x2, 2,2)
  (7): nn.Reshape(576)
  (8): nn.Linear(576 -> 200)
  (9): nn.Tanh
  (10): nn.Linear(200 -> 10)
}
<warning> only using 2000 samples to train quickly (use flag -full to use 60000 samples)	
<mnist> loading only 2000 examples	
<mnist> done	
<mnist> loading only 1000 examples	
<mnist> done	
<trainer> on training set:	
<trainer> online epoch # 1 [batchSize = 10]	
 [===================>.................... 471/2000 ....................................]  ETA: 2m20s | Step: 92ms      
```

### Installing deep-macos
```
git clone https://github.com/jdonald/deep-macos 
```
After that you can launch `download_net.sh` script to download the pretrained NIN network ( based on https://gist.github.com/szagoruyko/0f5b4c5e2d2b18472854 ) to your `$HOME` path. **WARNING** pretrained network is 33Mb file!

You must install a **camera** luarocks package tweaked to work on macOS.
```
luarocks install https://raw.githubusercontent.com/jdonald/lua---camera/master/camera-1.1-0.rockspec
```

#### Running 
To run on a single image: `th test_single.lua <path to your image>` 
To run continious classification using frames from camera ( I recommend using external USB camera) :
```
nohup th -ldisplay.start 8000 0.0.0.0 & 
th camera_interface.lua
```
Then open web browser and point to to location http://localhost:8000

#### Setup 
![Camera and test object](https://cloud.githubusercontent.com/assets/628822/21299836/637e738a-c56d-11e6-80a4-c20605527d89.jpg)

#### Output 
![Example 1](https://cloud.githubusercontent.com/assets/628822/21299835/637e6700-c56d-11e6-9c01-8e600417ac4d.jpg)

![Example 2](https://cloud.githubusercontent.com/assets/628822/21299834/637e11ce-c56d-11e6-82e1-c78ebf69004b.jpg)

![Example 3](https://cloud.githubusercontent.com/assets/628822/21299833/637df9b4-c56d-11e6-8f06-6c4e22f45957.jpg)

