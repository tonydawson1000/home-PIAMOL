# Images

## hello-piamol - Info
This Image is built using a simple '[Containerfile](hello-piamol/Containerfile/)' - that uses the `ubi9-base` Image as its foundation. The `ubi9-base` Image is based off the [Red Hat Universal Base Image 9 (UBI)](https://catalog.redhat.com/software/containers/search?p=1&product_listings_names=Red%20Hat%20Universal%20Base%20Image%209).

Description : This Image demonstrates

1. Starting from a 'Base Image'
1. Installing some packages (in this case `hostname` and `net-tools`)
1. Copying a simple bash script into the Image [cmd.sh](hello-piamol/cmd.sh)
1. Running the script (when the Container starts) to output some runtime values
1. Exit

## Build Image Locally
1. Download and navigate to the location of the `Containerfile`

        cd ch02/hello-piamol

1. Build for alternative CPU Architectures - and associate with Manifest

    1. Build a `linux-amd64` variant Image

            podman build -t quay.io/tonydawson1000/piamol-ch02-hello:linux-amd64 --platform linux/amd64 --manifest quay.io/tonydawson1000/piamol-ch02-hello .

    1. Build a `linux-arm64` variant Image

            podman build -t quay.io/tonydawson1000/piamol-ch02-hello:linux-arm64 --platform linux/arm64 --manifest quay.io/tonydawson1000/piamol-ch02-hello .

1. View the Images

        podman images

1. Inspect the Manifest

        podman manifest inspect quay.io/tonydawson1000/piamol-ch02-hello

1. Push the Manifest

        podman manifest push quay.io/tonydawson1000/piamol-ch02-hello

1. Push the Images to remote reqistry (quay.io) 

    NOTE: Requires Authentication (`podman login quay.io --verbose`)

        podman push quay.io/tonydawson1000/piamol-ch02-hello:linux-amd64
    
        podman push quay.io/tonydawson1000/piamol-ch02-hello:linux-arm64

## Run Image Locally

When this Container is run, it will output some run time variables and then exit.

This is a Minimal Install and will not contain many packages by default.

Two additional packages are installed when the Image is being built - (`hostname` and `net-tools`) - These are required for the commands that output the runtime variables (`hostname` and `uname`, `ifconfig`).

        podman run --name piamol-ch02-hello quay.io/tonydawson1000/piamol-ch02-hello

Finally, to delete the Container (and free up disk space)

        podman rm piamol-ch02-hello