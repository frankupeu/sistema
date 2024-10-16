<template>
    <div class="users">
        <h1 class="users-title">Usuarios</h1>
        <Table :actions="actions" :data="users" :headers="headers"/>
        <button class="btn btn-primary mt-3" @click="addUser">Agregar Usuario</button>
    </div>
</template>

<script>
import Table from "../../components/backend/Table.vue";

export default {
    name: "Users",
    components: {
        Table,
        //Table:() => import('../../components/backend/Table.vue'),
    },
    data() {
        return {
            headers: ["ID", "Nombre", "Correo", "Acciones"],
            users: [
                {id: 1, name: "Juan Pérez", email: "juan@example.com"},
                {id: 2, name: "Ana Gómez", email: "ana@example.com"},
            ],
            actions: [
                {label: "Editar", action: this.editUser},
                {label: "Eliminar", action: this.deleteUser},
            ],
        };
    },
    methods: {
        addUser() {
            console.log("Agregar usuario");
        },
        editUser(userId) {
            console.log("Editar usuario con ID:", userId);
        },
        deleteUser(userId) {
            console.log("Eliminar usuario con ID:", userId);
        },
    },
};
</script>

<style scoped>
.users {
    padding-top: 80px;
    background-color: #f8f9fa;
}

.users-title {
    color: #343a40;
    margin-bottom: 20px;
}
</style>
