#!/bin/bash
chmod +x engines/Developed_SF
chmod a+x engines/fsf_linux

### ONLY UNCOMMENT ONE START POINT ###

python heroku_challenges.py         # This start point will accept challenges according to the config.yml

# python heroku_matchmaking.py        # This start point will challenge other bots and decline all challenges. CAUTION!!! Don't run this 24/7, you will get rate limited by lichess.
