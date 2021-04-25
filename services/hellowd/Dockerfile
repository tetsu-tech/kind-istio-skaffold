FROM golang:1.12.9-alpine3.10 as builder
COPY main.go .
RUN go build -o app main.go
RUN pwd
RUN ls

FROM alpine:3.10

COPY --from=builder /go/app ./
# RUN pwd
# RUN ls

CMD ["./app"]
