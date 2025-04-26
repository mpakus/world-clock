<script setup>
import { Link } from "@inertiajs/vue3";
</script>

<template>
  <header class="flex justify-between items-center p-4 bg-gray-800 text-white">
    <div class="text-lg font-bold">
      🌍 World Clock
    </div>
    <Link href="/clocks/new" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">⊕ ADD</Link>
  </header>
</template>
