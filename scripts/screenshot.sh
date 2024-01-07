#!/bin/bash

import /tmp/ss.png
cp /tmp/ss.png ~/docs/pics/screenshots/$(date +screenshot_%y%m%d_%H%M%S.png)
xclip -selection clipboard -target image/png -i /tmp/ss.png
rm /tmp/ss.png
