Install Arch Linux
==================

* https://wiki.archlinux.org/index.php/Beginners%27_Guide

* U盘安装
  - https://www.archlinux.org/download/
  - https://wiki.archlinux.org/index.php/USB_Installation_Media
  - dd bs=4M if=/home/zlx/iso/archlinux-2014.07.03-dual.iso of=/dev/sdb && sync


* 联网并安装
  - wifi-menu wlp3s0
  - vi /etc/pacman.d/mirrorlist
  - pacman -Syy
  - mkfs.ext4 /dev/sda1
  - mount /dev/sda1 /mnt
  - pacstrap /mnt base
  - genfstab -U -p /mnt >> /mnt/etc/fstab

* chroot到新系统设置
  - arch-chroot /mnt /bin/bash
  - vi /etc/locale.gen
  - locale-gen
  - ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  - hwclock --systohc --utc
  - echo z > /etc/hostname
  - vi /etc/hosts
  - pacman -S iw wpa_supplicant dialog
  - passwd
  - pacman -S grub os-prober
  - grub-install --target=i386-pc --recheck /dev/sda
  - grub-mkconfig -o /boot/grub/grub.cfg

* intel必花屏
  - https://wiki.archlinux.org/index.php/Beginners%27_Guide
  - If you are using an Intel video chipset and the screen goes blank during the boot process, the problem is likely an issue with Kernel mode setting. A possible workaround may be achieved by rebooting and pressing e over the entry that you are trying to boot (i686 or x86_64). At the end of the string type nomodeset and press Enter. Alternatively, try video=SVIDEO-1:d which, if it works, will not disable kernel mode setting. You can also try i915.modeset=0. See the Intel article for more information. 
  - 参考上述说明，在文件 /boot/grub/grub.cfg 中启动行加入 i915.modeset=0

* 收工
  - exit
  - reboot


* 装X
  - pacman -S xorg-server xorg-server-utils xorg-xinit xorg-twm xorg-xclock xterm
  - pacman -S xf86-video-intel xf86-video-vesa
  - pacman -S xf86-input-synaptics xf86-input-evdev

* 装fvwm及字体
  - pacman -S fvwm
  - pacman -S ttf-dejavu wqy-microhei-lite

* 装软件
  - pacman -S firefox
  - pacman -S fcitx thunar conky rtorrent mplayer smplayer vim gedit scrot gnome-screenshot evince mirage gimp gnome-terminal

* sound
  - https://wiki.archlinux.org/index.php/Alsa
  - pacman -S alsa-utils
  - alsamixer

* 各种配置
  - .xinitrc
  - .fvwm
  - .conkyrc
  - .bashrc
  - .vimrc
  - xterm configs
  - gnome-terminal 在窗口中配置
