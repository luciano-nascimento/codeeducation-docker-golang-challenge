FROM golang:1.15 AS builder

WORKDIR /go/src/app

COPY . .

# Build the Go app
RUN go build -o main -ldflags="-s -w" .

CMD ["./main"]

FROM scratch

WORKDIR /app
COPY --from=builder /go/src/app/main .

CMD ["./main"]