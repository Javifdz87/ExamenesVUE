import './assets/main.css';
import { createApp } from 'vue';
import { createPinia } from 'pinia';
import PrimeVue from 'primevue/config'; // Importa PrimeVue
import App from './App.vue';
import router from './router';
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap'


//in main.js
import 'primevue/resources/themes/aura-light-green/theme.css'


const app = createApp(App);

app.use(createPinia());
app.use(router);

app.use(PrimeVue); // Usa PrimeVue como plugin de la aplicación

app.mount('#app');
