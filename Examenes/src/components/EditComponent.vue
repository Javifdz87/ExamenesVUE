<template>
    <div class="row justify-content-center m-3">

        <h2 class="card-title text-center">Editar Cliente</h2>
        <form @submit.prevent="registrarCleinte">
            <div class="row">
                <div class="col-lg-3">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="name" placeholder="name@example.com"
                            value="" />
                        <label for="floatingInput">Nombre</label>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="last_name" placeholder="name@example.com"
                            value="" />
                        <label for="floatingInput">Apellidos</label>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="email" placeholder="name@example.com" 
                            value="" />
                        <label for="floatingInput">Email</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="phone" placeholder="name@example.com" 
                            value="" />
                        <label for="floatingInput">Teléfono</label>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="town" placeholder="name@example.com" 
                            value="" />
                        <label for="floatingInput">Localidad</label>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="postal_code" placeholder="name@example.com"
                             value="" />
                        <label for="floatingInput">Código Postal</label>
                    </div>
                </div>
            </div>


            <div class="row">

                
                <div class="col-lg-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="province" placeholder="name@example.com"
                            value="" />
                        <label for="floatingInput">Provincia</label>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="form-floating mb-3">
                        <select class="form-select" id="status" >
                            <option value="" disabled selected>Elige el estado de la tarea</option>
                            <option value="empresa">Empresa</option>
                            <option value="particular">Particular</option>
                        </select>
                        <label for="estado">Estado</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <button type="submit" class="btn btn-primary btn-block w-100">Editar Cliente</button>

                </div>
            </div>

        </form>
    </div>
</template>
  
<script setup>

</script>
  