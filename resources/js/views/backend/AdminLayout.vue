<template>
  <div id="admin-panel" class="d-flex">
    <Sidebar />
    <div class="main-content">
      <Navbar />
      <div class="container-fluid py-4">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from "../../components/backend/Navbar.vue";
import Sidebar from "../../components/backend/Sidebar.vue";

export default {
  name: "AdminLayout",
  components: {
    Navbar,
    Sidebar,
      //Navbar:() =>import('../../components/backend/Navbar.vue'),
      //Sidebar:()=>import('../../components/backend/Sidebar.vue'),
  },
};
</script>

<style scoped>
#admin-panel {
  display: flex;
  height: 100vh;
  overflow: hidden;
}

.main-content {
  flex-grow: 1;
  margin-left: 250px; /* Ajusta el ancho del sidebar */
  padding: 20px;
  background-color: #f8f9fa;
  overflow-y: auto;
}

@media (max-width: 768px) {
  .main-content {
    margin-left: 0; /* El sidebar se ocultará en pantallas pequeñas */
  }
}
</style>
