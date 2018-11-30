# LF_Unsupervised_DisparityEstimation_3DV2018
The source code for "Unsupervised Depth Estimation from Light Field Using a Convolutional Neural Network"
J. Peng, Z. Xiong, D. Liu and X. Chen, "Unsupervised Depth Estimation from Light Field Using a Convolutional Neural Network," 2018 International Conference on 3D Vision (3DV), Verona, 2018, pp. 295-303.

### Overview
This alogorithm takes in a light field image (synthetic or real-world) with 7*7 angular resolution, and compute depth for the central view. The network is trained in a unsupervised manner, which requires no groundtruth depth label, and can be used for data captured by any camera models.

### Requirements
>Matlab
>Matconvnet
>Cuda, Cudnn

### Usage
1.Download the Matconvnet package from [here](http://www.vlfeat.org/matconvnet/).

Unzip it and copy it to the "Lib" folder. Then follow the MatConvNet installation instruction to set it up properly. Please compile MatConvNet with GPU and Cuda support to have the best performance. Otherwise, please set the appropriate flags in the "InitParam.m" file accordingly. A pre-complied GPU version with Cuda8.0 is provided.

2.Dowload the training and test data from [HCI dataset](http://hci-lightfield.iwr.uni-heidelberg.de/).

Unzip the data, split them into 'training' and 'testing' and put them to a certain folder and set the corresponding parameters in "InitParam.m".

Here you can also use your own data, which should be in PNG format and change parameters accordingly.

3.Execute "PrepareData.m" to prepare training and testing code.

The training and testing data are stored as .h files, which the training code needs. Note the h5 fils are large.

4.Execute "main.m" to start training.

It will take several days to converge for the network on Nvidia Geforce GTX 1080Ti. And the tests are integrated in training procedure (you can also test solely). Corresponding curves are provided.

###Citation
If you use this code for your research, please cite our papers.
```
@inproceedings{peng2018unsupervised,
  title={Unsupervised Depth Estimation from Light Field Using a Convolutional Neural Network},
  author={Peng, Jiayong and Xiong, Zhiwei and Liu, Dong and Chen, Xuejin},
  booktitle={2018 International Conference on 3D Vision (3DV)},
  pages={295--303},
  year={2018},
  organization={IEEE}
}
```

###Version History
1.v1.0 -- Initial release (Nov. 2018)