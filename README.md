# [🎵 OSDPlaylist](https://open.spotify.com/playlist/20lFoFnoKTEcKoy6sMoP0e)

> *One should be able to fork playlists.*


## 🏗️ **How It Works**

1. **Terraform Configuration**: Defines playlist structure and tracks
2. **GitHub Actions**: Automatically authenticates with Spotify and applies changes
3. **Patched Provider**: Uses a forked Spotify provider that fixes authentication issues
4. **Smart State Management**: Prevents duplicate playlists and manages existing ones


## 🚦 **Getting Started**

### Prerequisites

- **Spotify Developer Account** ([Create one here](https://developer.spotify.com))
- **GitHub Account** with repository access
- **Basic knowledge** of Terraform and GitHub Actions

### 1. Fork This Repository

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/OSDPlaylist.git
cd OSDPlaylist
```

### 2. Set Up Spotify App

1. Go to [Spotify Developer Dashboard](https://developer.spotify.com/dashboard)
2. Create a new app
3. Note your `Client ID` and `Client Secret`
4. Add redirect URI: `http://127.0.0.1:8080/spotify_callback`

### 3. Configure GitHub Secrets

Add these secrets in your repository settings:

| Secret Name | Description | Example |
|-------------|-------------|---------|
| `SPOTIFY_CLIENT_ID` | Your Spotify app client ID | `abc123def456` |
| `SPOTIFY_CLIENT_SECRET` | Your Spotify app client secret | `xyz789uvw012` |
| `SPOTIFY_REDIRECT_URI` | Redirect URI from your app | `http://127.0.0.1:8080/spotify_callback` |
| `SPOTIFY_USERNAME` | Your Spotify email/username | `your@email.com` |
| `SPOTIFY_PASSWORD` | Your Spotify password | `your_password` |

### 4. Customize Your Playlist

Edit `main.tf` to add your favorite tracks:

```terraform
data "spotify_track" "your_favorite_song" {
  url = "https://open.spotify.com/track/TRACK_ID"
}

# Add to the tracks array in spotify_playlist resource
data.spotify_track.your_favorite_song.id,
```

### 5. Push and Watch Magic Happen! ✨

```bash
git add .
git commit -m "feat: customize playlist with my tracks"
git push origin main
```

The GitHub Action will automatically:

- 🔐 Authenticate with Spotify
- 🎵 Create/update your playlist
- ✅ Verify everything works

## 📁 **Project Structure**

```text
OSDPlaylist/
├── .github/workflows/
│   └── tf-apply.yaml          # Automated deployment pipeline
├── main.tf                    # Main Terraform configuration
├── variables.tf               # Input variables
├── update_playlist.md         # Local development guide
├── guide.md                   # Future improvements
└── README.md                  # This file
```

## 🔧 **Local Development**

Want to test changes locally? See our detailed [Local Setup Guide](update_playlist.md).

### Quick Local Setup

1. **Install Terraform** ([Download here](https://terraform.io/downloads))
2. **Clone the patched provider**:

   ```bash
   git clone -b fix/base-url-127 https://github.com/gouravslnk/terraform-provider-spotify
   cd terraform-provider-spotify/spotify_auth_proxy
   go build -o spotify_auth_proxy.exe
   ```

3. **Set environment variables** and run the auth proxy
4. **Initialize and apply**:

   ```bash
   terraform init
   terraform plan -var "SPOTIFY_API_KEY=your_api_key"
   terraform apply -var "SPOTIFY_API_KEY=your_api_key"
   ```

## 🤝 **Contributing**

Want to add tracks or improve the project?

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-tracks`)
3. **Add** your tracks to `main.tf`
4. **Commit** your changes (`git commit -m 'feat: add amazing tracks'`)
5. **Push** to the branch (`git push origin feature/amazing-tracks`)
6. **Open** a Pull Request

## 🛡️ **Security Notes**

- Terraform state files are excluded from git
- Sensitive data stored in GitHub Secrets
- Authentication handled via secure proxy
- Never commit credentials to the repository

## 🎯 **Roadmap**

- [ ] **Cloud State Storage** - Move state to AWS S3/Terraform Cloud
- [ ] **Multiple User Support** - State locking for collaboration
- [ ] **Performance Optimization** - Reduce workflow execution time
- [ ] **Track Analytics** - Monitor playlist engagement
- [ ] **Dynamic Track Discovery** - Auto-add trending tracks
- [ ] **Enhanced UI** - Web interface for playlist management
