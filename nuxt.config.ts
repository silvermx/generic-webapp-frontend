// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  runtimeConfig: {
    apiBase: process.env.NUXT_APP_INTERNAL_LB_URL
  }
})
