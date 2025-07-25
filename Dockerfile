FROM golang:1.24.5

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod tidy

COPY . .

RUN go build -o main /app/main.go

RUN chmod +x main

EXPOSE 8080

CMD ["./main"]