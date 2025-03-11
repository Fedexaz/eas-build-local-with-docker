# Use Ubuntu
FROM ubuntu:22.04

# Config env
ENV DEBIAN_FRONTEND=noninteractive

# Install Java 17 and another dependencies
RUN apt update && apt install -y \
    openjdk-17-jdk \
    curl \
    unzip \
    git \
    build-essential \
    libssl-dev \
    libusb-1.0-0-dev \
    zlib1g-dev

# Install Node.js (v 18 LTS) and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install expo-cli and eas-cli
RUN npm install -g expo-cli@latest eas-cli@latest yarn

# Configure Android SDK
RUN mkdir -p /usr/local/android-sdk/cmdline-tools && \
    curl -o /usr/local/android-sdk/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip /usr/local/android-sdk/cmdline-tools.zip -d /usr/local/android-sdk/cmdline-tools && \
    rm /usr/local/android-sdk/cmdline-tools.zip && \
    mv /usr/local/android-sdk/cmdline-tools/cmdline-tools /usr/local/android-sdk/cmdline-tools/latest

# Set environment vars for Android SDK and Java
ENV ANDROID_HOME=/usr/local/android-sdk
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/33.0.2:$PATH

# Accept license and install SDK
RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

# Set workspace
WORKDIR /app
