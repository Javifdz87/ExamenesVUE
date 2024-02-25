<template>
    <div class="container">
        <div class="row justify-content-center m-3">
            <form>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="import" placeholder="name@example.com" value="" />
                            <label for="floatingInput">Importe</label>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" id="last_name" placeholder="name@example.com"
                                value="" />
                            <label for="floatingInput">Fecha de Inicio</label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-7">
                        <div class="form-floating mb-3">
                            <select name="" class="form-control" id="email" placeholder="name@example.com" value="">
                                <option value="">cobrada</option>
                                <option value="">a cuenta</option>
                                <option value="">liquidada</option>
                                <option value="">anulada </option>
                                <option value="">pre anulada </option>


                            </select>
                            <label for="floatingInput">Estado</label>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="phone" placeholder="name@example.com" value="" />
                            <label for="floatingInput">Observaciones</label>
                        </div>
                    </div>
                </div>





                <div class="row">
                    <div class="col-lg-12 mb-3">
                        <button type="submit" class="btn btn-primary btn-block w-100">Crear Poliza</button>

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



</script>
  