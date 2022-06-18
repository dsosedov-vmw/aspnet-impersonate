docker build -t dsosedov/impersonate-aspnet .
docker run --rm -it -p 8000:8080 dsosedov/impersonate-aspnet
