<template>
  <div class="dark:bg-gray-950 ">
    <Shortcuts />
    <NuxtPage />
  </div>
</template>


<script setup>
defineNuxtRouteMiddleware((to, from ) => {
  if ( to === '/') navigateTo('/home');
})
</script>