FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ESAPI/ESAPI.csproj ESAPI/
RUN dotnet restore ESAPI/ESAPI.csproj
COPY . .
WORKDIR /src/ESAPI
RUN dotnet build ESAPI.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish ESAPI.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "ESAPI.dll"]
