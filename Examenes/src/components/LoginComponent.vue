<template>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

  <div class="container">
    <div class="row justify-content-center mt-5">
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h2 class="card-title text-center">Iniciar sesión</h2>
            <form @submit.prevent="login">
              <div class="mb-3">
                <label for="email" class="form-label">Correo electrónico:</label>
                <input type="email" id="email" v-model="email" class="form-control" />
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Contraseña:</label>
                <input type="password" id="password" v-model="password" class="form-control" />
              </div>
              <div class="mb-3">
                <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
              </div>
            </form>
            <p v-if="errorMessage" class="text-danger text-center">{{ errorMessage }}</p>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import api from '@/services/service';
import { useRouter } from 'vue-router';

let email = '';
let password = '';
let errorMessage = '';

const router = useRouter();

async function login() {
  try {
    const response = await api.post('/login', {
      email,
      password
    });

    if (response.status === 200) {
      if (router) {
        router.push('/');
      }
    }
  } catch (error) {
    console.error('Error al iniciar sesión:', error);
  }
}
</script>

