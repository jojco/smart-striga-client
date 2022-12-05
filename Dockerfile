#** Arguments **
ARG NODE_VERSION="16-bullseye"

#** Stages **
#** Development **
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:0-${NODE_VERSION} AS development
WORKDIR /app

#** Builder **
FROM development AS builder
WORKDIR /app
COPY . /app
RUN yarn install
RUN yarn build

#** Production **
FROM node:${NODE_VERSION} AS production
WORKDIR /app

COPY --from=builder /app/.output /app/.app
ENV NITRO_PRESET=node_cluster
RUN echo $NUXT_PUBLIC_APP_NAME
RUN echo $NITRO_PRESET
CMD "node" ".app/server/index.mjs"
