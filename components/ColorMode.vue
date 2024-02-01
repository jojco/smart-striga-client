<script setup>
const colorMode = useColorMode()
const isDark = computed({
  get () {
    return colorMode.value === 'dark'
  },
  set () {
    colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark'
  }
})
</script>
<template>
  <ClientOnly>
    <UButton
      :icon="isDark ? 'i-ph-star-and-crescent-duotone' : 'i-ph-sun-horizon-duotone'"
      color="gray"
      variant="ghost"
      aria-label="Theme"
      size="lg"
      @click="isDark = !isDark"
    />
    <template #fallback>
      <div class="w-10 h-10" />
    </template>
  </ClientOnly>
</template>