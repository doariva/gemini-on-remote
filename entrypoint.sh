#!/bin/sh

CMD=${@:-bash}

if [ -n "$TTYD_USER" ] && [ -n "$TTYD_PASS" ]; then
  exec ttyd -b $BASE_PATH --credential "$TTYD_USER:$TTYD_PASS" --writable tmux new-session -A -s shared-session "$CMD"
else
  exec ttyd -b $BASE_PATH --writable tmux new-session -A -s shared-session "$CMD"
fi
