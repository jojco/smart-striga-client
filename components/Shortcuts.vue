<template>
    <UModal v-model="isOpen">
        <div class="flex items-center gap-0.5 p-4">
            <UKbd>⌘</UKbd>
            <UKbd>K</UKbd>
        </div>
    </UModal>
</template>
  
<script setup lang="ts">
const isOpen = ref(false)

defineShortcuts({
    meta_k: {
        usingInput: true,
        handler: () => {
            isOpen.value = !isOpen.value
        }
    }
})
</script>