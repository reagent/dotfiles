import yt_dlp
from yt_dlp.postprocessor.ffmpeg import FFmpegMetadataPP

class playlist_metadataPP(FFmpegMetadataPP):
  def run(self, info):
    self.to_screen("Adding playlist position to file")

    track_position = f"{info['playlist_index']}/{info['playlist_count']}"
    info.update({"track_number": track_position})

    return super(FFmpegMetadataPP, self).run(info)
