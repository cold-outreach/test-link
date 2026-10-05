#!/bin/bash
# build.sh <url> — writes index.html forwarding to the current tunnel.
URL=$1
cat > index.html <<HTML
<!doctype html>
<meta charset="utf-8">
<title>ColdReach test build</title>
<meta http-equiv="refresh" content="0; url=$URL">
<meta name="robots" content="noindex">
<style>body{font:16px/1.5 system-ui;background:#0b0c10;color:#f2f3f5;display:grid;place-items:center;min-height:100vh;margin:0}a{color:#f3dfb6}</style>
<p>Taking you to the current test build… <a href="$URL">$URL</a></p>
<script>location.replace("$URL")</script>
HTML
