<template>
  <v-card
    class="mx-auto"
    max-width="700"
    outlined
    style="margin-top: 50px"
  >
    <center><h3 style="margin-top: 50px">Información de cuenta</h3></center>
    <v-form v-model="valid">
        <v-container>
            <v-row 
                no-gutters
                justify="center"
                id="margen"
            >
                

                <v-col
                    md="5"
                >
                    <label>Primer nombre</label>
                    <v-text-field
                        style="margin-right: 15px;"
                        v-model="natural.primerNombre"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col
                    md="5"
                >
                    <label>Segundo nombre</label>
                    <v-text-field
                        v-model="natural.segundoNombre"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>

                <v-col
                    md="5"
                >
                    <label>Primer apellido</label>
                    <v-text-field
                        style="margin-right: 15px;"
                        v-model="natural.primerApellido"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col
                    md="5"
                >
                    <label>Segundo apellido</label>
                    <v-text-field
                        v-model="natural.segundoApellido"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col
                    md="5"
                >
                    <label>Genero</label>
                    <v-select
                        style="margin-right: 15px;"
                        v-model="natural.genero"
                        :items="genero"
                        item-text="genero"
                        item-value="genero"
                        :rules="Rules"
                        required
                    ></v-select>
                </v-col>

                <v-col
                    md="5"
                >
                    <label>Telefono</label>
                    <v-text-field
                        style="margin-right: 15px;"
                        v-model="natural.telefono"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col
                    md="5"
                >
                    <label>Celular</label>
                    <v-text-field
                        style="margin-right: 15px;"
                        v-model="natural.celular"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>

                

                <v-col
                    md="5"
                >
                    <label>Identificacion</label>
                    <v-text-field
                        style="margin-right: 15px;"
                        v-model="natural.identificacion"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>

                <v-col
                    md="10"
                >
                    <label>Dirección</label>
                    <v-textarea
                        v-model="natural.direccion"
                        :rules="Rules"
                        required
                    >
                    </v-textarea>
                </v-col>

                <v-col
                    md="5"
                >
                    <label>Pais</label>
                    <v-select
                        style="margin-right: 15px;"
                        v-model="natural.idPais"
                        :rules="Rules"
                        :items="paises"
                        item-text="Nombre"
                        item-value="idPais"
                        required
                    ></v-select>
                </v-col>

                <v-col
                    md="5"
                >
                    <label>Ciudad</label>
                    <v-select
                        v-model="natural.idCiudad"
                        :items="ciudad"
                        item-text="nombre"
                        item-value="idCiudad"
                        :rules="Rules"
                        required
                    ></v-select>
                </v-col>
                
                <v-col md="5">
                    <label>Codigo postal</label>
                    <v-text-field
                        style="margin-right: 15px;"
                        v-model="natural.codigoPostal"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col md="5">
                </v-col>
                <v-col md="3" style="margin-right: 390px">
                    <v-btn
                        :disabled="!valid"
                        class="mr-4"
                        color="success"
                        @click="EntidadEnviar()"
                    >
                    Enviar
                    </v-btn>
                </v-col>
            </v-row>
        </v-container>
    </v-form>
    <v-divider inset></v-divider>
    <v-form v-model="valid2">
        <v-container>
            <v-row 
                no-gutters
                justify="center"
                id="margen"
            >
            <v-col md="5">
                    <label>Contraseña actual</label>
                    <v-text-field
                        :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                        :type="show1 ? 'text' : 'password'"
                        style="margin-right: 15px;"
                        :rules="Rules"
                        v-model="password"
                        required
                        hint="At least 8 characters"
                        @click:append="show1 = !show1"
                    ></v-text-field>
                </v-col>
                <v-col md="5">
                    <label>Nueva contraseña</label>
                    <v-text-field
                        :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                        :type="show2 ? 'text' : 'password'"
                        :rules="Rules"
                        v-model="usuario.password"
                        required
                        hint="At least 8 characters"
                        @click:append="show2 = !show2"
                    ></v-text-field>
                </v-col>
                <v-col md="3" style="margin-right: 390px">
                    <v-btn
                        :disabled="!valid2"
                        class="mr-4"
                        color="success"
                        @click="UsuarioEnviar()"
                    >
                    Enviar
                    </v-btn>
                </v-col>
            </v-row>
        </v-container>
    </v-form>
  </v-card>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    tipoentidad: [],
    actividadjurid: [],

    genero: [{ genero: "M" }, { genero: "F" }],

    natural: {
      primerNombre: "",
      segundoNombre: "",
      primerApellido: "",
      segundoApellido: "",
      fechaNacimiento: new Date(
        Date.now() - new Date().getTimezoneOffset() * 60000
      )
        .toISOString()
        .substr(0, 10),
      genero: "",
      telefono: "",
      celular: "",
      correo: "",
      direccion: "",
      identificacion: "",
      tipoIdentificacion: "",
      razonSocial: null,
      siglas: null,
      ruc: null,
      codigoPostal: "",
      idPais: "",
      idCiudad: "",
      idActividad: null,
      idTipoPersona: 0,
    },
    personaEntidad: 0,
    obtener: 0,
    valid: false,
    valid2: false,
    show1: false,
    show2: false,

    Rules: [
        v => !!v || 'Es requerido este campo',
    ],
    emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+/.test(v) || 'E-mail must be valid',
    ],
    paises:[],
    ciudad:[],
    usuario:{
        nombre: "",
        email: "",
        password: "",
        estado: true,
        idEntidad: 0,
    },
    comparacion: "",
    correo: "",
    password: "",
  }),
  created() {
    this.Entidad();
    this.Pais(),
    this.Ciudad();
  },
  mounted() {},
  methods: {
    EntidadEnviar: async function (){
    await axios
    .put("http://localhost:3000/entidad/update/" + this.obtener + "/", this.natural)
    .then((resp) => {
        if (resp.status == 204) {
            alert('Usuario editado correctamente');
            location.reload();
        }
    })
    .catch(error => {
        let respu = error.message
        alert(respu);
        console.log(this.respuesta);
    })
    },
    UsuarioEnviar: async function (){
        let contrasena = window.btoa(this.password)
        
        if ( contrasena == this.comparacion) {
            alert("Las contraseñas no son iguales")
            return 0;
        }
        await axios
        .put("http://localhost:3000/usuario/update/" + this.obtener + "/", this.usuario)
        .then((resp) => {
            if (resp.status == 204) {
                alert("Usuario Natural editado exitosamente.");
                location.reload();
            }
        })
        .catch(error => {
            let respu = error.message
            alert(respu);
            console.log(this.respuesta);
        })
    },
    UsuarioObtener: async function (correo){
        await axios
        .get('http://localhost:3000/usuario/'+correo)
        .then((resp) => {
            if (resp.status == 200) {
                this.usuario.nombre = resp.data[0].nombre;
                this.usuario.email = resp.data[0].email;
                this.comparacion = resp.data[0].password;
                this.usuario.estado = resp.data[0].estado;
                this.usuario.idEntidad = resp.data[0].idEntidad;
                console.log("usuario Editado: ", this.usuario);
            }
        })
        .catch(error => {
            let respu = error.message
            alert(respu);
            console.log(this.respuesta);
        })
    },
    Entidad: async function () {
      let numero = window.sessionStorage.getItem("seleccionado");
      this.obtener = parseInt(numero);
      console.log("yooo", this.obtener);
      console.log("Hola");
      await axios
        .get("http://localhost:3000/entidad/" + this.obtener)
        .then((resp) => {
          if (resp.status == 200) {
            let entidad = resp.data;
            this.natural.primerNombre = entidad.primerNombre;
            this.natural.segundoNombre = entidad.segundoNombre;
            this.natural.primerApellido = entidad.primerApellido;
            this.natural.segundoApellido = entidad.segundoApellido;
            this.natural.fechaNacimiento = entidad.fechaNacimiento;
            this.natural.genero = entidad.genero;
            this.natural.telefono = entidad.telefono;
            this.natural.celular = entidad.celular;
            this.natural.correo = entidad.correo;
            this.natural.direccion = entidad.direccion;
            this.natural.identificacion = entidad.identificacion;
            this.natural.tipoIdentificacion = entidad.tipoIdentificacion;
            this.natural.razonSocial = entidad.razonSocial;
            this.natural.siglas = entidad.siglas;
            this.natural.ruc = entidad.ruc;
            this.natural.codigoPostal = entidad.codigoPostal;
            this.natural.idPais = entidad.idPais;
            this.natural.idCiudad = entidad.idCiudad;
            this.natural.idActividad = entidad.idActividad;
            this.natural.idTipoPersona = entidad.idTipoPersona;
            this.UsuarioObtener(this.natural.correo);
            console.log("todo birn", this.natural);
          }
          console.log(this.usuario);
        });
    },
    TipoEntidad: async function () {
      console.log("Hola");
      await axios.get("http://localhost:3000/tipoentidad").then((resp) => {
        if (resp.status == 200) {
          this.tipoentidad = resp.data;
        }
      });
      console.log(this.tipoentidad);
    },
    Pais: async function () {
             console.log('Hola');
            await axios
            .get('http://localhost:3000/pais')
            .then((resp) => {
            if (resp.status == 200) {
                for (let index = 0; index < resp.data.length; index++) {
                    const element = resp.data[index];
                    this.paises.push({
                        idPais: element.idPais,
                        Nombre: element.Nombre
                    });
                }
            }
            })
            console.log(this.paises);
         },
         Ciudad: async function () {
             console.log('Hola');
            await axios
            .get('http://localhost:3000/ciudad')
            .then((resp) => {
            if (resp.status == 200) {
                this.ciudad = resp.data
            }
            })
            console.log(this.ciudad);
         },
    ActividadJuridica: async function () {
      console.log("Hola");
      await axios
        .get("http://localhost:3000/actividadJuridica")
        .then((resp) => {
          if (resp.status == 200) {
            this.actividadjurid = resp.data;
          }
        });
      console.log(this.actividadjurid);
    },
  },
  setup() {},
};
</script>

<style scoped>
#margen {
  margin-top: 150px;
}
