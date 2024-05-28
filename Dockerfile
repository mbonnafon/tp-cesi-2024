# Build image in two stages
# 1st stage build the binary
FROM golang:1.22

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o tp-cesi .

# 2nd stage build alpine image
FROM alpine:3.13.5

RUN apk --update add ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY --from=0 /app/tp-cesi .

ENTRYPOINT ["./tp-cesi"]