# nstep-arch-repo

A custom Arch Linux repository providing **nstep**, a simple package manager written in Go for managing **NextStep** web application deployments.

---

## Repository Setup

You can add the repository manually or use the automated setup script.

### Option 1: Manual configuration (recommended for transparency)

Add the following block **to the end** of your `/etc/pacman.conf` file:

```ini
[nstep-arch-repo]
SigLevel = Optional TrustAll
Server = https://github.com/NextStepWebApp/nstep-arch-repo/raw/refs/heads/main/$arch
```

Then refresh pacman:

```bash
sudo pacman -Syyu
```

And install nstep:

```bash
sudo pacman -S nstep-git
```
---

### Option 2: One-line setup script

Copy and run the following command to automatically configure the repository:

```bash
bash <(curl -sL https://github.com/NextStepWebApp/nstep-arch-repo/raw/refs/heads/main/setup.sh)
```

This script will safely append the repository configuration to `pacman.conf` and install nstep.

---

If you have issues, suggestions, or want to contribute, feel free to open an issue.
