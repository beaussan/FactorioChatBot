# Factorio Chat Bot

Two-Directional chat bot connecting Discord and Factorio chats together, written in nodejs.
[Examples](https://github.com/AGuyNamedJens/FactorioChatBot/blob/master/EXAMPLES.md)

This bot does **not**:

- Disable Achievements unless specified.
- Require mods to run.

The guide below is made for factorio servers on Linux. Windows guide might be added on a later date.

# Requirements

1. A Discord Bot
2. A factorio server with RCON enabled
3. A factorio server with Logging enabled
4. Ability to host the bridge locally on the same machine as the game server.
5. Node.JS V14 (V16 is recommended!)

# Setting up a Discord Application

Head over to [Discord's developer page](https://discord.com/developers/applications) to create a new application

Open [this URL](https://discord.com/oauth2/authorize?client_id=CLIENT_ID&permissions=-1&scope=bot) and replace `CLIENT_ID` in the URL with the `Client ID` found on the application's `General Information` page. This should now show your bot, select your server to invite the bot there.

Now, the bot should have joined the server but it's not online yet.

Head back to [Discord's developer page](https://discord.com/developers/applications), select the application again and head over to the `Bot` page under the settings tab.
Create a bot by pressing Add Bot and copy the token to somewhere for a while. You will need this token later for the bot to connect to discord.

**Keep this token to yourself ONLY!**

# Setting up RCON and Logging

The Factorio server must have RCON and Logging enabled.
Add these params to the factorio's run script.

`--rcon-port <port>` Port to use for RCON

`--rcon-password <pass>` Password for RCON

`--console-log <path-to-file>` File to log the chat messages in

Full Example (including server params):

`/opt/factorio/bin/64/factorio --start-server /opt/factorio/saves/map.zip --server-settings /opt/factorio/data/server-settings.json --rcon-port 8080 --rcon-password password --console-log /opt/factorio/Factorio-server.log`

# Dependencies

Install or update NodeJS on Windows: [NodeJS Installer](https://nodejs.org/en/) (Version **14** or higher)

Install or update NodeJS on Linux by running these 2 commands:

`curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -`

`sudo apt -y install nodejs`

To verify node is installed run `node -v` in a terminal.

Now, download and unzip the newest release to your VPS. Or clone the repo.

### Downloading the newest release

Grab the newest stable release FactorioChatBot.zip at [the Releases](https://github.com/AGuyNamedJens/FactorioChatBot/releases)

Unzip the ZIP file and use any SFTP file manager to upload the folder to the VPS.

Go back to your terminal.
`cd <repo name>` to navigate to the folder you have the Factorio Chat Bot uploaded at.

Run the following command within that directory to install the required packages.

`npm install`

### Cloning the repo using the terminal

`sudo apt install git -y` to install git

Run `git clone https://github.com/AGuyNamedJens/FactorioChatBot` once you're sure you're in the right location (Remember which folder is shown as repo name: `Cloning into <repo name>`)

`cd <repo name>` to navigate to the folder you have the Factorio Chat Bot at.

Run the following command within that directory to install the required packages.

`npm install`

Continue to [Configuration](https://github.com/AGuyNamedJens/FactorioChatBot#Configuration)

# Configuration

See [CONFIG.MD](https://github.com/AGuyNamedJens/FactorioChatBot/blob/master/CONFIG.md) for configuring the bot!

# Running the bot from console

This will however stop the bot as soon as you hit CTRL+C or exit the terminal.

`node .` or `node FactorioChatBot.js`.

# Running the bot as a service

This will keep the bot running when you exit the terminal.
Follow the guide below or press the link on installing and setting up [PM2](https://pm2.keymetrics.io/docs/usage/quick-start/)

Run the following command as root to install pm2 globally:

`npm install pm2@latest -g`

After pm2 has been installed, you should be able to start the bot by running the following command in the dir of the bot:

`pm2 start index.js --name factoriochatbot` (You can change the name)

To manage the newly created process, these commands exist:

`pm2 restart app_name`,
`pm2 reload app_name`,
`pm2 stop app_name` and
`pm2 delete app_name`

For listing all applications:

`pm2 [list|ls|status]`

![Image](https://i.imgur.com/LmRD3FN.png)

There are also logs, which you can access by running:

`pm2 logs app_name` and `pm2 logs app_name --lines 200` to dig into older logs.
