<template>
  <UHorizontalNavigation :ui="{wrapper: 'justify-center fixed xl:relative inset-x-0 xl:border-t-0 bg-gray-50 xl:bg-transparent bottom-0 z-10 dark:bg-gray-950 border-t border-indigo-50 dark:border-indigo-950', base: 'text-lg rounded-xl  items-center' }" :links="links"  />
</template>


<script setup>
const route = useRoute()

const links = [{
    label: 'Home',
    icon: 'i-ph-house-line-duotone',
    to: '/home'
}, {
    label: 'Settings',
    icon: 'i-ph-gear-six-duotone',
    to: '/home/settings'
}]
</script>
``