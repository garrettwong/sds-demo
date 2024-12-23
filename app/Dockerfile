ARG BUILD_BASE=golang@sha256:70031844b8c225351d0bb63e2c383f80db85d92ba894e3da7e13bcf80efa9a37
ARG FINAL_BASE=gcr.io/distroless/static-debian12@sha256:5c7e2b465ac6a2a4e5f4f7f722ce43b147dabe87cb21ac6c4007ae5178a1fa58

# BUILD
FROM $BUILD_BASE as builder

# copy
WORKDIR /src/
COPY . /src/

# runtime args
ARG VERSION=v0.0.1-default

# args to env vars
ENV VERSION=${VERSION} GO111MODULE=on

# build
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath \
    -ldflags="-w -s -X main.version=${VERSION} -extldflags '-static'" \
    -a -mod vendor -o app

# RUN
FROM $FINAL_BASE
LABEL devo.version="${VERSION}"
COPY --from=builder /src/app /app/

WORKDIR /app
ENTRYPOINT ["./app"]
