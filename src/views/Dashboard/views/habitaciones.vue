<template>
  <v-container>
    <v-row>
      <v-col md="3">
        <label for="BusquedaEstado">Seleccione un estado</label>
        <v-row justify="center" style="margin-top: 5px;">
          <v-col md="12">
            <v-select :items="estado" item-text="nombre" item-value="nombre" menu-props="auto" v-model="buscar"
              label="Estados">
            </v-select>
          </v-col>
        </v-row>
      </v-col>
      <v-col md="6" id="text-title">
        <h3>Historial de habitaciones</h3>
      </v-col>
      <v-col md="12">
        <v-simple-table height="600px">
          <template v-slot:default>
            <thead>
              <tr>
                <th class="text-left">Imagen</th>
                <th class="text-left">Nombre</th>
                <th class="text-left">Equipamiento</th>
                <th class="text-left">Categoria</th>
                <th class="text-left">Estado</th>
                <th class="text-left">Precio</th>
                <th class="text-left">Descripción</th>
                <th class="text-left">Fecha de creación</th>

                <th class="text-left">
                  <v-select :items="estado" item-text="nombre" item-value="nombre" menu-props="auto"
                    v-model="EstadoSeleccionado" label="Estados"></v-select>
                </th>
              </tr>
            </thead>
            <tbody v-for="(item, i) in habitacionesVisualizar" :key="i">

              <tr v-if="item.estado == buscar">

                <td>
                  <img :src="item.img" width="150" alt="">
                </td>
                <td>{{ item.nombre }}</td>
                <td>
                  <div v-for="(itemEquip, i) in equipamientoVisualizar" :key="i">
                    <ul>
                      <div v-if="item.idequipamiento == itemEquip.idequipamiento">
                        <li>
                          <div v-if="itemEquip.aireacondicionado == true">Aire: Si</div>
                          <div v-if="itemEquip.aireacondicionado == false">Aire: No</div>
                        </li>
                        <li>Baños: {{ itemEquip.baños }}</li>
                        <li>Camas: {{ itemEquip.camas }}</li>
                        <li>Baños: {{ itemEquip.internet }}</li>
                        <li>Televisores:{{ itemEquip.televisores }}</li>

                      </div>
                    </ul>

                  </div>
                </td>
                <td>
                  <div v-for="(itemCate, i) in categoriaHabitacion" :key="i">
                    <div v-if="item.idcategoriaHab == itemCate.idcategoriaHab">
                      {{ itemCate.titulo }}
                    </div>
                  </div>
                </td>
                <td>{{ item.estado }}</td>
                <td>${{ item.precio }}</td>
                <td>{{ item.descripcion }}</td>
                <td>{{ item.created_at.substr(2, 8) }}</td>
                <td>

                  <v-btn depressed @click="CambioEstado(item.idhabitacion, EstadoSeleccionado)" color="yellow">
                    Cambiar
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
    habitacionesVisualizar: [],
    categoriaHabitacion: [],
    equipamientoVisualizar: [],
    EstadoSeleccionado: "",
    buscar: '',
    estado: [
      {
        nombre: "Reservadas"
      },
      {
        nombre: "Limpieza"
      },
      {
        nombre: "Ocupada"
      },
      {
        nombre: "Disponible"
      }
    ]
  }),

  created() {
    this.obtenerHabitaciones();
  },

  methods: {


    CambioEstado: async function (id, estadoCambio) {
      let Aidi = parseInt(id)
      let estado = { estado: estadoCambio };
      if (this.EstadoSeleccionado == "") {
        alert("Selecciona un estado")
        return 0
      }
      await axios.put("https://dlido.herokuapp.com/habitaciones/cambiarEstado/" + Aidi, estado).then((resp) => {
        if (resp.status == 204) {
          this.obtenerHabitaciones();
        }
      });
    },
    obtenerTipoHabitaciones: async function () {
      await axios.get("https://dlido.herokuapp.com/categoriaHab").then((resp) => {
        if (resp.status == 200) {
          this.categoriaHabitacion = resp.data;
        }
      });
    },

    obtenerHabitaciones: async function () {
      await axios.get("https://dlido.herokuapp.com/habitaciones/obtener").then((resp) => {
        if (resp.status == 200) {
          this.habitacionesVisualizar = resp.data;
          this.obtenerTipoHabitaciones()
          this.obtenerEquipamiento();
        }
      });
    },

    obtenerEquipamiento: async function () {
      await axios.get("https://dlido.herokuapp.com/equipamiento").then((resp) => {
        if (resp.status == 200) {
          this.equipamientoVisualizar = resp.data;
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