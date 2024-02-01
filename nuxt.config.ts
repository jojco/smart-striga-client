// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ['@nuxt/ui'],
  ui: {
    icons: ["ph"]
  },
  runtimeConfig: {
    public: {
      api: 'http://raspberrypi.local:3000'
    }
  }
})
