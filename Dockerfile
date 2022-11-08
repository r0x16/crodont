FROM golang:1.19.1-bullseye AS builder

RUN apt-get update && apt-get install -y \
    git \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN go install github.com/cweill/gotests/gotests@latest
RUN go install github.com/fatih/gomodifytags@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install github.com/josharian/impl@latest
RUN go install github.com/haya14busa/goplay/cmd/goplay@latest
RUN go install honnef.co/go/tools/cmd/staticcheck@latest
RUN go install golang.org/x/tools/gopls@latest

RUN npm install -g nodemon

WORKDIR /var/lib/livego
COPY src/* .

WORKDIR /var/lib/crodont

ENTRYPOINT [ "/var/lib/livego/entrypoint.sh" ]