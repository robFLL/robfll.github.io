#!/bin/bash

rm -rf _build
jupyter-book build . --toc ./_toc.yml --config _jupBook/_config.yml
# jupyter-book ignores standalone .html sources; copy them as-is
git ls-files '*.html' | grep -v '^_build/' | xargs -r cp --parents -t _build/html
ghp-import -n -p -f _build/html
