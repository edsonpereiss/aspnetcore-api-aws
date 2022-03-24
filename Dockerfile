# FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal
COPY output/* /app/
EXPOSE 80
ENTRYPOINT ASPNETCORE_URLS=http://*:80 dotnet /app/aspnetcore-api-aws.dll

# FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal AS base
# WORKDIR /app
# EXPOSE 5162

# ENV ASPNETCORE_URLS=http://+:5162

# # Creates a non-root user with an explicit UID and adds permission to access the /app folder
# # For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build
# WORKDIR /src
# COPY ["aspnetcore-api-aws.csproj", "./"]
# RUN dotnet restore "aspnetcore-api-aws.csproj"
# COPY . .
# WORKDIR "/src/."
# RUN dotnet build "aspnetcore-api-aws.csproj" -c Release -o /app/build

# FROM build AS publish
# RUN dotnet publish "aspnetcore-api-aws.csproj" -c Release -o /app/publish /p:UseAppHost=false

# FROM base AS final
# WORKDIR /app
# COPY --from=publish /app/publish .
# ENTRYPOINT ["dotnet", "aspnetcore-api-aws.dll"]
