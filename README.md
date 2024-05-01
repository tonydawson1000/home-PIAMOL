# home-PIAMOL
Podman in a Month of Lunches (of course!)

### Images
The `images` folder contains a set of ('Containerfiles') to build a set of 'Base' Images (using [podman](https://podman.io/)).

Podman can be installed by following the [Installation Instructions](https://podman.io/docs/installation).

These 'Base Images' can be used as a foundation, and are, in turn, built on top of [Red Hat Universal Base Image 9 (UBI)](https://catalog.redhat.com/software/containers/search?p=1&product_listings_names=Red%20Hat%20Universal%20Base%20Image%209).

## Cheat Sheet
The following tables list some commonly used Podman commands.

### Images

| Command                                   | Description |
| :---                                      | :--- |
| `podman images`                           | List all 'Images' in the local cache |
| `podman build -t <tag> <image-name> .`    | Build (and tag) an image |
| `podman push <image-name>`                | Push an Image to a Container Registry (NOTE : Must be Logged in to a remote Registry |
| `podman pull <image-name>`                | Pull a Remote Image to the local cache |
| WARNING                                   | |
| `podman rmi -f $(podman images -aq)`      | Forcably remove (DELETE) ALL Images |
| `podman rmi -f $(podman images reference!='registry.access.redhat.com/*')` | Forcably remove (DELETE) all (Non Red Hat UBI) Images |

### Containers

| Command           | Description                               |
| :---              | :---                                      |
| `podman ls`       | List all 'Running' Containers             |
| `podman ls -a`    | List all Containers (running and exited)  |
| WARNING           |                                           |
| `podman rm -f $(podman ps -aq)` | Forcably remove (DELETE) all locally cached Containers |

### Container Registry
| Command                           | Description       |
| :---                              | :---              |
| `podman login quay.io --verbose`  | Login to quay.io  |

### Multi Architecture Builds

In order for an Image to be compatible with a variety of CPU Architectures and OS's, an Image must be built specifically to support this.

| OS        | CPU       | CPU Name  | CPU Alias             |
| :---      | :---      | :---      | :---                  |
| Windows   | Intel/AMD | amd64     | x86_64                |
| Linux     | Intel/AMD | amd64     | x86_64                |
| Windows   | Arm       | arm64     | aarch64, armv8        |
| Linux     | Arm       | arm64     | aarch64, armv8        |
| Linux     | Arm       | arm       | arm32v7, armv7, armhf |


NOTE : Raspberry Pi 4 is 64-bit Arm - all other RPi's are 32-bit.