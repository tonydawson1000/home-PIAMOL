# Images

## base - Info
This 'Base' Image is built using a simple '[Containerfile](Containerfile)' - using the [Red Hat Universal Base Image 9 (UBI)](https://catalog.redhat.com/software/containers/search?p=1&product_listings_names=Red%20Hat%20Universal%20Base%20Image%209).

NOTE : This 'Base Image' does nothing - it forms the foundation to build other images on top of.

## Build Image Locally
1. Download and navigate to the location of the `Containerfile`

        cd images/base

1. Build for alternative CPU Architectures - and associate with Manifest

    1. Build a `linux-amd64` variant Image

            podman build -t quay.io/tonydawson1000/ubi9-base:linux-amd64 --platform linux/amd64 --manifest quay.io/tonydawson1000/ubi9-base .

    1. Build a `linux-arm64` variant Image

            podman build -t quay.io/tonydawson1000/ubi9-base:linux-arm64 --platform linux/arm64 --manifest quay.io/tonydawson1000/ubi9-base .

1. View the Images

        podman images

1. Inspect the Manifest

        podman manifest inspect quay.io/tonydawson1000/ubi9-base

1. Push the Manifest

        podman manifest push quay.io/tonydawson1000/ubi9-base

1. Push the Images to remote reqistry (quay.io) 

    NOTE: Requires Authentication (`podman login quay.io --verbose`)

        podman push quay.io/tonydawson1000/ubi9-base:linux-amd64
    
        podman push quay.io/tonydawson1000/ubi9-base:linux-arm64

## Run Image Locally

NOTE : This Image is not meant to be 'run' on its own, it is to be used as a foundation for building other images on top.

This is a Minimal Install and will not contain many packages by default.

However you can run this Image as a Container - you can connect via an interactive terminal

Notice the change in prompt

        podman run -it --name ubi9-base quay.io/tonydawson1000/ubi9-base

To exit - type `exit` - this will disconnect from the terminal and stop the Container (State = `stopped').

To (re)`start` a currently `stopped` Container, and reattach to the terminal

        podman start -ia ubi9-base

Finally, to delete the Container (and free up disk space)

        podman rm ubi9-base