# FFMPEG Notes and cheat sheet

## List devices

### Apple devices

Note the following command will fail

```bash
ffmpeg -hide_banner -f avfoundation -list_devices true -i ""
```

## Recording

Ffmpeg supports damn near everything under the sun. Inputs are defined with `-i` and can be a file, network stream or standard in. Any options defined before the input is reached is considered a launch option. Output are defined in the same manner so any options must be defined before the final file name argument

### Piping

FFmpeg can use accept and output to unix pipes. Pipes are defined as `pipe:` for both input and output

#### Example

example (output is in PCM signed 16-bit little-endian format):

```bash
cat file.mp3 | ffmpeg -f mp3 -i pipe: -c:a pcm_s16le -f s16le pipe:
```

please note that - is also accepted for brevity. this is known behavior however it is undocumented because programmers are lazy so the above command is equivalent to:

```bash
cat file.mp3 | ffmpeg -f mp3 -i - -c:a pcm_s16le -f s16le -
```

if you want to detect input type then use ffprobe

```bash
cat '/Users/ralcaraz/Audio/_Master_tasneemmalsi_STILL_Sage_Audio.m4a' | ffprobe -i -
```

converting audio can be done by

```bash
ffmpeg -hide_banner -y -i '/Users/ralcaraz/Audio/_Master_tasneemmalsi_STILL_Sage_Audio.m4a' ~/Audio/still.flac
```

### Audio and remote stream

Only audio can be recorded as ffmpeg doesn't understand the native iphone camera. Audio can be recorded with the following command from the host side

```bash
ffmpeg -hide_banner -listen 1 -i http://192.168.65.247:1234 -c copy iphone.mp3 -c copy -f rtp udp://127.0.0.1:12345
```

To start the recording from the other side run the following command
```bash
ffmpeg -hide_banner -f avfoundation -i ":0" -f mp3 http://192.168.65.247:1234
```


#### Livestreaming

```bash
ffmpeg -f avfoundation -capture_raw_data true -i ":0" -c:a aac -b:a 192k -ar 44100 -threads 0 -f flv "http://45.29.157.145:8282"
```

#### iPad

```bash
ffmpeg -f avfoundation -capture_raw_data true -i ":1" out.mp3
```

