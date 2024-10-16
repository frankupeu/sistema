<template>
  <div class="not-found text-center">
    <h1>404 - Página No Encontrada</h1>
    <p>Lo sentimos, la página que estás buscando no existe.</p>
    <router-link to="/" class="btn btn-primary">Regresar a la página principal</router-link>
  </div>
</template>

<script>
export default {
  name: 'NotFound',
};
</script>

<style scoped>
.not-found {
  margin-top: 50px;
  color: #343a40; /* Color de texto oscuro */
}
</style>
