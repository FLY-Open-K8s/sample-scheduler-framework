FROM debian:stretch-slim

WORKDIR /

COPY bin/sample_scheduler_framework_linux /usr/local/bin

CMD ["sample-scheduler-framework"]