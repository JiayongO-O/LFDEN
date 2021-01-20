# Light field depth estimation networks
### Overview

The official implementations for the light field depth estimation networks in following papers:

Jiayong Peng, Zhiwei Xiong, Dong Liu, Xuejin Chen. "[Unsupervised Depth Estimation from Light Field Using a Convolutional Neural Network](https://ieeexplore.ieee.org/document/8490980)". In 3DV 2018

Jiayong Peng, Zhiwei Xiong, Yicheng Wang, Yueyi Zhang, Dong Liu. "[Zero-shot Depth Estimation From Light Field Using A Convolutional Neural Network](https://ieeexplore.ieee.org/document/8961135)". IEEE Transactions on Computational Imaging 2020

----

### Requirements
>Ubuntu 16.04

>Matlab 2017b (some files are compiled under it)

>Matconvnet

>Cuda, Cudnn

----

### Usage
1.Download the Matconvnet package from [here](http://www.vlfeat.org/matconvnet/).

Unzip it and copy it to the "Lib" folder. Then follow the MatConvNet installation instruction to set it up properly. Please compile MatConvNet with GPU and Cuda support to have the best performance. Otherwise, please set the appropriate flags in the "InitParam.m" file accordingly. A pre-complied GPU version with Cuda8.0 is provided.

2.Dowload the training and test data from [HCI dataset](http://hci-lightfield.iwr.uni-heidelberg.de/).

Unzip the data and put them to a certain folder and set the corresponding parameters in "InitParam.m".

3.For *Unsupervised Depth Estimation from Light Field Using a Convolutional Neural Network (3DV2018)*, please change to './3DV2018' and execute corresponding files according to the README.md

4.For *Zero-shot Depth Estimation From Light Field Using A Convolutional Neural Network (TCI2020)*, please change to './TCI2020' and execute corresponding files according to the README.md

----

### Citation
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

-----

### Version History
1.v1.0 -- Initial release (Jan. 2021)
