docker build -t dsosedov/impersonate-aspnet --no-cache .
docker run --rm -it -p 8080:80 dsosedov/impersonate-aspnet
