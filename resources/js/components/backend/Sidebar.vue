<template>
  <div :class="['sidebar', { 'collapsed': isCollapsed }]">
    <div class="sidebar-header">
      <button class="btn-toggle" @click="toggleSidebar">
        <i :class="isCollapsed ? 'fas fa-bars' : 'fas fa-times'"></i>
      </button>
    </div>

    <ul class="menu-list">
      <li>
        <router-link to="/admin/dashboard" class="menu-item" active-class="active">
          <i class="fas fa-tachometer-alt icon"></i>
          <span v-if="!isCollapsed">Dashboard</span>
        </router-link>
      </li>
      <li>
        <router-link to="/admin/users" class="menu-item" active-class="active">
          <i class="fas fa-users icon"></i>
          <span v-if="!isCollapsed">Usuario</span>
        </router-link>
      </li>
      <li>
        <router-link to="/admin/settings" class="menu-item" active-class="active">
          <i class="fas fa-cog icon"></i>
          <span v-if="!isCollapsed">Configuración</span>
        </router-link>
      </li>
      <li>
        <router-link to="/404" class="menu-item" active-class="active">
          <i class="fas fa-exclamation-circle icon"></i>
          <span v-if="!isCollapsed">Error</span>
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isCollapsed: false, // Estado del sidebar
    };
  },
  methods: {
    toggleSidebar() {
      this.isCollapsed = !this.isCollapsed; // Cambiar estado al hacer clic
      console.log(this.isCollapsed); // Para depuración
    }
  }
};
</script>

<style scoped>
/* Estilos generales del sidebar */
.sidebar {
  background-color: #2e3b4e; /* Color de fondo suave y profesional */
  color: #d1d8e0; /* Texto claro */
  width: 250px;
  height: 100vh;
  position: fixed;
  top: 56px; /* Debajo del navbar */
  left: 0;
  transition: width 0.3s ease; /* Transición suave al colapsar/expandir */
  box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15); /* Sombra ligera */
  z-index: 100;
}

.sidebar.collapsed {
  width: 80px; /* Ancho del sidebar colapsado */
}

.sidebar-header {
  display: flex;
  justify-content: center; /* Centrar el toggle */
  align-items: center;
  padding: 15px;
  background-color: #243140; /* Fondo más oscuro */
}

.btn-toggle {
  background: none;
  border: none;
  color: #d1d8e0;
  font-size: 1.5em;
  cursor: pointer;
}

.menu-list {
  list-style: none; /* Eliminar el estilo por defecto */
  padding: 0;
  margin: 20px 0; /* Margen superior e inferior */
}

.menu-item {
  display: flex; /* Alinear íconos y texto */
  align-items: center;
  padding: 12px 18px; /* Espaciado moderado */
  text-decoration: none;
  transition: background-color 0.2s ease, color 0.2s ease; /* Transición suave */
  color: #a4b0be; /* Color de texto */
}

.icon {
  margin-right: 16px; /* Separación entre ícono y texto */
}

.menu-item span {
  flex-grow: 1; /* Espacio flexible para el texto */
}

/* Efecto hover */
.menu-item:hover {
  background-color: #1d2736; /* Cambiar fondo al pasar el ratón */
  color: #f1f2f6; /* Color del texto al pasar el ratón */
}

/* Estilo para el elemento activo */
.menu-item.active {
  background-color: #576574; /* Color para estado activo */
  color: #f1f2f6; /* Color del texto activo */
}

.collapsed .icon {
  margin-right: 0; /* Sin margen en estado colapsado */
}

.collapsed .menu-item span {
  display: none; /* Ocultar texto en estado colapsado */
}
</style>
