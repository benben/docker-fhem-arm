# fhem-arm
fhem docker images for arm architectures like the Raspberry Pi

This is a build of fhem home automation running in docker and can build for arm architectures like the Raspberry Pi.

## Run it

    docker run -p 8083:8083 --device=/dev/ttyACM0 --name fhem bknofe/fhem-arm:latest

## Mount config files

Add `-v /path/to/your/fhem.cfg:/opt/fhem/fhem.cfg` to the command above.

## Persisting fhem data

Add `-v`

## Misc

This was tested on a Raspberry Pi 3 with Arch Linux and Docker 17.11.0-ce.
