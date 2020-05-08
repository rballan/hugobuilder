#!/bin/bash

# Cloning Hugo website into docker container
git clone $HUGO_WEBSITE_REPO /usr/share/blog

# Downloading choosen theme
git clone $HUGO_THEME_REPO_URL /usr/share/blog/themes/theme

hugo --themesDir /usr/share/blog/themes/ -D -d /output && chown $HOST_UID:$HOST_GID -R /output