<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Agencia de Seguros</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <router-link to="/clientsTable" class="nav-link">Clientes</router-link>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/polizasTable">Polizas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Buscar Cliente</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-danger" href="/login">Cerrar Sesión</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</template>

<script>

</script>