## Setup Instructions:

The following additional instructions apply specifically to this fork. FINN is very well documented in the official documentation. 

This official documentation page is a companion to the instructions below: [Getting Started](https://finn.readthedocs.io/en/latest/getting_started.html)
Thanks to [This Page](https://www.daiphys.com/portal/fpga/xilinx/tools/finn.html) for resolutions of some build/run errors related to package dependencies.

1. On a Linux Ubuntu Desktop installation, with about 400GB of free space, install docker to run without root.
2. Install Xilinx Vivado/Vitis 2022.2 using the Linux installer from [AMD](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2022-2.html). This will take a few hours depending on the host hardware and internet connection. This fork would work on version 2023.2 as well (Not extensively tested). If you need to change the version, update the .bashrc in step 3 below to point to your 2023.2 installation and also change XRT_DEB_VERSION in run_docker.sh and docker/Dockerfile.finn files to xrt_202320.2.16.204_22.04-amd64-xrt
3. Add the lines present in the setup_env_in_host_bashrc file  in this repo to the user's .bashrc file. Comment/Uncomment the board specific lines (Pynq-Z2 or ZCU104)
4. Open a terminal and create a folder called xilinx-finn (mkdir xilinx-finn)
5. Enter the folder (cd xilinx-finn)
6. Clone this FINN repository (git clone https://github.com/m21aie249/finn.git) and then move to the finn folder (cd finn)
7. Create a directory called .ssh (mkdir .ssh) This step is required before setting up the automatic ssh login and keygen for the Pynq-Z2 board.
8. Then follow these steps, remember to setup IP Address per your network: [PYNQ board first-time setup](https://finn.readthedocs.io/en/latest/getting_started.html#pynq-board-first-time-setup)
9. If you want to setup ZCU104, follow these additional steps, also, remember to setup IP Address per your network: [ZCU104 Setup Guide](https://pynq.readthedocs.io/en/v2.5.1/getting_started/zcu104_setup.html)
10. Run this docker script (./run_docker.sh). This will build the container in about 20 minutes and then present a prompt when successful. 
11. Further instructions and testing commands are included in the official documentation (quicktest full). Full FINN testcases suite would take 2 days to complete on a standard laptop. It is worthwhile running it once alongwith the Pynq-Z2/ZCU104 board to ensure everything is working correctly.


## <img src=https://raw.githubusercontent.com/Xilinx/finn/github-pages/docs/img/finn-logo.png width=128/> Fast, Scalable Quantized Neural Network Inference on FPGAs



<img align="left" src="https://raw.githubusercontent.com/Xilinx/finn/github-pages/docs/img/finn-stack.PNG" alt="drawing" style="margin-right: 20px" width="250"/>

[![GitHub Discussions](https://img.shields.io/badge/discussions-join-green)](https://github.com/Xilinx/finn/discussions)
[![ReadTheDocs](https://readthedocs.org/projects/finn/badge/?version=latest&style=plastic)](http://finn.readthedocs.io/)

FINN is an experimental framework from Integrated Communications and AI Lab of AMD Research & Advanced Development to explore deep neural network inference on FPGAs.
It specifically targets <a href="https://github.com/maltanar/qnn-inference-examples" target="_blank">quantized neural
networks</a>, with emphasis on
generating dataflow-style architectures customized for each network.
The resulting FPGA accelerators are highly efficient and can yield high throughput and low latency.
The framework is fully open-source in order to give a higher degree of flexibility, and is intended to enable neural network research spanning several layers of the software/hardware abstraction stack.

We have a separate repository [finn-examples](https://github.com/Xilinx/finn-examples) that houses pre-built examples for several neural networks.
For more general information about FINN, please visit the [project page](https://xilinx.github.io/finn/) and check out the [publications](https://xilinx.github.io/finn/publications).

## Getting Started

Please see the [Getting Started](https://finn.readthedocs.io/en/latest/getting_started.html) page for more information on requirements, installation, and how to run FINN in different modes. Due to the complex nature of the dependencies of the project, **we only support Docker-based execution of the FINN compiler at this time**.

## What's New in FINN?

* Please find all news under [GitHub discussions Announcements](https://github.com/Xilinx/finn/discussions/categories/announcements).

## Documentation

You can view the documentation on [readthedocs](https://finn.readthedocs.io). Additionally, there is a series of [Jupyter notebook tutorials](https://github.com/Xilinx/finn/tree/main/notebooks), which we recommend running from inside Docker for a better experience.

## Community

We have [GitHub discussions](https://github.com/Xilinx/finn/discussions) where you can ask questions. You can use the GitHub issue tracker to report bugs, but please don't file issues to ask questions as this is better handled in GitHub discussions.

We also heartily welcome contributions to the project, please check out the [contribution guidelines](CONTRIBUTING.md) and the [list of open issues](https://github.com/Xilinx/finn/issues). Don't hesitate to get in touch over [GitHub discussions](https://github.com/Xilinx/finn/discussions) to discuss your ideas.

In the past, we also had a [Gitter channel](https://gitter.im/xilinx-finn/community). Please be aware that this is no longer maintained by us but can still be used to search for questions previous users had.


## Citation

The current implementation of the framework is based on the following publications. Please consider citing them if you find FINN useful.

    @article{blott2018finn,
      title={FINN-R: An end-to-end deep-learning framework for fast exploration of quantized neural networks},
      author={Blott, Michaela and Preu{\ss}er, Thomas B and Fraser, Nicholas J and Gambardella, Giulio and O’brien, Kenneth and Umuroglu, Yaman and Leeser, Miriam and Vissers, Kees},
      journal={ACM Transactions on Reconfigurable Technology and Systems (TRETS)},
      volume={11},
      number={3},
      pages={1--23},
      year={2018},
      publisher={ACM New York, NY, USA}
    }

    @inproceedings{finn,
    author = {Umuroglu, Yaman and Fraser, Nicholas J. and Gambardella, Giulio and Blott, Michaela and Leong, Philip and Jahre, Magnus and Vissers, Kees},
    title = {FINN: A Framework for Fast, Scalable Binarized Neural Network Inference},
    booktitle = {Proceedings of the 2017 ACM/SIGDA International Symposium on Field-Programmable Gate Arrays},
    series = {FPGA '17},
    year = {2017},
    pages = {65--74},
    publisher = {ACM}
    }

## Old version

We previously released an early-stage prototype of a toolflow that took in Caffe-HWGQ binarized network descriptions and produced dataflow architectures. You can find it in the [v0.1](https://github.com/Xilinx/finn/tree/v0.1) branch in this repository.
Please be aware that this version is deprecated and unsupported, and the main branch does not share history with that branch so it should be treated as a separate repository for all purposes.
