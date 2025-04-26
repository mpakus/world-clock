<script setup>
  const shareContent = async () => {
    if (navigator.share) {
      try {
        await navigator.share({
          title: 'World Clock',
          text: 'Check out this amazing World Clock app!',
          url: window.location.href,
        });
      } catch (error) {
        console.error('Error sharing:', error);
      }
    } else {
      alert('Sharing is not supported on this browser.');
    }
  };
</script>

<template>
  <footer class="flex justify-center items-center p-4 bg-gray-100 mt-6">
    <button
        @click="shareContent"
        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
    >
      📤 Share
    </button>
  </footer>
</template>
