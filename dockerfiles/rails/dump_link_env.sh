#! /bin/sh
env | grep _ >> /etc/environment
env | grep _ > /root/.ssh/environment
