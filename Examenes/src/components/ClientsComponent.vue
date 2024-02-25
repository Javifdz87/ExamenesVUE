<template>
  <div>
    <div class="row mt-5">
      <div class="col-lg-8 offset-lg-2">

        <div class="table-responsive-vertical bg-light p-3">
          <div class="row">
            <div class="d-flex justify-content-center">
              <h2>
                Lista CLientes
              </h2>

            </div>
            <div class="d-flex justify-content-end">
              <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#dardealta">
                Dar de Alta
              </button>
            </div>
          </div>

          <DataTable :value="clientes" stripedRows :paginator="true" :rows="5" :rowsPerPageOptions="[5, 10, 20, 50]"
            tableStyle="min-width: 50rem">
            <Column field="name" header="Nombre" sortable style="width: 12%"></Column>
            <Column field="last_Name" header="Apellidos" sortable style="width: 12%"></Column>
            <Column field="phone" header="Teléfono" sortable style="width: 12%"></Column>
            <Column field="town" header="Localidad" sortable style="width: 12%"></Column>
            <Column field="postal_code" header="Código Postal" sortable style="width: 12%"></Column>
            <Column field="province" header="Provincia" sortable style="width: 12%"></Column>
            <Column field="role" header="Rol" sortable style="width: 12%"></Column>
            <Column header="Operaciones" style="width: 16%">
              <template #body="slotProps">
                <Button class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#eliminar">
                  X
                </Button>

                <Button class="btn btn-info m-1" data-bs-toggle="modal" data-bs-target="#vista">
                  O
                </Button>
                <Button class="btn btn-warning m-1" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEdit"
                  aria-expanded="false" aria-controls="collapseEdit" @click="selectClient(clientes)">M</Button>
              </template>
            </Column>

          </DataTable>
        </div>




        <div class="collapse" id="collapseEdit">
          <div class="card card-body">
            <EditComponent />
          </div>
        </div>
      </div>
    </div>

    <!-- Modales -->

    <!-- Modal Eliminar -->
    <div class="modal fade" id="eliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header bg-danger">
            <h5 class="modal-title text-light" id="staticBackdropLabel">¿Quieres Eliminar?</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">Se va a eliminar toda la fila.</div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
            <button type="button" class="btn btn-danger" @click="eliminarCliente(selectedClient)">Si</button>
          </div>
        </div>
      </div>
    </div>


    <!-- Modal Vista -->
    <div class="modal fade" id="vista" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header bg-info">
            <h5 class="modal-title text-light" id="staticBackdropLabel">Vista de Cliente</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p><strong>Id:</strong> </p>
            <p><strong>Nombre:</strong></p>
            <p><strong>Apellidos:</strong> </p>
            <p><strong>Email:</strong> </p>
            <p><strong>Teléfono:</strong> </p>
            <p><strong>Localidad:</strong></p>
            <p><strong>Código Postal:</strong> </p>
            <p><strong>Provincia:</strong> </p>
            <p><strong>Rol:</strong></p>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal Nueva tarea -->
    <div class="modal fade" id="dardealta" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Registrar Cliente</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <RegisterComponent />

          </div>

        </div>
      </div>
    </div>


  </div>
</template>

<script setup>
import api from '@/services/service';
import { ref, onMounted } from 'vue';
import RegisterComponent from './RegisterComponent.vue';
import EditComponent from './EditComponent.vue';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import Button from 'primevue/button';


const clientes = ref([]);
const selectedClient = ref(null);


const obtenerClientes = async () => {
  try {
    const respuesta = await api.get('/clientes');
    console.log(respuesta.data);
    clientes.value = respuesta.data;
  } catch (error) {
    console.log(error);
  }
}
const selectClient = (cliente) => {
  selectedClient.value = { ...cliente };
  console.log(selectedClient.value);
};

const eliminarCliente = async (cliente) => {
  try {
    // Lógica para eliminar el cliente
    await api.delete(`/clientes/${cliente.id}`);
    // Actualizar la lista de clientes después de eliminar
    await obtenerClientes();
  } catch (error) {
    console.log(error);
  }
}




onMounted(obtenerClientes);
</script>

