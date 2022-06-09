<template>
  <v-container>
    <v-row>
      <v-col md="6" id="text-title">
        <h3>Reservas hechas</h3>
      </v-col>
      <v-col md="12">
        <v-simple-table height="300px">
          <template v-slot:default>
            <thead>
              <tr>
                <th class="text-left">Usuario</th>
                <th class="text-left">Tipo habitación</th>
                <th class="text-left">Habitación</th>
                <th class="text-left">Servicio</th>
                <th class="text-left">Catidad Personas</th>
                <th class="text-left">Fecha inicio</th>
                <th class="text-left">Fecha fin</th>
                <th class="text-left">Estado</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item, i) in reservaVisualizar" :key="i">
                <td>
                  <div v-for="(itemUser, i) in usuariosVisualizar" :key="i">
                    <div v-if="item.idusuario == itemUser.idUsuario">
                      {{itemUser.nombre}}
                    </div>
                  </div>
                </td>
                <td>
                  <div v-for="(itemCate, i) in categoriaHabitacion" :key="i">
                    <div v-if="item.idcategoriaHab == itemCate.idcategoriaHab">
                      {{itemCate.titulo}}
                    </div>
                  </div>
                </td>
                <td>
                  <div v-for="(itemHab, i) in habitacionesVisualizar" :key="i">
                    <div v-if="item.idhabitacion == itemHab.idhabitacion">
                      {{itemHab.nombre}}
                    </div>
                  </div>
                </td>
                <td>
                  <div v-for="(itemServ, i) in Servicioshabitacion" :key="i">
                    <div v-if="item.idservicio == itemServ.idservicio">
                      {{itemServ.servicio}}
                    </div>
                  </div>
                </td>
                <th>{{item.cantPersonas}}</th>
                <td>{{item.fechaEntrada}}</td>
                <td>{{item.fechaSalida}}</td>
                <td>
                  <div v-if="item.estado == 1">Espera</div>
                  <div v-if="item.estado == 2">Rechazada</div>
                  <div v-if="item.estado == 3">probada</div>
                  <div v-if="item.estado == 4">Activa</div>
                  <div v-if="item.estado == 5">Finalizada</div>
                </td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
      reservaVisualizar: [],
      habitacionesVisualizar: [],
      categoriaHabitacion: [],
      Servicioshabitacion: [],
      usuariosVisualizar: [],
  }),

  created(){
      this.obtenerReservas();
      
  },

  methods:{
      obtenerReservas: async function () {
          let usuario = parseInt(window.sessionStorage.getItem("seleccionado"));
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/reserva/"+usuario).then((resp) => {
            if (resp.status == 200) {
            this.reservaVisualizar = resp.data;
            this.obtenerUsuarios();
            this.obtenerTipoHabitaciones();
            this.obtenerHabitaciones();
            this.obtenerServicios();
            }
        });
        console.log(this.reservaVisualizar);
      },

      obtenerUsuarios: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/usuario").then((resp) => {
            if (resp.status == 200) {
            this.usuariosVisualizar = resp.data;
            }
        });
      },

      obtenerTipoHabitaciones: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/categoriaHab").then((resp) => {
            if (resp.status == 200) {
            this.categoriaHabitacion = resp.data;
            }
        });
        console.log(this.categoriaHabitacion);
      },

      obtenerHabitaciones: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/habitaciones").then((resp) => {
            if (resp.status == 200) {
            this.habitacionesVisualizar = resp.data;
            }
        });
        console.log(this.habitacionesVisualizar);
      },

      obtenerServicios: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/servicios").then((resp) => {
            if (resp.status == 200) {
            this.Servicioshabitacion = resp.data;
            }
        });
        console.log(this.Servicioshabitacion);
      },
  }
};
</script>


<style scoped>
#text-title {
  margin-top: 20px;
  margin-left: 40%;
}
</style>