#!/bin/bash

OUTPUT="$(/bin/pidof ssh)"
if [[ $? -ne 0 ]]; then
  echo Tunnel already closed!
else
  echo Killing SSH process with PID: $OUTPUT
  kill $OUTPUT
  echo Tunnel Closed!
fi
