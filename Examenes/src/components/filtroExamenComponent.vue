<template>
  <div class="container mt-5">
    <h2>Filtrar Productos</h2>
    <div class="d-flex justify-content-end">
      <div class="text-right">
        <router-link to="/examen" class="btn btn-success">Ver Tienda</router-link>
      </div>
    </div>
    <form @submit.prevent="filtrarProductos" class="row g-3">
      <div class="col-md-4">
        <label for="categoria" class="form-label">Categoría:</label>
        <select id="categoria" v-model="categoriaSeleccionada" class="form-select">
          <option value="">Selecciona una categoría</option>
          <option v-for="categoria in categorias" :key="categoria.id" :value="categoria.id">
            {{ categoria.name }}
          </option>
        </select>
      </div>
      <div class="col-md-4">
        <label for="precioMinimo" class="form-label">Precio Mínimo:</label>
        <input
          type="number"
          id="precioMinimo"
          v-model.number="precioMinimo"
          min="0"
          class="form-control"
        />
      </div>
      <div class="col-md-4">
        <label for="precioMaximo" class="form-label">Precio Máximo:</label>
        <input
          type="number"
          id="precioMaximo"
          v-model.number="precioMaximo"
          min="0"
          class="form-control"
        />
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-primary">Filtrar</button>
      </div>
    </form>

    <table v-if="productosCategoria.length > 0" class="table mt-3">
      <thead>
        <tr>
          <th>ID</th>
          <th>Título</th>
          <th>Precio</th>
          <th>Descripción</th>
          <th>Imagen</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="producto in productosCategoria" :key="producto.id">
          <td>{{ producto.id }}</td>
          <td>{{ producto.title }}</td>
          <td>{{ producto.price }}</td>
          <td>{{ producto.description }}</td>
          <td>
            <img
              v-for="(imagen, index) in producto.images"
              :key="index"
              :src="imagen"
              alt="Imagen de producto"
              style="max-width: 100px; max-height: 100px; margin-right: 5px"
            />
          </td>
        </tr>
      </tbody>
    </table>
    <div v-else>
      <p>No hay productos disponibles.</p>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const categoriaSeleccionada = ref('')
const precioMinimo = ref(0)
const precioMaximo = ref(0)

const categorias = ref([]) // Variable para almacenar las categorías
const productosCategoria = ref([]) // Variable para almacenar los productos de la categoría seleccionada

const mostrarProductos = async () => {
  try {
    const response = await fetch(
      `https://api.escuelajs.co/api/v1/categories/${categoriaSeleccionada.value}/products`,
      {
        method: 'GET'
      }
    )
    if (response.ok) {
      const data = await response.json()
      console.log(data) // Asegúrate de que los datos sean los esperados

      // Filtrar productos según precios mínimo y máximo
      productosCategoria.value = data.filter((producto) => {
        return producto.price >= precioMinimo.value && producto.price <= precioMaximo.value
      })
    } else {
      console.error('Error al cargar los productos de la categoría')
    }
  } catch (error) {
    console.error('Error al conectar con la API', error)
  }
}

const filtrarProductos = () => {
  mostrarProductos()
}

onMounted(async () => {
  try {
    // Carga de categorías
    const responseCategorias = await fetch('https://api.escuelajs.co/api/v1/categories', {
      method: 'GET'
    })
    if (responseCategorias.ok) {
      const data = await responseCategorias.json()
      console.log(data) // Asegúrate de que los datos sean los esperados
      categorias.value = data.map((categoria) => ({ id: categoria.id, name: categoria.name })) // Ajustamos el formato de las categorías
    } else {
      console.error('Error al cargar los datos de la API')
    }
  } catch (error) {
    console.error('Error al conectar con la API', error)
  }
})
</script>
