FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY Impersonate/*.csproj ./Impersonate/
COPY Impersonate/*.config ./Impersonate/
RUN nuget restore

# copy everything else and build app
COPY Impersonate/. ./Impersonate/
WORKDIR /app/Impersonate
RUN msbuild /p:Configuration=Release -r:False


FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/Impersonate/. ./
RUN "C:\\Windows\\System32\\inetsrv\\appcmd set app \"Default Web Site/\" /applicationPool:\".NET v4.5 Classic\""
