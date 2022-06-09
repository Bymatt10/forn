<template>
  <v-card
    class="mx-auto"
    max-width="700"
    outlined
    id="margen"
  >
    <center><h3 id="margen">Formulario de registro de empresas</h3></center>
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
                    <label>Razon social</label>
                    <v-text-field
                        style="margin-right: 15px;"
                        v-model="juridico.razonSocial"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col
                    md="5"
                >
                    <label>Siglas</label>
                    <v-text-field
                        v-model="juridico.siglas"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>

                <v-col
                    md="5"
                >
                    <label>Ruc</label>
                    <v-text-field
                        style="margin-right: 15px;"
                        v-model="juridico.ruc"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col
                    md="5"
                >
                    <label>Tipo actividad juridica</label>
                    <v-select
                        v-model="juridico.idActividad"
                        :items="actividadjurid"
                        item-text="actividad"
                        item-value="idactividad"
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
                        v-model="juridico.telefono"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col
                    md="5"
                >
                    <label>Celular</label>
                    <v-text-field
                        v-model="juridico.celular"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>

                <v-col
                    md="10"
                >
                    <label>Dirección</label>
                    <v-textarea
                        v-model="juridico.direccion"
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
                        v-model="juridico.idPais"
                        :rules="Rules"
                        style="margin-right: 15px;"
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
                        v-model="juridico.idCiudad"
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
                        v-model="juridico.codigoPostal"
                        style="margin-right: 15px;"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>
                <v-col md="5">
                    <label>Correo</label>
                    <v-text-field
                        v-model="juridico.correo"
                        :rules="emailRules"
                        required
                    ></v-text-field>
                </v-col>

                <v-col md="5">
                    <label>Contraseña</label>
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
                    <label>Confirmar contraseña</label>
                    <v-text-field
                        :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                        :type="show2 ? 'text' : 'password'"
                        :rules="Rules"
                        v-model="confirmPassword"
                        required
                        hint="At least 8 characters"
                        @click:append="show2 = !show2"
                    ></v-text-field>
                </v-col>
                <v-col md="3" style="margin-right: 390px">
                    <v-btn
                        :disabled="!valid"
                        class="mr-4"
                        color="success"
                        @click="Entidadjuridico()"
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
        show1: false,
        show2: false,
        paisId: 0,
        paises: [],
        ciudad: [],
        tipoentidad: [],
        actividadjurid: [],
        valid: false,
        firstname: '',
        lastname: '',
        Rules: [
            v => !!v || 'Es requerido este campo',
        ],
        email: '',
        emailRules: [
            v => !!v || 'E-mail is required',
            v => /.+@.+/.test(v) || 'E-mail must be valid',
        ],
        juridico: {
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
            idTipoPersona: 2
        },

        password: "",
        confirmPassword: "",

        respuesta: {},
        respuesta2: "",
    }),
    created(){
        this.Pais();
        this.Ciudad();
        this.ActividadJuridica();
    },
    mounted() {
    },
    methods: {

        Entidadjuridico: async function (){
            console.log(this.juridico);
            console.log(this.password);
            await axios
            .post("http://localhost:3000/entidad/create/", this.juridico)
            .then((resp) => {
                if (resp.status == 201) {
                   this.respuesta = resp.data 
                   console.log("entidad id",this.respuesta);
                   this.Usuario();
                    
                }
            })
            .catch(error => {
                let respu = error.message
                alert(respu);
                console.log(this.respuesta);
            })
        },
        Usuario: async function (){
            let send = {
                nombre: this.juridico.razonSocial,
                email: this.juridico.correo,
                password: this.password,
                estado: true,
                idEntidad: this.respuesta.idEntidad,
            }
            await axios
            .post("http://localhost:3000/usuario/create/", send)
            .then((resp) => {
                if (resp.status == 201) {
                   alert("Usuario juridico creado exitosamente.");
                    location.replace('/login')
                }
            })
            .catch(error => {
                let respu = error.message
                alert(respu);
                console.log(this.respuesta);
            })
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
        //  Entidad: async function () {
        //      console.log('Hola');
        //     await axios
        //     .get('http://localhost:3000/entidad/')
        //     .then((resp) => {
        //     if (resp.status == 200) {
        //         this.tipoentidad = resp.data
        //     }
        //     })
        //     console.log(this.tipoentidad);
        //  },
         ActividadJuridica: async function () {
             console.log('Hola');
            await axios
            .get('http://localhost:3000/actividadJuridica')
            .then((resp) => {
            if (resp.status == 200) {
                this.actividadjurid = resp.data
            }
            })
            console.log(this.actividadjurid);
         },
            
    },
    setup() {
        
    },
}
</script>

<style scoped>
#margen {
    margin-top: 40px;
}
</style>