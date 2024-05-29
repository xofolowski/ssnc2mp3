# ssnc2mp3
Docker container that spawns an airplay receiver transcoding all received audio contents to MP3 files.
This can - for example - be useful for converting DRM protected audio contents like Apple Music to unprotected MP3 files.

Based on [https://github.com/mikebrady/shairport-sync](), this container will spawn a shairport-sync daemon in Airplay 2 mode that outputs all audio contents to a pipe.
Metadata of received contents will be written to another named pipe.

[https://github.com/mikebrady/shairport-sync-metadata-reader]() will be used to parse metadata of received contents. Parsed output will be continuously read and on every state change of the "title" metadata an ffmpeg process will be spawned, reading from the audio content pipe and writing MP3 encoded files to a defined output directory.

## Encoding
As of today, encoding will be performed using a static ffmpeg configuration.
Adjust ssnc2mp3.sh according to your own needs. 

## Glitches
Since slicing of the received audio stream into individual mp3 files is based on changes of the title metadata, timing of slicing might not be 100% accurate. 

# Build
```
docker buildx build -f ./Dockerfile --build-arg SHAIRPORT_SYNC_BRANCH=master --build-arg SHAIRPORT_SYNC_MR_BRANCH=master --build-arg NQPTP_BRANCH=main -t ssnc2mp3:latest .
```
