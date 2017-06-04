# docker-gmod-base
A base GMOD Server Docker Image with multiple tags for different contents

## Available tags

 * **latest**: A complete vanilla GMOD server.
 * **css**: GMOD coupled with Counter-Strike Source content
 * **tf2**: GMOD coupled with Team Fortress 2 content
 * **css-tf2**: GMOD coupled with both Counter-Strike Source and Team Fortress 2 content

## Running

To start a vanilla server, simply run `docker run -it -d -P vilsol/gmod-base`

## Configuration
### Simple

For simple setups you can just specify environment variables to change a few specifics as follows

* **MAP** - The map that is used once the server starts (default: "gm_flatgrass")
* **MAX_PLAYERS** - The max amount of players the server can hold (default: "12")
* **GAMEMODE** - The gamemode that the server will use (default: "sandbox")

They can be configured from the run command: `docker run -it -d -P -e "MAP=gm_construct" vilsol/gmod-base`

### Advanced

An advanced option is to specify your own startup arguments.

For example, if you wish to add a workshop list to your server, you would use the following run command:
`docker run -it -d -P vilsol/gmod-base ./srcds_run -game garrysmod +maxplayers 12 +host_workshop_collection 157384458 +gamemode zombiesurvival +map zs_cleanoffice_v2`

### docker-compose

The third option is to use a `docker-compose.yml` file to configure your servers. This is the recommended method for multiple server owners. Here is an example compose file with a sandbox, zombie survival and TTT servers:

```
version: '2'
services:
  sandbox:
    image: vilsol/gmod-base:css-tf2

  zombiesurvival:
    image: vilsol/gmod-base
    command: ["./srcds_run -game garrysmod +maxplayers 12 +host_workshop_collection 157384458 +gamemode zombiesurvival +map zs_cleanoffice_v2"]

  terrortown:
    image: vilsol/gmod-base:css
    command: ["./srcds_run -game garrysmod +maxplayers 12 +gamemode terrortown +map de_dust"]
```