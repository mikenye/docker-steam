FROM jlesage/baseimage-gui:ubuntu-18.04

ENV APP_NAME="Steam" \
    XDG_CACHE_HOME=/steam/xdg/cache \
    XDG_CONFIG_HOME=/steam/xdg/config \
    XDG_DATA_HOME=/steam/xdg/data \
    XDG_RUNTIME_DIR=/tmp/run/user/app \
    APP_ICON_URL="https://raw.githubusercontent.com/mikenye/docker-steam/master/steam_icon.png"

RUN set -x && \
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y \
      sudo \
      software-properties-common \
      dbus \
      dbus-x11 \
      pciutils \
      xterm \
      pulseaudio \
      psmisc && \
    mkdir -p /steam && \
    echo "========== Setup sudoers ==========" && \
    echo "app    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "========== Install Steam Prereqs ==========" && \
    apt-get install -y --fix-broken \
      wget \
      gdebi-core \
      libgl1-mesa-dri:i386 \
      libgl1-mesa-glx:i386 \
      python \
      curl \
      python-apt \
      zenity \
      xdg-user-dirs-gtk && \
    echo "========== Install Steam ==========" && \
    cd /tmp && \
    wget http://media.steampowered.com/client/installer/steam.deb && \
    dpkg -i /tmp/steam.deb && \
    cd / && \
    echo "========== Fix for https://github.com/ValveSoftware/steam-for-linux/issues/5311 ==========" && \
    apt-get install -y --reinstall libnss3 && \
    echo "========== Fix for https://github.com/ValveSoftware/steam-for-linux/issues/3307 ==========" && \
    apt-get install -y libfontconfig1:i386 && \
    echo "========== Install Vulkan ==========" && \
    apt-get install -y \
      libvulkan1 \
      libvulkan1:i386 \
      mesa-vulkan-drivers \
      mesa-vulkan-drivers:i386 && \
    echo "========== Clean up ==========" && \
    apt-get autoremove -y && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

