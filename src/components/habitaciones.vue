<template>
  <v-container>
    <v-row justify="center" id="separador">
      <v-col sm="12" md="12">
        <center>
          <h1 id="top">Listado de habitaciones disponibles</h1>
        </center>
      </v-col>

    </v-row>

    <v-row justify="center">
      <v-col sm="12" md="3" v-for="(item, i) in habitacion" :key="i">
        <!-- Nueva card -->

       <v-card class="fill-height ma-0" max-width="344" id="top">
          <v-img :src="item.img" width="300px" height="200px" style ="object-fit: scale-down"></v-img>

          <v-card-title style="font-size: 17px">
            Habitacion: {{ item.nombre }}
          </v-card-title>

          <v-card-subtitle v-if="item.idcategoriaHab == 1">
            <strong>Tipo de Habitacion: Lujo</strong>
            <br>
            <strong>capacidad: 9-6</strong>
            <br>
            <strong>Precio: {{ item.precio }}$ por dia.</strong>
          </v-card-subtitle>

          <v-card-subtitle v-if="item.idcategoriaHab == 2">
            <strong>Tipo de Habitacion: Regular</strong>
            <br>
            <strong>capacidad: 6-4</strong>
            <br>
            <strong>Precio: {{ item.precio }}$ por dia.</strong>
          </v-card-subtitle>

          <v-card-subtitle v-if="item.idcategoriaHab == 3">
            <strong>Tipo de Habitacion: Normal</strong>
            <br>
            <strong>Capacidad: 3-1</strong>
            <br>
            <strong>Precio: {{ item.precio }}$ por dia.</strong>
          </v-card-subtitle>
          <v-card-actions>
            <v-btn color="orange lighten-2" text @click="
              toggle(
                item.idhabitacion,
                item.precio,
                item.nombre,
                item.idcategoriaHab
              )
            ">
              Reservar
            </v-btn>

            <v-spacer></v-spacer>

            <v-btn color="orange lighten-2" text @click="show = !show">
              Descripcion
            </v-btn>
          </v-card-actions>

          <v-expand-transition>
            <div v-show="show">
              <v-divider></v-divider>

              <v-card-text>
                {{ item.descripcion }}

                <div class="text-justy">
                  <v-dialog v-model="dialog" width="500">
                    <template v-slot:activator="{ on, attrs }">
                      <br>
                      <v-btn color="red lighten-2" dark v-bind="attrs" v-on="on"
                        @click="equipamientoHab(item.idequipamiento)">
                        Detalle de habitación
                      </v-btn>
                    </template>

                    <v-card>
                      <v-card-title class="text-h5 grey lighten-2">
                        Detalle de habitación
                      </v-card-title>

                      <v-card-text>
                        <ul>
                          <li>
                            Mesas: {{ equipamiento.mesas }}
                          </li>
                          <li>
                            Camas: {{ equipamiento.camas }}
                          </li>
                          <li>
                            Televisores: {{ equipamiento.televisores }}
                          </li>
                          <li>
                            Sofas: {{ equipamiento.sofas }}
                          </li>
                          <li>
                            Neveras: {{ equipamiento.neveras }}
                          </li>
                          <li>
                            Baños: {{ equipamiento.baños }}

                          </li>
                          <li>
                            Aireacondicionado: si

                          </li>
                          <li>
                            Internet: si

                          </li>
                          <li>
                            Ropero: {{ equipamiento.ropero }}
                          </li>
                        </ul>
                      </v-card-text>

                      <v-divider></v-divider>

                      <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="primary" text @click="dialog = false">
                          Cerrar
                        </v-btn>
                      </v-card-actions>
                    </v-card>
                  </v-dialog>
                </div>
              </v-card-text>
            </div>
          </v-expand-transition>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    show: false,
    habitacion: [],
    numero: 0,
    token: "",
    dialog: false,
    equipamiento: [],
  }),
  created() {
    this.habitaciones();
    this.obtener();
  },
  mounted() { },
  methods: {
    toggle(id, precio, nombre, id2) {
      this.token = window.sessionStorage.getItem("authToken");
      let hab = {
        idHab: id,
        precioHab: precio,
        nombreHab: nombre,
        idcategoriaHab: id2,
      };
      let habitaciones = JSON.stringify(hab);
      window.sessionStorage.setItem("Habitacion", habitaciones);

      if (this.token) {
        location.replace("/reserva");
      } else {
        location.replace("/login");
      }
    },
    obtener() {
      let numero = window.localStorage.getItem("categoriaHab");
      this.numero = parseInt(numero);
      console.log("yooo", this.numero);
    },
    habitaciones: async function () {
      let numero = window.localStorage.getItem("categoriaHab");
      this.numero = parseInt(numero);
      // this.numero = null
      console.log(this.numero);
      if (this.numero !== 0) {
        await axios
          .get("http://localhost:3000/habitaciones/" + this.numero)
          .then((resp) => {
            if (resp.status == 200) {
              this.habitacion = resp.data;
              console.log("todo birn",);
            }
            console.log(this.habitacion);
          });
      } else {
        await axios.get("http://localhost:3000/habitaciones").then((resp) => {
          if (resp.status == 200) {
            this.habitacion = resp.data;
            console.log("todo birn");
          }
          console.log(this.habitacion);
        });
      }
    },

    equipamientoHab: async function (habitacion) {
      console.log("Id hab: ", habitacion);
      await axios
        .get("http://localhost:3000/equipamiento/" + habitacion)
        .then((resp) => {
          if (resp.status == 200) {
            this.equipamiento = resp.data;
            console.log(this.equipamiento);
          }
        });
    },
  },
  setup() { },
};
</script>

<style scoped>
#separador {
  margin-top: 30px;
}
</style>
