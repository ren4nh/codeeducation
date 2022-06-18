FROM golang:1.18.3-alpine AS builder

WORKDIR /app

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o .

FROM scratch
WORKDIR /app
COPY --from=builder /app .


CMD [ "./hello" ]