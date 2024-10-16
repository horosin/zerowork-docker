# Base image: use Ubuntu as a base
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    curl \
    git \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    firefox \
    dbus-x11 \
    x11-utils \
    xfce4-terminal \
    fonts-liberation \
    libappindicator3-1 \
    libnss3 \
    libxss1 \
    lsb-release \
    libx11-xcb1 \
    xdg-utils \
    gnupg2 \
    software-properties-common \
    && apt-get clean

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update && apt-get install -y google-chrome-stable

# Download and install ZeroWork .deb package
RUN wget https://zerowork-agent-releases.s3.amazonaws.com/public/linux/ZeroWork-1.1.50.deb -O /tmp/ZeroWork-1.1.50.deb \
    && apt-get install -y /tmp/ZeroWork-1.1.50.deb \
    && rm /tmp/ZeroWork-1.1.50.deb

# Set up VNC server (for remote desktop)
RUN apt-get install -y tigervnc-standalone-server

# Create a user and set up passwordless sudo
RUN useradd -ms /bin/bash user \
    && echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER user
WORKDIR /home/user

# Expose the VNC port
EXPOSE 5900

# Start XFCE, VNC, and ZeroWork agent when the container starts
CMD ["sh", "-c", "xfce4-session & x11vnc -display :0 -forever -nopw -create & /opt/ZeroWork/zerowork-agent &"]
