FROM ubuntu:16.04
MAINTAINER Kay Hau <virtualda@gmail.com>

# Add the add-apt-repository command
RUN apt-get update && apt-get install -y --force-yes \
    apt-transport-https \
    curl=7.47.\* \
    software-properties-common

# Update the package lists
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository -y ppa:webupd8team/java && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"

# Install commonly used base packages
RUN apt-get update && apt-get install -y \
    build-essential=12.1\* \
    cmake=3.5.\* \
    docker-ce=17.06.\* \
    g++=4:5.3.\* \
    gcc=4:5.3.\* \
    git=1:2.7.\* \
    libatlas3-base=3.10.\* \
    libffi-dev=3.2.\* \
    libgeos++-dev=3.5.\* \
    libgeos-dev=3.5.\* \
    libgif-dev=5.1.\* \
    libhdf4-alt-dev=4.2.\* \
    libjasper1=1.900.\* \
    liblapack3=3.6.\* \
    libnetcdf-dev=1:4.4.\* \
    libpq-dev=9.5.\* \
    libproj-dev=4.9.\* \
    libssl-dev=1.0.\* \
    libxerces-c-dev=3.1.\* \
    make=4.\* \
    pandoc=1.16.\* \
    postgresql-9.5 \
    postgresql-client=9.5\* \
    python2.7-dev \
    python3.6-dev \
    python-dev=2.7.\* \
    python3-dev=3.5.\* \
    sendmail=8.15.\* \
    wget=1.17.\*

# Install pip via PyPA's recommended way rather than the outdated apt repos
# See: https://pip.pypa.io/en/stable/installing/
RUN curl https://bootstrap.pypa.io/get-pip.py -o ./get-pip.py && \
    python2.7 get-pip.py && \
    python3.6 get-pip.py

# Upgrade pip and install virtualenv
RUN python2.7 -m pip install -U pip virtualenvwrapper wheel && \
    python3.6 -m pip install -U pip virtualenvwrapper wheel

CMD ["/bin/bash"]
