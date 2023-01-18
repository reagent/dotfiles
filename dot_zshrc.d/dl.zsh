function audio-dl() {
  youtube-dl \
  --audio-format mp3 \
  --postprocessor-args "-id3v2_version 3" \
  --extract-audio \
  --embed-thumbnail \
  --add-metadata \
  --no-overwrites \
  --continue \
  -o "%(title)s.%(ext)s" \
  $1
}
