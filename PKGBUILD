# Maintainer: Melchizedek Shah <melchizedekshah18@proton.me>
pkgname=nstep-git
pkgver=r163.bd7504e
pkgrel=1
pkgdesc="A simple package manager written in Go for managing NextStep web application deployments"
arch=(x86_64)
url="https://github.com/NextStepWebApp/nstep"
license=('MIT')
depends=(tar)
makedepends=(go git)
provides=(nstep)
conflicts=(nstep)
#backup=(
#    etc/nstep/config.json
#    etc/nstep/package.json
#)
source=("git+https://github.com/NextStepWebApp/nstep.git")
sha256sums=('SKIP')

pkgver() {
    cd "nstep"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "nstep"
    go build -trimpath -o nstep .
}

package() {
    cd "nstep"

    # Install binary
    install -Dm755 nstep "$pkgdir/usr/bin/nstep"

    # Install config files
    install -Dm644 config.json "$pkgdir/etc/nstep/config.json"
    #install -Dm644 package.json "$pkgdir/etc/nstep/package.json"
    install -Dm644 setup.json "$pkgdir/etc/nstep/setup.json"
    #install -Dm755 state.json "$pkgdir/var/lib/nstep/state.json"
    install -Dm644 nstep.toml "$pkgdir/etc/nstep/nstep.toml"

    # Install setup_nextstep.sh
    install -Dm755 setup_nextstep.sh "$pkgdir/opt/nstep/setup_nextstep.sh"

    # Create state directories
    install -dm755 "$pkgdir/var/lib/nstep/"{downloads,versions,current,backup}

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nstep/LICENSE"
}
