## What
A simple/small docker image that when run spits out a randomly generated Ethereum public/private key and address.

## Trust Requirements
* Hardware you run/build this image on.
* Your local Docker installation.
* Version of Alpine OS used in base image.
* Alpine package manager (trust requirement to be removed in future version)
* Installation of git and all of its dependencies used in building the image.
* Source code for https://github.com/paritytech/parity/ethkey/cli at commit 6654d021634929a24fd6174491596620b47d4361 and all of its dependencies.
* Installation of Rust and all of its dependencies used in building the image.

If you are using a copy of this image from Docker Hub:
* Docker Hub automated image builder.

Who you _**do not**_ have to trust:
* The author of this image.

## Usage
```bash
docker container run --rm zoltu/ethereum-key-generator@sha256:93b4d7bfcd95fdb720c9fdf294cfdfc4c3c18a26b45ad96534333c35ff278677
```

## Building
```bash
docker image build --tag zoltu/ethereum-key-generator .
```

## To Do
* Create or locate a key generator that has far fewer dependencies.  This one already existed, so I used it but it appears to have a _lot_ of dependencies.  In theory, you shouldn't need much to create a key generator... just something that can do secp256k1 and maybe some string/bignumber manipulation.
