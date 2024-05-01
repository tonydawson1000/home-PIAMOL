# Images

## hello-piamol-web - Info
This Image is built using a simple '[Containerfile](Containerfile)' - that uses the `ubi9-apache` Image as its foundation. The `ubi9-apache` Image is based off the [Red Hat Universal Base Image 9 (UBI) + Apache Web Server](https://catalog.redhat.com/software/containers/search?p=1&product_listings_names=Red%20Hat%20Universal%20Base%20Image%209).

Description : This Image demonstrates

1. Starting from a 'Base Image' (That includes Apache Web Server)
1. Copying a simple HTML file into the Image [index.html](html/index.html)
1. Starting a long running process (Web Server)
1. Exposing Ports to allow access to the running Container

## Build Image Locally
1. Download and navigate to the location of the `Containerfile`

        cd ch02/hello-piamol-web

1. Build for alternative CPU Architectures - and associate with Manifest

    1. Build a `linux-amd64` variant Image

            podman build -t quay.io/tonydawson1000/piamol-ch02-hello-web:linux-amd64 --platform linux/amd64 --manifest quay.io/tonydawson1000/piamol-ch02-hello-web .

    1. Build a `linux-arm64` variant Image

            podman build -t quay.io/tonydawson1000/piamol-ch02-hello-web:linux-arm64 --platform linux/arm64 --manifest quay.io/tonydawson1000/piamol-ch02-hello-web .

1. View the Images

        podman images

1. Inspect the Manifest

        podman manifest inspect quay.io/tonydawson1000/piamol-ch02-hello-web

1. Push the Manifest

        podman manifest push quay.io/tonydawson1000/piamol-ch02-hello-web

1. Push the Images to remote reqistry (quay.io) 

    NOTE: Requires Authentication (`podman login quay.io --verbose`)

        podman push quay.io/tonydawson1000/piamol-ch02-hello-web:linux-amd64
    
        podman push quay.io/tonydawson1000/piamol-ch02-hello-web:linux-arm64

## Run Image Locally

When this Container is run, it is started in 'detached' mode (-d) as it is a long running process (Web Server). It also exposes a port (-p) that will allow access to the Web Pages Running inside the Container.

This is a Minimal Install + Apache Web Server and will not contain many packages by default.

Build

        podman build -t quay.io/tonydawson1000/piamol-ch02-hello-web .

Run

        podman run -d -p 8080:8080 --name piamol-ch02-hello-web quay.io/tonydawson1000/piamol-ch02-hello-web

To view the Web Page, open a browser and navigate to

- [http://localhost:8080/](http://localhost:8080/)


Finally, stop the Running Container and Delete it (to free up disk space)

        podman stop piamol-ch02-hello-web
        
        podman rm piamol-ch02-hello-web