
import { createApp } from 'vue';
import App from './App.vue';
import router from './router/index.js';

// Importa Bootstrap
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'bootstrap/dist/css/bootstrap.min.css';

// Importa FontAwesome y los iconos específicos
//import '@fortawesome/fontawesome-free/css/all.css';
//import '@fortawesome/fontawesome-free/js/all.js';
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faUser, faCog, faUsers, faTachometerAlt } from '@fortawesome/free-solid-svg-icons';
import { faUserCircle } from '@fortawesome/free-regular-svg-icons';
import { faFontAwesome } from '@fortawesome/free-brands-svg-icons';

// Añade los iconos específicos a la librería
library.add(faUser, faCog, faUsers, faTachometerAlt, faUserCircle, faFontAwesome);

const app = createApp(App);

// Registra el componente de FontAwesome globalmente
app.component('font-awesome-icon', FontAwesomeIcon);

app.use(router); // Usar Vue Router

app.mount('#app'); // Montar la aplicación en el div con id "app"
