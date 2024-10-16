<template>
  <div class="settings-container">
    <h1 class="mb-4">Configuraciones</h1>
    <form class="settings-form">
      <div class="mb-3">
        <label for="appName" class="form-label">Nombre de la Aplicación</label>
        <input type="text" class="form-control" id="appName" placeholder="Ingrese el nombre de la aplicación" />
      </div>
      <div class="mb-3">
        <label for="appEmail" class="form-label">Correo Electrónico</label>
        <input type="email" class="form-control" id="appEmail" placeholder="Ingrese el correo electrónico" />
      </div>
      <button type="submit" class="btn btn-primary">Guardar Cambios</button>
    </form>
  </div>
</template>

<script>
export default {
  name: "Settings",
};
</script>

<style scoped>
.settings-container {
  margin-top: 80px;
  padding: 20px;
  background-color: #f8f9fa;
  border-radius: 0.5rem;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
}

h1 {
  color: #343a40;
  font-weight: 500;
}

.settings-form {
  background-color: #ffffff;
  padding: 20px;
  border-radius: 0.5rem;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
}
</style>
