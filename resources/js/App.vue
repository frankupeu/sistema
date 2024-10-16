<!-- resources/js/App.vue -->
<template>
  <div id="app" class="app-container">
    <router-view></router-view> <!-- Aquí se renderizarán las vistas según la ruta -->
  </div>
</template>

<script>
export default {
  name: 'App',
};
</script>

<style>
/* Estilos globales */
.app-container {
    font-family: Arial, sans-serif; /* Cambia esto según tus preferencias */
    background-color: #f8f9fa; /* Color de fondo global */
    min-height: 100vh; /* Asegura que el contenedor ocupe toda la altura de la ventana */
}

/* Aquí puedes agregar estilos globales si lo deseas */
</style>
