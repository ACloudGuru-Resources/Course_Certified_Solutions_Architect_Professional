#!/bin/bash
# USAGE: watch_url <URL>
# DESCRIPTION: Repeatedly polls URL and displays the returned result

watch -n 1 curl -s $1