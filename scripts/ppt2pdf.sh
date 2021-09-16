#!/usr/bin/env bash
set -euo pipefail

#libreoffice --headless --invisible --convert-to pdf *.pptx

parallel libreoffice --headless --invisible --convert-to pdf --outdir {//} {} ::: */*pptx
