<script setup>
const route = useRoute()

const links = [{
    label: 'Home',
    icon: 'i-ph-house-line-duotone',
    to: '/'
}, {
    label: 'Settings',
    icon: 'i-ph-gear-six-duotone',
    to: '/settings'
}]
</script>

<template>
    <div class="p-4">
        <UVerticalNavigation :ui="{ size: 'text-md', padding: 'px-5 py-2.5' }" :links="links" />
    </div>
</template>