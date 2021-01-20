# [LF_Zeroshot_DepthEstimation_TCI2020](https://ieeexplore.ieee.org/document/8961135)

### Overview
This algorithm takes in a light field image (synthetic or real-world), and computes depth for the central view with a CNN. Without ground-truth depth labels nor extra training data, the network can be trained on a single light field image and can be used for data captured by any camera models.

### Requirements
>Ubuntu 16.04

>Matlab 2017b (some files are compiled under it)

>Matconvnet

>Cuda, Cudnn

### Usage
1.Download the Matconvnet package from [here](http://www.vlfeat.org/matconvnet/).

Unzip it and copy it to the "Lib" folder. Then follow the MatConvNet installation instruction to set it up properly. Please compile MatConvNet with GPU and Cuda support to have the best performance. Otherwise, please set the appropriate flags in the "InitParam.m" file accordingly. A pre-complied GPU version with Cuda8.0 is provided.

2.Dowload the training and test data from [HCI dataset](http://hci-lightfield.iwr.uni-heidelberg.de/).

Unzip the data and put them to a certain folder and set the corresponding parameters in "InitParam.m". *Note that the network is trained on a single light field image, so put a single light field image in the corresponding train and test folder, respectively.*

3.Execute "main.m" to start training.

It will take several days for the network to converge on an Nvidia Geforce GTX 1080Ti.

### Citation
If you use this code for your research, please cite our papers.
```
@article{peng2020zeroshot,
	author={Jiayong Peng and Zhiwei Xiong and Yicheng Wang and Yueyi Zhang and Dong Liu},
	journal={IEEE Transactions on Computational Imaging}, 
	title={Zero-Shot Depth Estimation From Light Field Using A Convolutional Neural Network}, 
	year={2020},
	volume={6},
	pages={682-696},
	organization={IEEE}
}
```

### Version History
1.v1.0 -- Initial release (Jan. 2021)
