# ruby2.1 dev
#
# VERSION               0.0.1

FROM phusion/baseimage:0.9.10

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Change the timezone
RUN cp -f /usr/share/zoneinfo/PRC /etc/localtime

# Set the software sources to the fastest server.
ADD sources.list /etc/apt/sources.list
RUN apt-get update

# Install basic tools and libraries
RUN apt-get install -q -y ca-certificates git vim
RUN apt-get install -q -y libsqlite3-dev

# Install ruby dependencies
RUN apt-get update && apt-get install -y \
      build-essential \
      zlib1g-dev \
      libssl-dev \
      libreadline6-dev \
      libyaml-dev

# Install ruby from source and cleanup afterward (from murielsalvan/ruby)
ADD http://ruby.taobao.org/mirrors/ruby/ruby-2.1.2.tar.gz /tmp/
RUN cd /tmp && \
      tar -xzf ruby-2.1.2.tar.gz && \
      cd ruby-2.1.2 && \
      ./configure && \
      make && \
      make install && \
      cd .. && \
      rm -rf ruby-2.1.2 && \
      rm -f ruby-2.1.2.tar.gz

# Set the gem sources to ruby.taobao.org
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/

# Install bundler
RUN gem install bundler --no-ri --no-rdoc

# Add ssh authorized key
ADD docker_vm.pub /tmp/my_key
RUN cat /tmp/my_key >> /root/.ssh/authorized_keys && rm -f /tmp/my_key

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]