<template>
  <div class="table-responsive">
    <table class="table table-striped">
      <thead>
        <tr>
          <th v-for="header in headers" :key="header">{{ header }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="row in data" :key="row.id">
          <td v-for="(value, index) in row" :key="index">{{ value }}</td>
          <td>
            <div class="action-buttons">
              <button class="btn btn-warning btn-sm" @click="edit(row.id)">Editar</button>
                <button class="btn btn-danger btn-sm" @click="delete(row.id)">Eliminar</button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
    name: "Table",
    props: {
        headers: {
            type: Array,
            required: true,
        },
        data: {
            type: Array,
            required: true,
        },
    },
    methods: {
        edit(userId) {
            this.$emit('edit', userId); // Emitir el evento para editar
        },
        delete(userId) {
            this.$emit('delete', userId); // Emitir el evento para eliminar
        }
    },
};
</script>

<style scoped>
.table-responsive {
    margin-top: 20px;
}

.table {
    background-color: #ffffff; /* Color blanco para la tabla */
    border-radius: 0.5rem; /* Bordes redondeados */
}

.table-striped tbody tr:nth-of-type(odd) {
    background-color: #f8f9fa; /* Color gris claro para filas impares */
}

.table th {
    background-color: #007bff; /* Color azul para el encabezado */
    color: #ffffff; /* Color de texto blanco para el encabezado */
}

.action-buttons {
    display: flex;
    gap: 10px; /* Espaciado entre botones */
}
</style>
