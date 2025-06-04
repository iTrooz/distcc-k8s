FROM archlinux:latest

RUN pacman -Sy --noconfirm distcc gcc clang && \
    pacman -Scc --noconfirm && rm -rf /var/cache/pacman

EXPOSE 3632

ENTRYPOINT ["bash", "-c"]
