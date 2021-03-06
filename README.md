# FGPA Arcade Replay Setup #

Provides a simple setup solution for FPGA Arcade Replay R1 including
* RTG Automatic Setup
* Network installation (RoadShow installed mandatory)

## Instructions ##

Either build yourself with included scripts or use the ready-2-go _replaySetup.adf_ located inside the /adf/ folder.

## Build Yourself ##

### Mac ###

> For Mac users, run: _buildMac.sh_

### Windows ###

> For Windows users, run: _buildWin.cmd_

## Directory Structure ##
```
.
├───adf
├───base
│   ├───c
│   ├───classes
│   │   └───datatypes
│   ├───devs
│   │   ├───monitors
│   │   └───netinterfaces
│   ├───libs
│   │   └───picasso96
│   ├───prefs
│   │   └───env-archive
│   │       └───picasso96
│   └───s
└───bin
    └───adftools
```

## Planned updates ##

* Better icons for both original WB, Glow Icons etc.
* AHI install

