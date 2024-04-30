# I am a very opinionated person when it comes to stuff that
#   I download on my laptop, so instead I decided to make a
#   docker file to download and run everything on. I hope this
#   does not take away from my grade. Thanks for this course
#   and the ability to show off my DevOps skills.

FROM ubuntu:24.04
WORKDIR /actions-runner

RUN apt update && apt upgrade -y
RUN echo "8" "40" | apt install -y python3 python-is-python3 curl dotnet-sdk-8.0 python3-pip ca-certificates gnupg npm

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN apt update
RUN npm install pm2 -g

RUN mkdir actions-runner && cd actions-runner
RUN curl -o actions-runner-linux-x64-2.316.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.0/actions-runner-linux-x64-2.316.0.tar.gz

RUN tar xzf ./actions-runner-linux-x64-2.316.0.tar.gz

ARG GITHUB_REPO
ARG GITHUB_TOKEN
ENV RUNNER_ALLOW_RUNASROOT=True
RUN echo ${GITHUB_REPO}
RUN echo ${GITHUB_TOKEN}
RUN echo ${RUNNER_ALLOW_RUNASROOT}
RUN ./config.sh --url ${GITHUB_REPO} --token ${GITHUB_TOKEN} --unattended
ENTRYPOINT [ "/actions-runner/run.sh" ]
