FROM golang:1.16-alpine as builder

WORKDIR /go/src/app

COPY hello.go hello.go

RUN go build hello.go

FROM scratch

WORKDIR /app

COPY --from=builder /go/src/app/hello .

CMD [ "./hello" ]