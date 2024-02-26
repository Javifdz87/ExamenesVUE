import { createRouter, createWebHistory } from 'vue-router';
import Welcome from '@/views/Welcome.vue';
import Examen from '@/views/ExamenView.vue'
import ExamenSim from '@/views/SimExamenView.vue'
import Filtro from '@/views/filtroExamenView.vue'



// Importa tus componentes de las diferentes vistas

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome
  },
  {
    path: '/examen',
    name: 'Examen',
    component: Examen
  },
  {
    path: '/examenSim',
    name: 'ExamenSim',
    component: ExamenSim
  },
  {
    path: '/filtro',
    name: 'Filtro',
    component: Filtro
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;

