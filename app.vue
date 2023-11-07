<template>
  <div id="app">
    <img alt="Vue logo" src="/GCP-logo.png">
    <h1>Nuxt3 - Example to Call a Rest API Backend</h1>
    <p>By: Silver Nunez - Cloud Architect 
      <a href="https://www.linkedin.com/in/silver-nunez/" target="_blank">( LinkedIn )</a> 
    </p>
    
    <button @click="loadUsers">Get Users</button>

    <div v-for="user in users" :key="user.email">
      <h2>Email: {{ user.email }}</h2>
      <p>First Name: {{ user.firstName }}</p>
      <p>Last Name: {{ user.lastName }}</p>
    </div>

  </div>
</template>

<script>
export default {
  async fetch() {
    this.loadUsers();
  },
  methods: {
    async loadUsers() {
      try {
        const response = await fetch('/api/users');        
        this.users = await response.json();
      } catch (err) {
        console.error('Failed to fetch users', err);
      }
    },
  },
  data() {
    return {
      users: [],
    };
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
