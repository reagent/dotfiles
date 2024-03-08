function audio-dl() {
  yt-dlp \
  --audio-format mp3 \
  --no-playlist \
  --postprocessor-args "-id3v2_version 3" \
  --extract-audio \
  --embed-thumbnail \
  --add-metadata \
  --no-overwrites \
  --continue \
  -o "%(title)s.%(ext)s" \
  $1
}



function video-dl() {
  yt-dlp \
    --format bestvideo+bestaudio \
    --recode-video mkv \
    --continue \
    --no-overwrites \
    -o "%(title)s.%(ext)s" \
    $1
}

function playlist-dl() {
  yt-dlp \
  --yes-playlist \
  --format bestaudio \
  --audio-format mp3 \
  --extract-audio \
  --embed-thumbnail \
  --add-metadata \
  --no-overwrites \
  --continue \
  --download-archive ~/.yt-dlp/downloaded \
  --use-postprocessor playlist_metadata \
  -o "%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" \
  $1
}


