ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN curl -fsSL https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.15.2/heroic-2.15.2.x86_64.rpm \
        -o /tmp/heroic.rpm \
    && dnf install -y \
	    /tmp/heroic.rpm \
    && dnf clean all \
    && rm -rf /var/cache/yum \
    && rm -rf /tmp/heroic.rpm \
    && git config -f /etc/rdesktop/rdesktop.ini \
	rdesktop.title "Personal Heroic" \
    && git config -f /etc/rdesktop/rdesktop.ini \
	rdesktop.exec "heroic"

# ensure to become root for systemd
#ENTRYPOINT ["/sbin/init"]
