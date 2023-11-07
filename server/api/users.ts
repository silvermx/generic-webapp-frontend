export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig(event)
  console.log("Calling the internal load balancer ...")
  const response = await $fetch(config.apiBase + '/api/users');
  return response
})