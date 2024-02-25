import { createRouter, createWebHistory } from 'vue-router';
import Welcome from '@/views/Welcome.vue';
import Login from '@/views/LoginView.vue';
import Register from '@/views/RegisterView.vue';
import ClientsTable from '@/views/ClientsView.vue';
import PolizasTable from '@/views/PolizasView.vue';
import Home from '@/views/HomeView.vue';
import Nav from '@/views/NavView.vue';
import Edit from '@/views/EditView.vue';



// Importa tus componentes de las diferentes vistas

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome
  },
  {
    path: '/home',
    name: 'home',
    component: Home
  },
  {
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    path: '/register',
    name: 'register',
    component: Register
  },
  {
    path: '/clientsTable',
    name: 'clientsTable',
    component: ClientsTable
  },
  {
    path: '/polizasTable',
    name: 'polizasTable',
    component: PolizasTable
  },
  {
    path: '/nav',
    name: 'nav',
    component: Nav
  },  
  {
    path: '/edit',
    name: 'edit',
    component: Edit
  }, 
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;

