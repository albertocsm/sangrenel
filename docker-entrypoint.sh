#!/bin/sh
set -e

if [ "$1" = 'sangrenel' ]; then

exec sangrenel \
	-api-version=${API_VERSION} \
	-brokers=${BROKERS} \
	-interval=${INTERVAL} \
	-compression=${COMPRESSION} \
	-message-batch-size="${MESSAGE_BATCH_SIZE}" \
    -message-size=${MESSAGE_SIZE} \
    -noop=${NOOP} \
    -produce-rate=${PRODUCE_RATE} \
	-required-acks=${REQUIRED_ACKS} \
	-topic=${TOPIC} \
	-workers=${WORKERS} \
	-writers-per-worker=${WRITERS_PER_WORKER}
fi

exec "$@"
