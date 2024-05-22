FROM archlinux:latest

ENV UID=1000
ENV GID=1000
ARG BITCOIN_USER=bitcoind

RUN pacman -Syu --noconfirm 
RUN pacman -S bitcoin-daemon --noconfirm
RUN pacman -S sudo --noconfirm

# bitcoind creates already a bitcoin user and group
# so we name ours a bit different
RUN groupadd --gid ${GID} ${BITCOIN_USER}
RUN useradd --create-home -u ${UID} -g ${GID} ${BITCOIN_USER}

# sets uid gid on runtime to specified user
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8332 8333 18332 18333 18443 18444 38333 38332

RUN bitcoind -version | grep "Bitcoin Core version v${BITCOIN_VERSION}"

WORKDIR /home/${BITCOIN_USER}
VOLUME ["/home/${BITCOIN_USER}/.bitcoin"]
CMD ["bitcoind"]
