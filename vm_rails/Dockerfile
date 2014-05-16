# ruby2.1 dev
#
# VERSION               0.0.1

FROM phusion/baseimage:0.9.10

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# my build instructions...

# Set the software sources to the fastest server.
ADD sources.list /etc/apt/sources.list
RUN apt-get update

# install ca-certificates
RUN apt-get install -q -y ca-certificates

# install ruby
RUN \curl -sSL https://get.rvm.io | bash -s
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install ruby-2.1"
RUN /bin/bash -l -c "rvm use --default ruby-2.1"

# set gem sources to ruby.taobao.org
RUN /bin/bash -l -c "gem sources --remove https://rubygems.org/"
RUN /bin/bash -l -c "gem sources -a https://ruby.taobao.org/"

# install bundler
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# install tools
RUN apt-get install -q -y git vim

# Add ssh keys
ADD docker_vm.pub /tmp/my_key
RUN cat /tmp/my_key >> /root/.ssh/authorized_keys && rm -f /tmp/my_key

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

