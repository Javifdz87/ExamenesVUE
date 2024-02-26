<template>
  <div>
    <h2 class="mb-4">Tienda de Ropa</h2>
    <div class="d-flex justify-content-end">
      <div class="text-right">
        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#verCarrito">Ver Carrito</button>
        <router-link to="/filtro" class="btn btn-success">Ver Filtro</router-link>
      </div>
    </div>
    <table class="table">
      <thead class="thead-light">
        <tr>
          <th scope="col">Categoría</th>
          <th scope="col">Imagen</th>
          <th scope="col">Operaciones</th>
          <!-- Nuevo campo Operaciones -->
        </tr>
      </thead>
      <tbody>
        <tr v-for="(categoria, index) in categorias" :key="index" @click="mostrarProductos(categoria.id)" data-bs-toggle="modal"
              data-bs-target="#exampleModal">
          <td >
            <h4>{{ categoria.name }}</h4>
          </td>
          <td>
            <img
              :src="categoria.image"
              alt="Imagen de la categoría"
              class="img-fluid"
              style="max-width: 150px"
            />
          </td>
          <td>
            <button
              type="button"
              class="btn btn-primary"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              @click="mostrarProductos(categoria.id)"
            >
              Ver Productos
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <!-- Modal -->
<div
  class="modal fade"
  id="exampleModal"
  tabindex="-1"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog modal-xl"> <!-- Cambiado a modal-xl -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Productos</h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
        <table class="table">
          <thead class="thead-light">
            <tr>
              <th scope="col">Título</th>
              <th scope="col">Precio</th>
              <th scope="col">Imagen</th>
              <th scope="col">Operaciones</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(producto, index) in productosCategoria" :key="index">
              <td>{{ producto.title }}</td>
              <td>{{ producto.price }}</td>
              <td>
                <img
                  v-for="(imagen, index) in producto.images"
                  :key="index"
                  :src="imagen"
                  alt="Imagen de producto"
                  style="max-width: 100px; max-height: 100px; margin-right: 5px"
                />
              </td>
              <td>
                <button type="button" class="btn btn-success" @click="agregarAlCarrito(producto)">Agregar</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="verCarrito" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl"> <!-- Agrega la clase modal-xl aquí -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Carrito de Compras</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table">
          <thead class="thead-light">
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Descripción</th>
              <th scope="col">Cantidad</th>
              <th scope="col">Precio</th>
              <th scope="col">Subtotal</th>
              <th scope="col">Operaciones</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in carrito" :key="index">
              <td>{{ item.id }}</td>
              <td>{{ item.descripcion }}</td>
              <td>
                <input type="number" v-model="item.cantidad" min="1" @input="calcularSubtotal()" />
              </td>
              <td>{{ item.precio }}</td>
              <td>{{ item.cantidad * item.precio }}</td>
              <td>
                <button type="button" class="btn btn-danger" @click="eliminarDelCarrito(index)">Eliminar</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <strong>Total: {{ calcularSubtotal() }}</strong>
      </div>
    </div>
  </div>
</div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const categorias = ref([]) // Variable para almacenar las categorías
const productosCategoria = ref([]) // Variable para almacenar los productos de la categoría seleccionada
const carrito = ref([]) // Variable para almacenar los productos agregados al carrito

const mostrarProductos = async (categoriaId) => {
  try {
    const response = await fetch(
      `https://api.escuelajs.co/api/v1/categories/${categoriaId}/products`,
      {
        method: 'GET'
      }
    )
    if (response.ok) {
      const data = await response.json()
      console.log(data) // Asegúrate de que los datos sean los esperados
      productosCategoria.value = data
    } else {
      console.error('Error al cargar los productos de la categoría')
    }
  } catch (error) {
    console.error('Error al conectar con la API', error)
  }
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
      categorias.value = data // Asignamos los datos de las categorías a la variable categorias
    } else {
      console.error('Error al cargar los datos de la API')
    }
  } catch (error) {
    console.error('Error al conectar con la API', error)
  }
})

// Método para agregar productos al carrito
const agregarAlCarrito = (producto) => {
  // Verificar si el producto ya está en el carrito
  const productoExistente = carrito.value.find(item => item.id === producto.id)
  if (productoExistente) {
    // Incrementar la cantidad si el producto ya está en el carrito
    productoExistente.cantidad++
  } else {
    // Agregar el producto al carrito con una cantidad inicial de 1
    carrito.value.push({
      id: producto.id,
      descripcion: producto.title,
      cantidad: 1,
      precio: producto.price
    })
  }
}

// Método para calcular el subtotal del carrito
const calcularSubtotal = () => {
  return carrito.value.reduce((total, item) => total + (item.cantidad * item.precio), 0)
}

// Método para eliminar un producto del carrito
const eliminarDelCarrito = (index) => {
  carrito.value.splice(index, 1)
}
</script>
