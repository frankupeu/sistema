<template>
  <div class="dashboard">
    <h1 class="dashboard-title">Dashboard</h1>
    <p class="dashboard-description">Resumen de la aplicación y estadísticas.</p>
    <div class="dashboard-cards row g-4">
      <div class="col-lg-4 col-md-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Total de Usuarios</h5>
            <p class="card-text">1000</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Total de Ventas</h5>
            <p class="card-text">500</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Ingresos</h5>
            <p class="card-text">$20,000</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Dashboard",
};
</script>

<style scoped>
.dashboard {
  padding-top: 80px;
  background-color: #f8f9fa;
}

.dashboard-title {
  font-size: 2rem;
  margin-bottom: 20px;
  color: #343a40;
}

.dashboard-description {
  margin-bottom: 30px;
  color: #6c757d;
}

.card {
  background-color: #ffffff;
  border: none;
  border-radius: 0.5rem;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
}

.card-title {
  font-weight: 600;
  color: #007bff;
}

.card-text {
  font-size: 1.5rem;
  color: #495057;
}
</style>
