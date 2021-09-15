# JMusicBot on Heroku
Deploy [jagrosh's Discord music bot](https://github.com/jagrosh/MusicBot/) on Heroku.

# Setup
Once you have created a fork and linked it to your Heroku dyno, go into **Settings > Config Vars** and add a configuration value called `base64_encoded_config`.

Then, take your config.txt file for MusicBot and [convert it to base64](https://base64.guru/converter/encode/file).

Paste the base64 value into the value box. You can now deploy from the main branch!
