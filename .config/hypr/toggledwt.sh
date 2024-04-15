#!/bin/sh

status=$(hyprctl -j getoption input:touchpad:disable_while_typing | jq .int)

if [[ $status -eq 0 ]]; then
	hyprctl keyword input:touchpad:disable_while_typing true >/dev/null
else
	hyprctl keyword input:touchpad:disable_while_typing false >/dev/null
fi
