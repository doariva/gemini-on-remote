FROM node:20-bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    tmux \
    wget \
    ca-certificates \
    locales \
  && sed -i 's/^# *en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
  && locale-gen \
  && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    TERM=xterm-256color

RUN wget -q https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.aarch64 -O /usr/local/bin/ttyd \
  && chmod +x /usr/local/bin/ttyd

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN npm install -g @google/gemini-cli

WORKDIR /app

ENTRYPOINT ["entrypoint.sh"]

# dummy! see entrypoint.sh
CMD ["bash"]
