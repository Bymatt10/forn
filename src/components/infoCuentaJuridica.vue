<template>
    <v-card class="mx-auto" max-width="700" outlined style="margin-top: 50px">
        <center>
            <h3 style="margin-top: 50px">Información de cuenta</h3>
        </center>
        <v-form v-model="valid">
            <v-container>
                <v-row no-gutters justify="center" id="margen">

                    <v-col md="5">
                        <label>Razon social</label>
                        <v-text-field style="margin-right: 15px;" v-model="empresa.razonSocial" :rules="Rules" required>
                        </v-text-field>
                    </v-col>
                    <v-col md="5">
                        <label>Siglas</label>
                        <v-text-field v-model="empresa.siglas" :rules="Rules" required></v-text-field>
                    </v-col>

                    <v-col md="5">
                        <label>Ruc</label>
                        <v-text-field style="margin-right: 15px;" v-model="empresa.ruc" :rules="Rules" required>
                        </v-text-field>
                    </v-col>
                    <v-col md="5">
                        <label>Tipo actividad juridica</label>
                        <v-select v-model="empresa.idActividad" :items="actividadjurid" item-text="actividad"
                            item-value="idactividad" :rules="Rules" required></v-select>
                    </v-col>

                    <v-col md="5">
                        <label>Telefono</label>
                        <v-text-field style="margin-right: 15px;" v-model="empresa.telefono" :rules="Rules" required>
                        </v-text-field>
                    </v-col>
                    <v-col md="5">
                        <label>Celular</label>
                        <v-text-field v-model="empresa.celular" :rules="Rules" required></v-text-field>
                    </v-col>

                    <v-col md="10">
                        <label>Dirección</label>
                        <v-textarea v-model="empresa.direccion" :rules="Rules" required>
                        </v-textarea>
                    </v-col>

                    <v-col md="5">
                        <label>Pais</label>
                        <v-select v-model="empresa.idPais" :rules="Rules" style="margin-right: 15px;" :items="paises"
                            item-text="Nombre" item-value="idPais" required></v-select>
                    </v-col>

                    <v-col md="5">
                        <label>Ciudad</label>
                        <v-select v-model="empresa.idCiudad" :items="ciudad" item-text="nombre" item-value="idCiudad"
                            :rules="Rules" required></v-select>
                    </v-col>

                    <v-col md="5">
                        <label>Codigo postal</label>
                        <v-text-field v-model="empresa.codigoPostal" style="margin-right: 15px;" :rules="Rules"
                            required></v-text-field>
                    </v-col>
                    <v-col md="5">

                    </v-col>
                    <v-col md="3" style="margin-right: 390px">
                        <v-btn :disabled="!valid" class="mr-4" color="success" @click="EntidadEnviar()">
                            Enviar
                        </v-btn>
                    </v-col>
                </v-row>
            </v-container>
        </v-form>


        <v-divider inset></v-divider>
        <v-form v-model="valid2">
            <v-container>
                <v-row no-gutters justify="center" id="margen">
                    <v-col md="5">
                        <label>Contraseña actual</label>
                        <v-text-field :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                            :type="show1 ? 'text' : 'password'" style="margin-right: 15px;" :rules="Rules"
                            v-model="password" required hint="At least 8 characters" @click:append="show1 = !show1">
                        </v-text-field>
                    </v-col>
                    <v-col md="5">
                        <label>Nueva contraseña</label>
                        <v-text-field :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                            :type="show2 ? 'text' : 'password'" :rules="Rules" v-model="usuario.password" required
                            hint="At least 8 characters" @click:append="show2 = !show2"></v-text-field>
                    </v-col>
                    <v-col md="3" style="margin-right: 390px">
                        <v-btn :disabled="!valid2" class="mr-4" color="success" @click="UsuarioEnviar()">
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

    empresa: {
        primerNombre: null,
        segundoNombre: null,
        primerApellido: null,
        segundoApellido: null,
        fechaNacimiento: null,
        genero: null,
        telefono: "",
        celular: "",
        correo: "",
        direccion: "",
        identificacion: null,
        tipoIdentificacion: null,
        razonSocial: "",
        siglas: "",
        ruc: "",
        codigoPostal: "",
        idPais: "",
        idCiudad: "",
        idActividad: "",
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
    this.ActividadJuridica();
  },
  mounted() {},
  methods: {
    EntidadEnviar: async function (){
    await axios
    .put("https://dlido.herokuapp.com/entidad/update/" + this.obtener + "/", this.empresa)
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
        .put("https://dlido.herokuapp.com/usuario/update/" + this.obtener + "/", this.usuario)
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
        .get('https://dlido.herokuapp.com/usuario/'+correo)
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
        .get("https://dlido.herokuapp.com/entidad/" + this.obtener)
        .then((resp) => {
          if (resp.status == 200) {
            let entidad = resp.data;
            this.empresa.primerNombre = entidad.primerNombre;
            this.empresa.segundoNombre = entidad.segundoNombre;
            this.empresa.primerApellido = entidad.primerApellido;
            this.empresa.segundoApellido = entidad.segundoApellido;
            this.empresa.fechaNacimiento = entidad.fechaNacimiento;
            this.empresa.genero = entidad.genero;
            this.empresa.telefono = entidad.telefono;
            this.empresa.celular = entidad.celular;
            this.empresa.correo = entidad.correo;
            this.empresa.direccion = entidad.direccion;
            this.empresa.identificacion = entidad.identificacion;
            this.empresa.tipoIdentificacion = entidad.tipoIdentificacion;
            this.empresa.razonSocial = entidad.razonSocial;
            this.empresa.siglas = entidad.siglas;
            this.empresa.ruc = entidad.ruc;
            this.empresa.codigoPostal = entidad.codigoPostal;
            this.empresa.idPais = entidad.idPais;
            this.empresa.idCiudad = entidad.idCiudad;
            this.empresa.idActividad = entidad.idActividad;
            this.empresa.idTipoPersona = entidad.idTipoPersona;
            this.UsuarioObtener(this.empresa.correo);
            console.log("todo birn", this.empresa);
          }
          console.log(this.usuario);
        });
    },
    TipoEntidad: async function () {
      console.log("Hola");
      await axios.get("https://dlido.herokuapp.com/tipoentidad").then((resp) => {
        if (resp.status == 200) {
          this.tipoentidad = resp.data;
        }
      });
      console.log(this.tipoentidad);
    },
    Pais: async function () {
             console.log('Hola');
            await axios
            .get('https://dlido.herokuapp.com/pais')
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
            .get('https://dlido.herokuapp.com/ciudad')
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
        .get("https://dlido.herokuapp.com/actividadJuridica")
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
</style>
