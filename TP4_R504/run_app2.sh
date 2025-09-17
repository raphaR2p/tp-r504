#!/bin/bash

docker run \
	-p 5000:5000 \
	--name tp4-app \
	--network net-tp4 \
	--mount type=bind,src="$(pwd)/srv/",dst=/srv/ \
	im-tp4

