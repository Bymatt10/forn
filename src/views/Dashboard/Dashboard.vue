<template>
  <v-app>
    <drawer-dashboard />
    <router-view></router-view>
  </v-app>
</template>

<script>

  export default {
    name: 'Home',

    components: {
    DrawerDashboard: () => import ('@/components/Dashboard_Drawer.vue'),
    },
     data: () => ({
       admin: 'item'
     })
  }
</script>