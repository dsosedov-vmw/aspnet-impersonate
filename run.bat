docker build -t dsosedov/impersonate-aspnet .
docker run --rm -it -p 8080:80 dsosedov/impersonate-aspnet
