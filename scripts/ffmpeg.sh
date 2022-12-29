-f alsa -i default

```bash

```
ffmpeg -f v4l2 -video_size 1920x1080 -vaapi_device /dev/dri/renderD128 -i /dev/video0 -f alsa -i default\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -v verbose -crf 28\
    ~/Videos/intel/living-room.mp4

ffmpeg -f v4l2 -video_size 640x480 -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -v verbose -qp 25 -rc_mode 1\
    ~/Videos/intel/living-room2.mp4

ffmpeg -f v4l2 -video_size 1920x1080  -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -v verbose -qp 25 -rc_mode 1\
    ~/Videos/intel-tests/bedroom.mp4

ffmpeg -f mjpeg -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -v verbose -qp 25 -rc_mode 1\
    ~/Videos/intel-tests/bedroom.mp4

ffmpeg -f v4l2 -video_size 1920x1080 -framerate 24 -input_format mjpeg -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -qp 25 -rc_mode 1\
    -fs 10G -y ~/Videos/intel/living-room.mp4

ffmpeg -f v4l2 -video_size 1920x1080 -framerate 24 -input_format mjpeg -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -qp 18 \
    -fs 10G -y ~/Videos/intel/living-room3.mp4

v4l2-ctl --list-formats-ext   
ffmpeg -f v4l2 -list_formats all -i /dev/video0

ffmpeg -f v4l2 -video_size 1920x1080 -framerate 24 -input_format mjpeg -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -qp 18 \
    -t 15 -y ~/Videos/intel/qp18.mp4

ffmpeg -f v4l2 -video_size 1920x1080 -framerate 24 -input_format mjpeg -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -qp 22 \
    -fs 1G -y ~/Videos/intel/qp22-extended.mp4

ffmpeg -f v4l2 -video_size 1920x1080 -framerate 24 -input_format mjpeg -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -qp 25 \
    -y udp://ricardoalcaraz.dev:5284

ffmpeg -f v4l2 -video_size 1920x1080 -framerate 24 -input_format mjpeg -vaapi_device /dev/dri/renderD128 -i /dev/video0\
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -qp 25 \
    -y udp://

ffmpeg -f v4l2 -video_size 1920x1080 -framerate 24 -input_format mjpeg -vaapi_device /dev/dri/renderD128 -i /dev/video0\                 [255]
    -vf format='nv12|vaapi,hwupload' -c:v hevc_vaapi -movflags faststart -tag:v hvc1 -f ismv -qp 25 \
    -y udp://ricardoalcaraz.dev:5284

# use -r 25 for rtsp stream

ffmpeg -hwaccel_output_format qsv -hwaccel qsv -qsv_device /dev/dri/renderD128 -i rtsp://admin:montieprotector@192.168.1.230 -c:v vp9_qsv -an ~/Videos/av1-output.webm