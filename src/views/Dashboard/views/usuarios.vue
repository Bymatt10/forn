<template>
  <v-container>
    <v-row>
      <v-col md="6" id="text-title">
        <h3>Usuarios adminstrativos</h3>
      </v-col>
      <v-col md="12">
        <v-simple-table height="600px">
          <template v-slot:default>
            <thead>
              <tr>
                <th class="text-left">Nombre</th>
                <th class="text-left">Email</th>
                <th class="text-left">Entidad</th>
                <th class="text-left">Estado</th>
                <th class="text-left">Fecha de creación</th>
                <th class="text-left">Editar</th>


                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item, i) in ObtenerUsuarios" :key="i">
                <td v-if="item.trabajador == 1">{{item.nombre}}</td>
                <td v-if="item.trabajador == 1">{{item.email}}</td>
                <td v-if="item.trabajador == 1">
                  <div v-for="(itemEntid, i) in ObtenerEntidades" :key="i">
                    <div v-if="item.idEntidad == itemEntid.idEntidad">
                      {{itemEntid.primerNombre}} {{itemEntid.primerApellido}}
                    </div>
                  </div>
                </td>
                <td v-if="item.trabajador == 1">
                  <div v-if="item.estado == true">Activo</div>
                  <div v-if="item.estado == false">Inactivo</div>
                </td>
                <td v-if="item.trabajador == 1">{{item.created_at.substr(2,8) }}</td>
                <td v-if="item.trabajador == 1">
                  <v-btn class="mx-2" @click="BorrarEntidad(item.idEntidad)" fab dark small color="red">
                    <v-icon dark>
                      mdi-account-minus
                    </v-icon>
                  </v-btn>
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
      ObtenerUsuarios: [],
      ObtenerEntidades: [],
      
  }),

  created(){
      this.obtenerUsuarios();
  },

  methods:{

      obtenerUsuarios: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/usuario").then((resp) => {
            if (resp.status == 200) {
            this.ObtenerUsuarios = resp.data;
            this.obtenerEntidad()
            }
        });
        console.log(this.ObtenerUsuarios);
      },

      obtenerEntidad: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/entidad").then((resp) => {
            if (resp.status == 200) {
            this.ObtenerEntidades = resp.data;
            }
        });
        console.log(this.ObtenerEntidades);
      },
      BorrarUsuarios: async function (id) {
        console.log("Hola");
        await axios.delete("https://dlido.herokuapp.com/usuario/delete/"+id).then((resp) => {
            if (resp.status == 204) {
             alert('Usuario borrado con exito..')
             location.reload()
            }
        });
        console.log(this.ObtenerUsuarios);
      },
      BorrarEntidad: async function (id) {
          let Aidi = parseInt(id)
      let estado = { estado: 2 };
      console.log("Hola");
        await axios.delete("https://dlido.herokuapp.com/entidad/cambioEstado/"+Aidi).then((resp) => {
            if (resp.status == 204) {
               
                this.BorrarUsuarios(Aidi)
            }
        });
        console.log(this.ObtenerEntidades);
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