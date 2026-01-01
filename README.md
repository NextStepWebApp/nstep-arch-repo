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
sudo pacman -Sy
```

---

### 🚀 Option 2: One-line setup script

Copy and run the following command to automatically configure the repository:

```bash
bash <(curl -sL https://github.com/NextStepWebApp/nstep-arch-repo/raw/refs/heads/main/setup.sh)
```

This script will safely append the repository configuration to `pacman.conf`.

---

## 🔐 Security Notice

This repository currently uses:

```
SigLevel = Optional TrustAll
```

This disables package signature verification and is suitable for **personal or development use**. For production systems, signed packages are strongly recommended.

---

## 📁 Architecture Support

Packages are served per-architecture using pacman’s `$arch` variable (e.g. `x86_64`, `aarch64`).

---

## 🛠️ Development & Maintenance

* Packages are built using `makepkg`
* Repository metadata is managed with `repo-add`
* Hosting is provided via GitHub (raw content)

---

## 📄 License

MIT (or specify your license here)

---

If you have issues, suggestions, or want to contribute, feel free to open an issue or pull request.
