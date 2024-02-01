<template>
  <UHorizontalNavigation :ui="{wrapper: 'justify-center fixed xl:relative inset-x-0 bottom-0 z-10 bg-gray-950 border-t border-indigo-950', base: 'text-lg rounded-xl  items-center' }" :links="links"  />
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