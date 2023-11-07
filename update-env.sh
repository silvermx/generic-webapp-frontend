#!/bin/sh
echo "Updating configuration to add the internal load balancer: ${NUXT_APP_INTERNAL_LB_URL}"
sed -i "s|NUXT_APP_INTERNAL_LB_URL|${NUXT_APP_INTERNAL_LB_URL}|" /src/.output/server/chunks/nitro/node-server.mjs

node /src/.output/server/index.mjs