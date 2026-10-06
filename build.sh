#!/bin/bash
# build.sh <tunnel-url>
#
# Two files, two readers. `current-url.txt` is the live tunnel hostname and is read
# by the API proxy on Vercel (coldreach-api-proxy) to find the gateway. `index.html`
# is what a person opening the stable link gets, and it now forwards to the fixed
# Vercel front end rather than to the tunnel, so the browser's origin never changes.
URL=$1
APP=https://coldreach-web.vercel.app
printf '%s\n' "$URL" > current-url.txt
cat > index.html <<HTML
<!doctype html>
<meta charset="utf-8">
<title>ColdReach test build</title>
<meta http-equiv="refresh" content="0; url=$APP">
<meta name="robots" content="noindex">
<style>body{font:16px/1.5 system-ui;background:#0b0c10;color:#f2f3f5;display:grid;place-items:center;min-height:100vh;margin:0}a{color:#f3dfb6}</style>
<p>Taking you to the current test build… <a href="$APP">$APP</a></p>
<script>location.replace("$APP")</script>
HTML
