FROM microsoft/dotnet:2.2-sdk-alpine AS build
WORKDIR /build

# Restore and build
COPY . ./
RUN dotnet restore

# Build decompiler (temporary workaround)
RUN dotnet publish -c Release -o ../lib/decompiler ICSharpCode.Decompiler.Console

# Decompile .NET 4.5 assembly
WORKDIR /build/lib
# RUN dotnet tool install ilspycmd -g
# RUN ilspycmd asm/UtilsLib45.dll -o src -t UtilsLib45.StringFunctions
RUN dotnet decompiler/ilspycmdfork.dll asm/UtilsLib45.dll -t UtilsLib45.StringFunctions -o src

# Build NET Standard assembly
RUN dotnet publish -c Release -o ../netstandard2.0 src

# Build .NET Core app
WORKDIR /build/NetCoreConsoleApp
RUN dotnet publish -c Release -o dist

# Runtime image
FROM microsoft/dotnet:2.2-runtime-alpine AS runtime
WORKDIR /app
COPY --from=build /build/NetCoreConsoleApp/dist ./
ENTRYPOINT ["dotnet", "NetCoreConsoleApp.dll"]

# docker build . -t consoleapp-2.2
# docker run -it --rm --name consoleapp consoleapp-2.2 sh
