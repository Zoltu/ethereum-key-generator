#FROM alpine@edge
FROM alpine@sha256:79c2c5f6db53da44f90bb2731f29f725b5b14c378407a123776b6d3c76e6aebe as builder
# TODO: vendor or otherwise verify packages
# TODO: figure out if we actually need openssl-dev and eudev-dev
RUN apk update \
	&& apk add rust cargo git openssl-dev eudev-dev file make
WORKDIR /source
RUN git clone --depth 1 --branch v1.11.1 --single-branch --no-checkout https://github.com/paritytech/parity.git \
	&& cd /source/parity \
	&& git checkout 6654d021634929a24fd6174491596620b47d4361
WORKDIR /source/parity/ethkey/cli
RUN cargo build --release

#FROM alpine:3.7
FROM alpine@sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0
# TODO: vendor or otherwise verify packages
RUN apk --no-cache add libgcc
WORKDIR /app
COPY --from=builder /source/parity/target/release/ethkey /app/ethkey
RUN chmod 111 /app/ethkey
ENTRYPOINT [ "/app/ethkey" ]
CMD [ "generate", "random" ]
