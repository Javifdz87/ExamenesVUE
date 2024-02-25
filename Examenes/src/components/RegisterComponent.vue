<template>
  <div class="container">
    <div class="row justify-content-center m-3">
      <form @submit.prevent="registrarCleinte">
          <div class="row">
            <div class="col-lg-6">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="name" placeholder="name@example.com" 
                  value="" />
                <label for="floatingInput">Nombre</label>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="last_name" placeholder="name@example.com" 
                  value="" />
                <label for="floatingInput">Apellidos</label>
              </div>
            </div>
          </div>

        <div class="row">
          <div class="col-lg-7">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="email" placeholder="name@example.com" 
                value="" />
              <label for="floatingInput">Email</label>
            </div>
          </div>
          <div class="col-lg-5">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="phone" placeholder="name@example.com" 
                value="" />
              <label for="floatingInput">Teléfono</label>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-6">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="town" placeholder="name@example.com"  value="" />
              <label for="floatingInput">Localidad</label>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="postal_code" placeholder="name@example.com"
                 value="" />
              <label for="floatingInput">Código Postal</label>
            </div>
          </div>
          
        </div>

        <div class="row">
          <div class="col-lg-6">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="province" placeholder="name@example.com"
                value="" />
              <label for="floatingInput">Provincia</label>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="form-floating mb-3">
              <select class="form-select" id="status">
                <option value="" disabled selected>Elige el estado de la tarea</option>
                <option value="empresa">Empresa</option>
                <option value="particular">Particular</option>
              </select>
              <label for="estado">Estado</label>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12 mb-3">
            <button type="submit" class="btn btn-primary btn-block w-100">Registrar Cliente</button>

          </div>
        </div>

      </form>
    </div>
  </div>
</template>

<script setup>
import api from '@/services/service' // Importa el servicio para realizar solicitudes HTTP
import { useRouter } from 'vue-router' // Importa el enrutador de Vue Router
import axios from 'axios';

const registrarCleinte = async () => {
  try {
    const respuesta = await api.post('/register')
    const datos = {
      id: '',
      name: '',
      last_Name: '',
      email: '',
      phone: '',
      town: '',
      postal_code: '',
      province: '',
      role: '',
    }
    console.log(respuesta);

  } catch (error) {
    console.log(error);
  }
}
</script>
