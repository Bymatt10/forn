import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

Vue.use(VueRouter)



const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    
    {
      path: '/Habitaciones',
      name: 'Habitaciones',
      component: () => import(/* webpackChunkName: "about" */ '../views/Habitaciones.vue')
    },
  
    {
      path: '/login',
      name: 'login',
      component: () => import(/* webpackChunkName: "about" */ '../views/inicioSesion.vue')
    },
  
    {
      path: '/juridica',
      name: 'juridica',
      component: () => import(/* webpackChunkName: "about" */ '../views/juridica.vue')
    },
  
    {
      path: '/persona',
      name: 'persona',
      component: () => import(/* webpackChunkName: "about" */ '../views/persona.vue')
    },
  
    {
      path: '/reserva',
      name: 'reserva',
      component: () => import(/* webpackChunkName: "about" */ '../views/reserva.vue')
    },
    {
      path: '/visualizar',
      name: 'visualizar',
      component: () => import(/* webpackChunkName: "about" */ '../views/visual.vue')
    },
    {
      path: '/cuenta',
      name: 'cuenta',
      component: () => import(/* webpackChunkName: "about" */ '../views/cuenta.vue')
    },
    {
      path: '/cuentaJuridica',
      name: 'cuentaJuridica',
      component: () => import(/* webpackChunkName: "about" */ '../views/cuentaEmpresa.vue')
    },
    {
      path: '/panel',
      name: 'admin-panel',
      component: () =>
          import ( /* webpackChunkName: "Dashboard"*/ '../views/Dashboard/Dashboard.vue'),
          children: [{
                  path: '',
                  name: 'admin-index',
                  component: () =>
                      import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/login.vue'),
              }, 
              {
                path: 'dashboard',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/dashboard.vue'),
              }, 
              {
                path: 'reserva',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/reservas.vue'),
              }, 
              {
                path: 'check-in',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/check-in.vue'),
              },
              {
                path: 'check-out',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/check-out.vue'),
              },
              {
                path: 'habitaciones',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/habitaciones.vue'),
              }, 
              {
                path: 'Clientes',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/cliente.vue'),
              }, 
              {
                path: 'clientes2',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/clientes2.vue'),
              },
              {
                path: 'Usuarios',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/usuarios.vue'),
              },
              {
                path: 'CrearCuenta',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/crear_cuentas.vue'),
              },
              {
                path: 'Rol',
                name: 'admin-index',
                component: () =>
                    import (/* webpackChunkName: "Dashboard"*/'../views/Dashboard/views/roles.vue'),
              },
              // {
              //     path: 'dominios',
              //     name: 'admin-dominios',
              //     component: () =>
              //         import ( /* webpackChunkName: "Dominios"*/ '@/views/dashboard/pages/Dominios'),
              // },
          ],
      }

  ],
})

export default router
