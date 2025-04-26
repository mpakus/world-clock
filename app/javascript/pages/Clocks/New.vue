<script setup>
import { Head, useForm } from "@inertiajs/vue3";
import { reactive } from "vue";

defineProps({
  timezones: Array,
  errors: Object
});


const title = "Add New TimeZone";
const form = useForm({
  timezone: null,
  csrfToken: document.querySelector("meta[name=csrf-token]")?.content || ""
})

</script>

<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-100">
    <div class="w-full max-w-md bg-white rounded-lg shadow-md p-6">
      <h1 class="text-2xl font-bold text-gray-800 mb-4">{{ title }}</h1>

      <form @submit.prevent="form.post('/clocks')">
        <fieldset>
          <div v-if="errors.timezone" class="text-red-500 text-sm mb-2">{{ errors.timezone }}</div>
          <p>
            <v-select :options="timezones"  v-model="form.timezone"></v-select>
          </p>
          <br/>
          <p>
            <button
                type="submit"
                :disabled="form.processing"
                class="w-full py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
            >
              Add
            </button>
          </p>
        </fieldset>
      </form>

    </div>
  </div>
</template>
