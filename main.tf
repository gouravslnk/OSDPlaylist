terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.SPOTIFY_API_KEY
}

data "spotify_search_track" "RAM" {
  album = "Random Access Memories (10th Anniversary Edition)"
  limit = 7
}

data "spotify_search_track" "LImperatrice" {
  artist = "L'Impératrice"
  limit = 7
}

data "spotify_search_track" "Odyssee" {
  album = "Odyssee EP"
}

data "spotify_search_track" "Parcels" {
  artist = "Parcels"
  limit = 7
}


data "spotify_track" "Zenith" {
  url = "https://open.spotify.com/track/0qKX14YZHptDWiEN0CgxGz?si=174ddb3f25414e2c"
}

data "spotify_track" "A_View_To_Kill" {
  url = "https://open.spotify.com/track/7fN3QQtmCMkiczQ41IuhwK?si=d0e32a11da1f4c72"
}

data "spotify_track" "Veridis_Quo" {
  url = "https://open.spotify.com/track/2LD2gT7gwAurzdQDQtILds?si=392db9f1e95849e6"
}

data "spotify_track" "instant_crush" {
  url = "https://open.spotify.com/track/2cGxRwrMyEAp8dEbuZaVv6?si=0e20066520e04bef"
}

data "spotify_track" "nightcall" {
  url = "https://open.spotify.com/track/0U0ldCRmgCqhVvD6ksG63j?si=ca6db3e2a5584f04"
}

data "spotify_track" "lady_hear_me_tonight" {
  url = "https://open.spotify.com/track/49X0LAl6faAusYq02PRAY6?si=9059c63e0984402b"
}

data "spotify_track" "supermassive_black_hole" {
  url = "https://open.spotify.com/track/3lPr8ghNDBLc2uZovNyLs9?si=6dac397517d3427f"
}



resource "spotify_playlist" "playlist" {
  name        = "The CodeJam Playlist"
  description = "Wishing you make the nicest, most Randomly Accessible Memories this CodeR̶A̶M̶Jam :)"
  public      = true

  tracks = flatten([
    data.spotify_search_track.RAM.tracks[*].id,
    data.spotify_search_track.LImperatrice.tracks[*].id,
    data.spotify_search_track.Odyssee.tracks[*].id,
    data.spotify_search_track.Parcels.tracks[*].id,
    data.spotify_track.Zenith.id,
    data.spotify_track.A_View_To_Kill.id,
    data.spotify_track.Veridis_Quo.id,
    // added tracks
    data.spotify_track.instant_crush.id,
    data.spotify_track.nightcall.id,
    data.spotify_track.lady_hear_me_tonight.id,
    data.spotify_track.supermassive_black_hole.id
  ])
}
