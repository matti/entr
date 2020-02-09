FROM alpine:3.10 as builder

RUN apk add --no-cache \
  build-base

WORKDIR /build
COPY . .

RUN ./configure
RUN make

FROM scratch
COPY --from=builder /build/entr /entr
