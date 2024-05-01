# Images

## apache - Info
This 'Apache Web Server Base' Image is built using a simple '[Containerfile](Containerfile)' - using the [Red Hat Universal Base Image 9 (UBI)](https://catalog.redhat.com/software/containers/search?p=1&product_listings_names=Red%20Hat%20Universal%20Base%20Image%209).

NOTE : This 'Base Image' contains the OS + a Vanilla Installation of [Apache Web Server 2.4](https://httpd.apache.org/) - it forms the foundation to build other images on top of that require a the Apache Web Server.

## Build Image Locally
1. Download and navigate to the location of the `Containerfile`

        cd images/apache

1. Build for alternative CPU Architectures - and associate with Manifest

    1. Build a `linux-amd64` variant Image

            podman build -t quay.io/tonydawson1000/ubi9-apache:linux-amd64 --platform linux/amd64 --manifest quay.io/tonydawson1000/ubi9-apache .

    1. Build a `linux-arm64` variant Image

            podman build -t quay.io/tonydawson1000/ubi9-apache:linux-arm64 --platform linux/arm64 --manifest quay.io/tonydawson1000/ubi9-apache .

1. View the Images

        podman images

1. Inspect the Manifest

        podman manifest inspect quay.io/tonydawson1000/ubi9-apache

1. Push the Manifest

        podman manifest push quay.io/tonydawson1000/ubi9-apache

1. Push the Images to remote reqistry (quay.io) 

    NOTE: Requires Authentication (`podman login quay.io --verbose`)

        podman push quay.io/tonydawson1000/ubi9-apache:linux-amd64
    
        podman push quay.io/tonydawson1000/ubi9-apache:linux-arm64

## Run Image Locally

NOTE : This Image is not meant to be 'run' on its own, it is to be used as a foundation for building other images on top.

This is a Minimal Install + Vanilla Apache Web Server and will not contain many packages by default.

However you can run this Image as a Container - Publishing the Ports you can view the Apache Home Page

        podman run -d -p 8088:80 --name ubi9-apache quay.io/tonydawson1000/ubi9-apache

To exit - type `exit` - this will disconnect from the terminal and stop the Container (State = `stopped').

To (re)`start` a currently `stopped` Container, and reattach to the terminal

        podman start -ia ubi9-apache

Finally, to delete the Container (and free up disk space)

        podman rm ubi9-apache