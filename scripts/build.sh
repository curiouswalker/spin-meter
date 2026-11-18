#!/bin/bash
# wrap the artifact body into a standalone, home-screen-ready HTML document
cd "$(dirname "$0")/.."
ICON=$(python3 -I -c "
import base64
svg='''<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 180 180\"><rect width=\"180\" height=\"180\" fill=\"#151E27\"/><path d=\"M40 130 A62 62 0 1 1 140 130\" fill=\"none\" stroke=\"#E5862F\" stroke-width=\"16\" stroke-linecap=\"round\"/><path d=\"M90 98 L128 62\" stroke=\"#E5EBF1\" stroke-width=\"10\" stroke-linecap=\"round\"/><circle cx=\"90\" cy=\"98\" r=\"11\" fill=\"#6E9BFF\"/></svg>'''
print('data:image/svg+xml;base64,'+base64.b64encode(svg.encode()).decode())")
HEAD='<!doctype html><html lang="ja"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><meta name="apple-mobile-web-app-capable" content="yes"><meta name="mobile-web-app-capable" content="yes"><meta name="apple-mobile-web-app-title" content="スピンメーター"><meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"><link rel="icon" href="'"$ICON"'"><link rel="apple-touch-icon" href="'"$ICON"'"><style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px system-ui,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style></head><body>'
{ echo "$HEAD"; cat src/app.html; printf '\n</body></html>\n'; } > index.html
