


echo "Creating file at ~/Videos/${1}.webm"
ffmpeg -hwaccel_output_format qsv -qsv_device /dev/dri/renderD128 -i rtsp://admin:montieprotector@192.168.1.230 -c:v vp9_qsv -t 15 -an -y ~/Videos/${1}_qsv.webm

ffmpeg -vaapi_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i rtsp://admin:montieprotector@192.168.1.230 -vf 'format=nv12,hwupload' -c:v vp9_vaapi -t 15 -an -y ~/Videos/${1}_vaapi.webm