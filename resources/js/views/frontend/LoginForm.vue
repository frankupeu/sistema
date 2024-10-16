<template>
  <div class="login-form-container">
    <h2 class="text-center mb-4">Iniciar Sesión</h2>
    <form @submit.prevent="handleSubmit" class="mt-4">
      <div class="mb-3">
        <label for="email" class="form-label">Correo Electrónico</label>
        <input
          type="email"
          v-model="email"
          id="email"
          class="form-control"
          :class="{ 'is-invalid': emailError }"
          required
        />
        <div class="invalid-feedback">{{ emailError }}</div>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Contraseña</label>
        <input
            type="password"
            v-model="password"
            id="password"
            class="form-control"
            :class="{ 'is-invalid': passwordError }"
            required
        />
          <div class="invalid-feedback">{{ passwordError }}</div>
      </div>
        <button type="submit" class="btn btn-primary w-100" :disabled="loading">
            <span v-if="loading" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
            <span v-else>Iniciar Sesión</span>
        </button>
    </form>
      <div class="text-center mt-3">
          <a href="#">¿Olvidaste tu contraseña?</a>
      </div>
      <hr class="my-4"/>
      <div class="text-center mt-3">
          <button class="btn btn-secondary" @click="$emit('close')">Cerrar</button>
      </div>
  </div>
</template>

<script>
export default {
    data() {
        return {
            email: '',
            password: '',
            loading: false,
            emailError: '',
            passwordError: '',
        };
    },
    methods: {
        handleSubmit() {
            this.emailError = '';
            this.passwordError = '';

            if (!this.validateEmail(this.email)) {
                this.emailError = 'Por favor, ingresa un correo electrónico válido.';
            }
            if (this.password.length < 6) {
                this.passwordError = 'La contraseña debe tener al menos 6 caracteres.';
            }

            if (this.emailError || this.passwordError) {
                return;
            }

            this.loading = true;

            // Aquí puedes agregar la lógica para el inicio de sesión
            setTimeout(() => {
                console.log("Iniciando sesión con:", this.email, this.password);
                this.loading = false;
                // Aquí maneja el éxito o el error de inicio de sesión
            }, 2000); // Simulando un retraso para la carga
        },
        validateEmail(email) {
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(String(email).toLowerCase());
        },
        loginWithGoogle() {
            console.log("Iniciar sesión con Google");
            // Lógica para inicio de sesión con Google
        },
        loginWithFacebook() {
            console.log("Iniciar sesión con Facebook");
            // Lógica para inicio de sesión con Facebook
        }
    }
};
</script>

<style scoped>
.login-form-container {
    max-width: 400px;
    margin: auto;
    padding: 20px;
    border-radius: 12px;
    background: #f8f9fa;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}
</style>
