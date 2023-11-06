<template>
  <div>
    <button @click="loadUsers">Load Users</button>
    <ul>
      <li v-for="user in users" :key="user.id">{{ user.email }}</li>
    </ul>
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
        // Make a request to the server function created in step 1
        const response = await fetch('/api/users');        
        this.users = await response.json();
        console.log("List of users \n" + this.users)
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
