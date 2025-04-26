import { createInertiaApp } from '@inertiajs/vue3'
import { createApp, h } from 'vue'
import vSelect from 'vue-select'

import 'vue-select/dist/vue-select.css'

createInertiaApp({
  id: 'app',
  // Set default page title
  // see https://inertia-rails.netlify.app/guide/title-and-meta
  //
  // title: title => title ? `${title} - App` : 'App',

  // Disable progress bar
  //
  // see https://inertia-rails.netlify.app/guide/progress-indicators
  // progress: false,

  resolve: (name) => {
    const pages = import.meta.glob('../pages/**/*.vue', {
      eager: true,
    })
    return pages[`../pages/${name}.vue`]

    // To use a default layout, import the Layout component
    // and use the following lines.
    // see https://inertia-rails.netlify.app/guide/pages#default-layouts
    //
    // const page = pages[`../pages/${name}.vue`]
    // page.default.layout = page.default.layout || Layout
    // return page
  },

  setup({ el, App, props, plugin }) {
    const app = createApp({ render: () => h(App, props) });
    app.use(plugin);
    app.component('v-select', vSelect);
    app.mount(el);
  },
})
