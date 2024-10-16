<template>
  <div>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Mi Aplicación</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Características</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Precios</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contacto</a>
            </li>
            <!-- Botón de Iniciar Sesión -->
            <li class="nav-item">
              <button class="btn btn-outline-light" @click="showLoginForm">Iniciar Sesión</button>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section d-flex align-items-center text-light" style="background-image: url('/images/hero-bg.jpg'); height: 80vh; margin-top: 56px;">
      <div class="container text-center">
        <h1 class="display-3 fw-bold">Bienvenido a Mi Aplicación</h1>
        <p class="lead">La mejor solución para tus necesidades tecnológicas</p>
        <button class="btn btn-primary btn-lg mt-3">Comenzar</button>
      </div>
    </section>

      <!-- Features Section -->
    <section class="features-section py-5">
      <div class="container">
        <h2 class="text-center mb-5">Características Destacadas</h2>
        <div class="row">
          <div class="col-md-4 text-center">
            <div class="card shadow border-0 hover-card">
              <div class="card-body">
                <i class="bi bi-speedometer2 display-4 text-primary"></i>
                <h3 class="mt-3">Rápido Rendimiento</h3>
                <p>Optimizado para brindar la mejor experiencia de usuario con tiempos de respuesta rápidos.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 text-center">
            <div class="card shadow border-0 hover-card">
              <div class="card-body">
                <i class="bi bi-shield-check display-4 text-primary"></i>
                <h3 class="mt-3">Seguridad Confiable</h3>
                <p>Tu información siempre segura gracias a nuestras características avanzadas de protección de datos.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 text-center">
            <div class="card shadow border-0 hover-card">
              <div class="card-body">
                <i class="bi bi-gear display-4 text-primary"></i>
                <h3 class="mt-3">Alta Configurabilidad</h3>
                <p>Personaliza cada aspecto de la aplicación para adaptarla a tus necesidades.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Formulario de Inicio de Sesión -->
    <div v-if="loginVisible" class="login-form-overlay">
      <LoginForm @close="hideLoginForm" />
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-light py-4">
      <div class="container text-center">
        <p class="mb-0">© 2024 Mi Aplicación. Todos los derechos reservados.</p>
        <ul class="list-inline mt-2">
          <li class="list-inline-item">
            <a href="#" class="text-light">Política de privacidad</a>
          </li>
          <li class="list-inline-item">
            <a href="#" class="text-light">Términos de servicio</a>
          </li>
          <li class="list-inline-item">
            <a href="#" class="text-light">Soporte</a>
          </li>
        </ul>
      </div>
    </footer>
  </div>
</template>

<script>
import LoginForm from '../frontend/LoginForm.vue';

export default {
  name: 'Home',
  components: {
    LoginForm
  },
  data() {
    return {
      loginVisible: false // Inicializa el estado del formulario de inicio de sesión
    };
  },
  mounted() {
    // Cargar el estado del formulario desde localStorage
    this.loginVisible = localStorage.getItem('loginVisible') === 'true';
  },
  methods: {
    showLoginForm() {
      this.loginVisible = true;
      localStorage.setItem('loginVisible', 'true'); // Guardar estado en localStorage
    },
    hideLoginForm() {
      this.loginVisible = false;
      localStorage.setItem('loginVisible', 'false'); // Guardar estado en localStorage
    }
  }
};
</script>

<style scoped>
/* Navbar */
.fixed-top {
  z-index: 1030; /* Asegura que el navbar esté por encima de otros elementos */
}

/* Hero Section */
.hero-section {
  background-size: cover;
  background-position: center;
  position: relative;
}

/* Hero Section Overlay */
.hero-section::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.6);
  z-index: 1;
}

.hero-section .container {
  position: relative;
  z-index: 2;
}

/* Footer */
footer ul {
  padding-left: 0;
  list-style-type: none;
}

footer ul li {
  display: inline;
  margin-right: 15px;
}

footer a:hover {
  text-decoration: underline;
}

/* Estilo para el overlay del formulario de inicio de sesión */
.login-form-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999;
}
</style>
