FROM golang:1.24.5

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod tidy

COPY . .


COPY wait-for-it.sh /app/wait-for-it.sh

RUN chmod +x /app/wait-for-it.sh

RUN go build -o main /app/main.go

RUN chmod +x main

EXPOSE 8080