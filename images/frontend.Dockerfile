# syntax=docker/dockerfile:1.3

ARG FRAPPE_VERSION
ARG ERPNEXT_VERSION

FROM naderelabed/assets-builder:${FRAPPE_VERSION} as assets

COPY repos apps

RUN install-app posawesome && \
    install-app wiki

FROM naderelabed/erpnext-nginx:${ERPNEXT_VERSION}

COPY --from=assets /out /usr/share/nginx/html
