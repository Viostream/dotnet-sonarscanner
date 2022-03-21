FROM mcr.microsoft.com/dotnet/sdk:6.0

LABEL "com.github.actions.name"="dotnet-sonarscanner"
LABEL "com.github.actions.description"="sonarscanner for dotnet core"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/Secbyte/dotnet-sonarscanner"
LABEL "homepage"="https://github.com/Secbyte/dotnet-sonarscanner"
LABEL "maintainer"="Joshua Duffy <mail@joshuaduffy.org>"


RUN \
    curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh \
    && chmod +x nodesource_setup.sh \
    && ./nodesource_setup.sh \
    && apt-get install nodejs \
    && dotnet tool install dotnet-sonarscanner --tool-path . --version 5.5.3

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
