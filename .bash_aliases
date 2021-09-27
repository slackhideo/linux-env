alias ffmpeg_resolution='ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0'
ffmpeg_resize() { local input="$1" output="$2"; ffmpeg -i "$input" -vf scale=-1:720 -preset slow -crf 18 -strict -2 "$output"; }
