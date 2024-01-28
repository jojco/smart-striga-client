<script setup>
const route = useRoute()

const links = [{
    label: 'Home',
    icon: 'i-heroicons-home',
    to: '/'
}, {
    label: 'Settings',
    icon: 'i-heroicons-home',
    to: '/settings'
}]
</script>

<template>
    <div class="p-4">
        <UVerticalNavigation :links="links" />
    </div>
</template>