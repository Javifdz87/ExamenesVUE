<template>
  <div id="app">
    <router-link to="/">Home</router-link>
    <RouterView/>
  </div>
</template>

<script setup>
import { RouterRink, RouterView } from "vue-router";
</script>