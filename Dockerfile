FROM lopsided/archlinux

ENV UID=1000
ENV GID=1000

# bitcoind creates already a bitcoin user and group
# so we name ours a bit different
ARG BITCOIN_USER=bitcoind

# try to reduce size a bit but we are limited here since the archlinux base image is 400MB
RUN pacman -Syu --noconfirm sudo bitcoin-daemon && \
    pacman -Scc --noconfirm

# create user
RUN groupadd --gid ${GID} ${BITCOIN_USER} && \
    useradd --create-home -u ${UID} -g ${GID} ${BITCOIN_USER}

# sets uid gid on runtime to specified user
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8332 8333 18332 18333 18443 18444 38333 38332

WORKDIR /home/${BITCOIN_USER}
VOLUME ["/home/${BITCOIN_USER}/.bitcoin"]
CMD ["bitcoind"]
