docker run --rm -it \
  --device=/dev/dri/renderD128:/dev/dri/renderD128 \
  --device=/dev/video0:/dev/video0 \
  linuxserver/ffmpeg \
    -vaapi_device /dev/dri/renderD128 \
    -f v4l2 -video_size 1920x1080 -framerate 24 -input_format mjpeg \
    -i /dev/video0 -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -qp 25 \
    -y udp://ricardoalcaraz.dev:5284