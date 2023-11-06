export default defineEventHandler(async (event) => {
  //const config = useRuntimeConfig(event
  console.log('New request: ' + getRequestURL(event))
  console.log("Request to the lb")
  const response = await $fetch('http://10.1.2.5:8080/api/users');
  //const response = await $fetch('https://generic-webapp-backend-eczl5fplma-uc.a.run.app/api/users')
  console.log("Response: \n" + response)
  return response
})