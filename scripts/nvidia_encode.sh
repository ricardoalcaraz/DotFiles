echo "inputs are ${0} and ${1}"


#Encode two outputs from a single stream input

#ffmpeg -vaapi_device /dev/dri/renderD128 -hwaccel_output_format vaapi \
#    -i rtsp://admin:montieprotector@192.168.1.230 -v verbose \
#    -filter_complex '[0:v]format=nv12,hwupload,split=2[h265][vp9];[h265]scale_vaapi=w=1920:h=-2[v0];[vp9]scale_vaapi=w=1280:h=-2[v1]' \
#    -map '[v0]' -c:v hevc_nvenc -movflags faststart -tag:v hvc1 -f ismv -an ~/Videos/${0}.mp4 \
#    -map '[v1]' -c:v vp9_vaapi -movflags faststart -f ismv -an ~/Videos/${0}.webm