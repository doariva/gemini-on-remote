# gemini-on-remote

This project provides a web-based terminal interface for running Gemini CLI on a remote server. 

It uses ttyd and tmux to allow persistent, shareable terminal sessions accessible from any web browser.

<img width="1904" height="1129" alt="ScreenShot 2025-07-19 15 50 10" src="https://github.com/user-attachments/assets/380058d0-995b-477d-8795-8499c056ce08" />

## Features
- 🧠 Run Gemini CLI from your browser
- 🔄 Persistent sessions via tmux — your session stays active even if you close your browser
- 🔐 Optional Basic Authentication with TTYD_USER and TTYD_PASS
- ⚙️ Pass any command as the container's startup command

## Usage

```bash
docker compose up -d
```

By default, the container will start Gemini CLI (gemini) in a shared tmux session. Open your browser and go to:

```
http://<your-server-ip>:7681
```

### Custom Command
To run a different command instead of gemini, set it via the command field in docker-compose.yaml:
```yaml
command: python3
```
This runs python3 in the shared terminal session.

### Basic Authentication

| Variable | Description |
| ---- | ---- |
| TTYD_USER | Username for Basic Auth (optional) |
| TTYD_PASS | Password for Basic Auth (optional) |

```yaml
    environment:
      TTYD_USER: user
      TTYD_PASS: pass123
```

<img width="1904" height="1129" alt="ScreenShot 2025-07-19 15 49 51" src="https://github.com/user-attachments/assets/467f4e85-ee14-4b86-806c-592aee53c9b8" />


## Notes
tmux ensures that your session is always running on the server — no need to keep your local machine on.

Multiple users can connect to the same session (if credentials are shared).

<img width="1792" height="1020" alt="ScreenShot 2025-07-19 15 54 33" src="https://github.com/user-attachments/assets/f6549388-7cad-401d-b342-505186ec58f1" />
