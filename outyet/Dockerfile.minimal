FROM golang:1.9.4
# Build Image

COPY . /go/src/outyet
WORKDIR /go/src/outyet

ENV CGO_ENABLED=0
ENV GOOS=linux

RUN go get -v -d && \
    go install -v && \
    go test -v && \
    go build -ldflags "-s" -a -installsuffix cgo -o outyet .

FROM scratch
# Deploy Image

WORKDIR /
COPY --from=0 /go/src/outyet/outyet .
COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

EXPOSE 18088

CMD ["/outyet", "-version", "1.9.4", "-poll", "600s", "-http", ":18088"]

