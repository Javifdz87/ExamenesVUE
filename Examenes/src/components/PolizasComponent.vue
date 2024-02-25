<template>
  <div>
    <div class="row mt-5">
      <div class="col-lg-8 offset-lg-2">

        <div class="table-responsive-vertical bg-light p-3">
          <div class="row">
            <div class="d-flex justify-content-center">
              <h2>
                Lista Polizas
              </h2>

            </div>
            <div class="d-flex justify-content-end">
              <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#dardealta">
                Nueva Poliza
              </button>
            </div>
          </div>
          <DataTable :value="polizas" stripedRows :paginator="true" :rows="5" :rowsPerPageOptions="[5, 10, 20, 50]"
            tableStyle="min-width: 50rem">
            <Column field="id" header="#" sortable style="width: 12%"></Column>
            <Column field="name" header="Nombre" sortable style="width: 12%"></Column>
            <Column field="email" header="Email" sortable style="width: 12%"></Column>
            <Column field="import" header="Importe" sortable style="width: 12%"></Column>
            <Column field="start_date" header="Fecha Inicio" sortable style="width: 12%"></Column>
            <Column field="status" header="Estado" sortable style="width: 12%"></Column>
            <Column field="observation" header="Observaciones" sortable style="width: 12%"></Column>
            <Column header="Operaciones" style="width: 16%">
              <template #body="slotProps">
                <Button class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#eliminar">
                  X
                </Button>
                <Button class="btn btn-info m-1" data-bs-toggle="modal" data-bs-target="#vista">
                  O
                </Button>
                <Button class="btn btn-warning m-1" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEdit"
                  aria-expanded="false" aria-controls="collapseEdit">M</Button>
              </template>
            </Column>
          </DataTable>
        </div>




        <div class="collapse" id="collapseEdit">
          <div class="card card-body">
            <CreatePoliza />
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
            <button type="button" class="btn btn-danger" @click="eliminarCliente(slotProps.row)">Si</button>
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
            <h5 class="modal-title text-light" id="staticBackdropLabel">Vista Poliza</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p><strong>Id:</strong> </p>
            <p><strong>Nombre:</strong></p>
            <p><strong>Email:</strong> </p>
            <p><strong>Importe:</strong> </p>
            <p><strong>Fecha de Inicio:</strong></p>
            <p><strong>Estado:</strong> </p>
            <p><strong>Obervaciones:</strong> </p>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal Nueva Poliza -->
    <div class="modal fade" id="dardealta" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Nueva Poliza</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <CreatePoliza />

          </div>

        </div>
      </div>
    </div>


  </div>
</template>

<script setup>
import api from '@/services/service';
import { ref, onMounted } from 'vue';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import Button from 'primevue/button';
import CreatePoliza from './CreatePolizaComponent.vue';
import EditPoliza from './EditPolizaComponent.vue';

// Función para obtener el color según el estado
const getSeverity = (status) => {
  switch (status) {
    case 'cobrada':
      return 'success';
    case 'a cuenta':
      return 'warning';
    case 'liquidada':
      return 'info';
    case 'anulada':
    case 'pre anulada':
      return 'danger';
    default:
      return 'primary';
  }
};

const polizas = ref([]);
const selectedPoliza = ref(null);

const obtenerPolizas = async () => {
  try {
    const respuesta = await api.get('/polizas');
    console.log(respuesta.data);
    polizas.value = respuesta.data;
  } catch (error) {
    console.log(error);
  }
}

const eliminarCliente = async (cliente) => {
  try {

  } catch (error) {
    console.log(error);
  }
}

const mostrarDetalle = (cliente) => {
  selectedPoliza.value = cliente;
}

onMounted(obtenerPolizas);
</script>

