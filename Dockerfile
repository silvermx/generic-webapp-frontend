ARG NODE_VERSION=21.1.0-alpine3.18

FROM node:${NODE_VERSION} as base

ARG PORT=8080

ENV NODE_ENV=production

WORKDIR /src

# Build
FROM base as build

COPY --link package.json package-lock.json .
RUN npm install --production=false

COPY --link . .

RUN npm run build
RUN npm prune

# Run
FROM base

ENV PORT=$PORT

COPY --from=build /src/.output /src/.output
# Optional, only needed if you rely on unbundled dependencies
# COPY --from=build /src/node_modules /src/node_modules

# Set the environment variable into the Nuxt configuration
COPY update-env.sh /src/update-env.sh
RUN chmod u+x /src/update-env.sh
ENTRYPOINT ["/src/update-env.sh"]

CMD [ "node", ".output/server/index.mjs" ]