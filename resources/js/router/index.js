// resources/js/router/index.js

import {createRouter, createWebHistory} from 'vue-router';

//import Home from '../views/frontend/Home.vue';
//import AdminLayout from "../views/backend/AdminLayout.vue";
//import Dashboard from "../views/backend/Dashboard.vue";
//import Users from "../views/backend/Users.vue";
//import Settings from "../views/backend/Settings.vue";
//import NotFound from "../views/backend/NotFound.vue";

const Home = () => import ('../views/frontend/Home.vue');
const AdminLayout = () => import('../views/backend/AdminLayout.vue');
const Dashboard = () => import('../views/backend/Dashboard.vue');
const Users = () => import('../views/backend/Users.vue');
const Settings = () => import('../views/backend/Settings.vue');
const NotFound = () => import('../views/backend/NotFound.vue');
//import About from '../views/frontend/About.vue';
//import Contact from '../views/frontend/Contact.vue';
//import Dashboard from '../views/backend/Dashboard.vue';
//import Users from '../views/backend/Users.vue';
//import Settings from '../views/backend/Settings.vue';

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home,
    },
    {
        path: "/admin",
        component: AdminLayout,
        children: [
            {
                path: "dashboard",
                name: "dashboard",
                component: Dashboard,
            },
            {
                path: "users",
                name: "users",
                component: Users,
            },
            {
                path: "settings",
                name: "settings",
                component: Settings,
            },
        ],
    },
    {
        path: "/:catchAll(.*)", // Captura todas las rutas no definidas
        component: NotFound,
    },
    /*{
        path: '/about',
        name: 'About',
        component: About,
    },
    {
        path: '/contact',
        name: 'Contact',
        component: Contact,
    },
    {
        path: '/dashboard',
        name: 'Dashboard',
        component: Dashboard,
    },
    {
        path: '/users',
        name: 'Users',
        component: Users,
    },
    {
        path: '/settings',
        name: 'Settings',
        component: Settings,
    },*/
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
