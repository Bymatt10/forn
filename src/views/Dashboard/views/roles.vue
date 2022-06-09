<template>
  <v-container>
    <v-row>
      <v-col md="6" id="text-title">
        <h3>Roles</h3>
      </v-col>

      <v-row justify="start">
        <v-dialog v-model="dialogCrear" persistent max-width="600px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="primary" dark v-bind="attrs" v-on="on">
              Asignar roles de usuario
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">Asignacion de roles de usuario</span>
            </v-card-title>
            <v-card-text>
              <v-container>
                <v-form v-model="validacionCreacion">
                  <v-row no-gutters>
                    <v-col cols="12" sm="6">
                      <v-select v-model="create.idUsuario" :items="usuarios" item-text="nombre" item-value="idUsuario"
                        label="Usuario" :rules="Rules" required></v-select>
                    </v-col>
                    <v-col cols="12" sm="6">
                      <v-select v-model="create.idRol" :items="rol" item-text="nombreRol" item-value="idrRol"
                        label="Roles" :rules="Rules" required></v-select>
                    </v-col>

                    <!-- <v-col cols="12" sm="6">
                      <v-text-field
                        type="number"
                        label="Cantidad de personas"
                        :rules="Rules"
                        required
                      ></v-text-field>
                    </v-col> -->

                    <v-col md="3" style="margin-right: 390px">
                      <v-btn @click="createRolsUsers()" :disabled="!validacionCreacion" class="mr-4" color="success">
                        Enviar
                      </v-btn>
                    </v-col>
                  </v-row>
                </v-form>
              </v-container>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="dialogCrear = false">
                Cerrar
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-row>
      <v-col md="12">
        <v-simple-table height="600px">
          <template v-slot:default>
            <thead>
              <tr>
                <th class="text-left">Nombre Usuario</th>
                <th class="text-left">Rol</th>
                <th class="text-left">Estado</th>
                <th class="text-left">Cliente</th>
                <th class="text-left">Trabajador</th>
                <th class="text-left"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item, i) in ObtenerUsuarios" :key="i">
                <td>
                  <div v-for="(itemUsuario, i) in usuarios" :key="i">
                    <div v-if="itemUsuario.idUsuario == item.idUsuario">
                      {{itemUsuario.nombre}}
                    </div>
                  </div>
                </td>
                <td>
                  <div v-for="(itemRol, i) in rol" :key="i">
                    <div v-if="itemRol.idrRol == item.idRol">
                      {{itemRol.nombreRol}}
                    </div>
                  </div>
                </td>
                <td>
                  <div v-if="item.estado == true"> Activo</div>
                  <div v-if="item.estado == false"> Inactivo</div>
                </td>
                <td>
                  <div v-if="item.cliente == true"> Si</div>
                  <div v-if="item.cliente == false"> No</div>
                </td>
                <td>
                  <div v-if="item.trabajador == true"> Si</div>
                  <div v-if="item.trabajador == false"> No</div>
                </td>
                <td>
                  <v-btn class="mx-2" v-if="item.estado == true"
                    @click="stateRolsUsers(item.idUsuarioRol, estadoDesactivado)" fab dark small color="red">
                    <v-icon dark>
                      mdi-account-convert
                    </v-icon>
                  </v-btn>

                  <v-btn class="mx-2" v-if="item.estado == false"
                    @click="stateRolsUsers(item.idUsuarioRol, estadoActivado)" fab dark small color="green">
                    <v-icon dark>
                      mdi-account-convert
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
      usuarios: [],
      rol: [],
      dialogCrear: false,
      
      validacionCreacion: true,
      menu: false,
      menu2: false,
      Rules: [(v) => !!v || "El campo es requerido"],

      estadoActivado: true,
      estadoDesactivado: false,

      boolean: [
        {
          cliente: "No es cliente",
          label: "No es trabajador",
          condicional: 1
        },
        {
          cliente: "Es cliente",
          label: "Es trabajador",
          condicional: 2  
        }
      ],
      create: {
        idUsuario: 0,
        idRol: 0,
        cliente: false,
        trabajador: true,
        estado: false,
      }
  }),

  created(){
      this.obtenerUsuariosRoles();
      this.obtenerUsuarios();
      this.obtenerRol();
  },

  methods:{

    stateRolsUsers: async function (id, estadoCambio) {
          let Aidi = parseInt(id)
          let estado = {estado: estadoCambio};
          console.log("Id Reserva: ", Aidi, "Estado: ", estado);
        await axios.put("https://dlido.herokuapp.com/usuariorol/cambioEstado/"+Aidi, estado).then((resp) => {
            if (resp.status == 204) {
              location.reload();
            }
        });
      },

    createRolsUsers: async function (){
      await axios
        .post("https://dlido.herokuapp.com/usuariorol/create", this.create)
        .then((resp) => {
          if (resp.status == 201) {
            alert("EL rol del usuariario fue asignado exitosamente.");
            location.reload();
          }
        });
    },

      obtenerUsuarios: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/usuario").then((resp) => {
            if (resp.status == 200) {
            this.usuarios = resp.data;
            }
        });
      },

      obtenerRol: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/rol").then((resp) => {
            if (resp.status == 200) {
            this.rol = resp.data;
            }
        });
      },

      obtenerUsuariosRoles: async function () {
        console.log("Hola");
        await axios.get("https://dlido.herokuapp.com/usuariorol").then((resp) => {
            if (resp.status == 200) {
            this.ObtenerUsuarios = resp.data;
            }
        });
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