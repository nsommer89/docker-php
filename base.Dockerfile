FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN \
    apt update && \
    apt-get install -y --no-install-recommends curl wget vim