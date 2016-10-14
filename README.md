# docker-gmod-base
A base GMOD Server Docker Image

## Installation

Install docker, once that is done, run `docker pull vilsol/gmod-base` to download the base image.

## Usage

To start the container, simply run `docker run -it -d vilsol/gmod-base`

## Environment variables

* **MAP** - The map that is used once the server starts (default: "gm_flatgrass")
* **MAX_PLAYERS** - The max amount of players the server can hold (default: "12")
* **GAMEMODE** - The gamemode that the server will use (default: "sandbox")
