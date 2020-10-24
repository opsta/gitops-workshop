# MULTISTAGE Build
FROM node:12.19.0-alpine3.12 AS builder

WORKDIR /usr/src/app
COPY src/package.json /usr/src/app
RUN npm install

# MULTISTAGE Run
FROM node:12.19.0-alpine3.12

EXPOSE 9080
ENV SERVICE_VERSION ${service_version:-v1}

# Copy node_module file from build stage
COPY --from=builder /usr/src/app/node_modules /usr/src/app/node_modules
# Copy source code
COPY src/ /usr/src/app/

CMD ["node", "/usr/src/app/ratings.js", "9080"]
