# Scripts installation

If you are using Pi-Star, please expand your filesystem:

    rpi-rw
    sudo pistar-expand
    sudo reboot

Install toolchain, tools and source code for STM32F4 family:

    cd /tmp
    curl -OL https://raw.github.com/juribeparada/MMDVM_bin/master/scripts/inst_buildtools_f4.sh
    chmod +x inst_buildtools_f4.sh
    ./inst_buildtools_f4.sh
    cd ~/MMDVM

Install toolchain, tools and source code for STM32F7 family:

    cd /tmp
    curl -OL https://raw.github.com/juribeparada/MMDVM_bin/master/scripts/inst_buildtools_f7.sh
    chmod +x inst_buildtools_f7.sh
    ./inst_buildtools_f7.sh
    cd ~/MMDVM
