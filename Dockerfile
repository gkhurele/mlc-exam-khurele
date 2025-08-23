FROM jenkins/jenkins:lts

USER root

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip libicu-dev \
    && rm -rf /var/lib/apt/lists/*

# Install .NET SDK 6
RUN mkdir -p /usr/share/dotnet \
    && wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh \
    && bash /tmp/dotnet-install.sh --channel 6.0 --install-dir /usr/share/dotnet

ENV PATH="${PATH}:/usr/share/dotnet"

USER jenkins
