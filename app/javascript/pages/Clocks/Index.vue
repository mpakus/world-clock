<script setup>
  import { ref, onMounted, onUnmounted } from "vue";
  import { useForm } from '@inertiajs/vue3'
  import SocialShare from '@/components/SocialShare.vue';
  import Header from "@/components/Header.vue";

  const props = defineProps({
    timezones: {
      type: Array,
      required: true
    }
  })

  // Compute the current UTC time for each timezone
  const timezoneBlocks = ref(() =>
      props.timezones.map((tz) => ({
        ...tz,
        currentTime: new Date().toLocaleTimeString("en-US", {
          timeZone: tz.tz,
        }),
      }))
  );

  let intervalId;

  onMounted(() => {
    intervalId = setInterval(() => {
      timezoneBlocks.value = props.timezones.map((tz) => ({
        ...tz,
        currentTime: new Date().toLocaleTimeString("en-US", {
          timeZone: tz.tz,
        }),
      }));
    }, 1000);
  });

  onUnmounted(() => {
    clearInterval(intervalId);
  });

  const deleteTimezone = (id) => {
    if (!window.confirm('Are you sure you want to delete this timezone?')) {
      return;
    }

    const form = useForm();
    form.delete(`/clocks/${id}`, {
      onSuccess: () => {
        timezoneBlocks.value = timezoneBlocks.value.filter((tz) => tz.id !== id);
      },
    });
  };
</script>

<template>
  <Header/>

  <div class="grid grid-cols-1 md:grid-cols-3 gap-6 p-6">

    <div
        v-for="timezone in timezoneBlocks"
        :key="timezone.id"
        class="relative bg-white border rounded-lg shadow-lg p-6 flex flex-col justify-between"
    >
      <button
          @click="deleteTimezone(timezone.id)"
          class="absolute top-2 right-2 cursor-pointer"
      >
        🗑
      </button>
      <div>
        <h3 class="text-xl font-semibold text-gray-800 flex items-center">
          <span class="mr-2">🕒</span>{{ timezone.tz }}
        </h3>
        <p class="text-gray-500 text-sm mt-1">Now: {{ timezone.currentTime }}</p>
      </div>
      <div class="mt-4">
        <div class="max-h-20 overflow-y-auto mt-2">
          <ul>
            <li v-for="name in timezone.names.slice(0, -4)" :key="`scroll-${name}`" class="text-gray-500">
              {{ name }}
            </li>
          </ul>
        </div>
      </div>

    </div>

  </div>

  <SocialShare />
</template>
