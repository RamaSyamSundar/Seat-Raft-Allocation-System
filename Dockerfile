FROM golang:1.25

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o seatraft-server ./cmd/server
RUN go build -o seatraft-client ./cmd/client

EXPOSE 50051

CMD ["./seatraft-server"]
