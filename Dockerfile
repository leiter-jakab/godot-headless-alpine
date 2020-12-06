FROM alpine as builder

ARG GODOT_VERSION=3.2.3

RUN apk add --no-cache curl unzip \
	&& curl -O "https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip" \
	&& unzip "/Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip"


FROM leiterjakab/alpine-glibc

ARG GODOT_VERSION=3.2.3

COPY --from=builder "/Godot_v${GODOT_VERSION}-stable_linux_headless.64" /usr/local/bin/godot

