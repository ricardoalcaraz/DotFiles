FROM scratch
COPY --from=nats:2.1.9-alpine3.12 /usr/local/bin/nats-server /nats-server
COPY nats-server.conf /nats-server.conf
ENTRYPOINT ["/nats-server"]
CMD ["--config", "nats-server.conf"]