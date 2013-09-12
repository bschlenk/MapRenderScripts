#!/bin/bash
rsync -e ssh -avz --delete mcmap/ brian@swellserve.com:mc.swellserve.com
