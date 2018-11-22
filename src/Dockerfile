# hadolint ignore=DL3007
FROM smartdevs/debian-stretch:latest
ARG DEBIAN_FRONTEND=noninteractive

ARG SHELLCHECK_VERSION=0.4.4-4
ARG SHELLCHECK_RUNTIME_REQUIREMENTS="libc6"
ARG SHELLCHECK_BUILD_REQUIREMENTS="curl"

# hadolint ignore=DL4006,DL3008,SC2086,DL3015
RUN set -Eeu; \
    apt-get update -y; \
    apt-get install -y shellcheck=${SHELLCHECK_VERSION}; \
    apt-get install -y ${SHELLCHECK_RUNTIME_REQUIREMENTS:-} ${SHELLCHECK_EXTRA_RUNTIME_REQUIREMENTS:-} ${SHELLCHECK_BUILD_REQUIREMENTS} ${SHELLCHECK_EXTRA_BUILD_REQUIREMENTS:-}; \
    apt-mark auto ${SHELLCHECK_BUILD_REQUIREMENTS} ${SHELLCHECK_EXTRA_BUILD_REQUIREMENTS:-}; \
    curl -o /usr/local/bin/gitlab-helper -s https://s3.eu-central-1.amazonaws.com/valmano-gitlab-helper/gitlab-helper; \
    chmod +x /usr/local/bin/gitlab-helper; \
    apt-get purge --auto-remove -y; \
    dpkg -la | awk '{print $2}' | grep '\-dev' || true | xargs --no-run-if-empty apt-get remove -y;\
    apt-get clean; \
    apt-get --yes --quiet autoremove --purge; \
    find /var/log -type f -print0 | xargs -0 truncate -s0; \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/doc/* \
        /usr/share/groff/* \
        /usr/share/info/* \
        /usr/share/linda/* \
        /usr/share/lintian/* \
        /usr/share/man/*/* \
        ;
