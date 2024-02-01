<template>
  <div class="container  mx-auto flex-col flex gap-8 px-4 py-8 xl:p-16">
    <div class="w-full flex justify-between py-4">
      <h1
        class="text-3xl xl:text-4xl font-extrabold text-transparent bg-clip-text bg-gradient-to-br from-blue-400 to-violet-600">
        <span>Welcome to Smart Striga ! 🐈‍⬛</span>
      </h1>

      <div class="flex justify-end grow">
        <ColorMode />
      </div>
    </div>

    <Navigation />

    <NuxtPage />
  </div>
</template>
  