<template>
  <v-card
    class="mx-auto"
    max-width="700"
    outlined
    id="margen"
  >
    <center><h3 id="margen">Formulario de registro personas</h3></center>
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
                    <label>Fecha de nacimiento</label>
                    <v-menu
                        ref="menu"
                        v-model="menu"
                        :close-on-content-click="false"
                        :return-value.sync="date"
                        transition="scale-transition"
                        offset-y
                        min-width="auto"
                    >
                        <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                            style="margin-right: 15px;"
                            v-model="natural.fechaNacimiento"
                            :rules="Rules"
                            required
                            prepend-icon="mdi-calendar"
                            readonly
                            v-bind="attrs"
                            v-on="on"
                        ></v-text-field>
                        </template>
                        <v-date-picker
                        v-model="natural.fechaNacimiento"
                        no-title
                        scrollable
                        >
                        <v-spacer></v-spacer>
                        <v-btn
                            text
                            color="primary"
                            @click="menu = false"
                        >
                            Cancel
                        </v-btn>
                        <v-btn
                            text
                            color="primary"
                            @click="$refs.menu.save(date)"
                        >
                            OK
                        </v-btn>
                        </v-date-picker>
                    </v-menu>
                </v-col>
                <v-col
                    md="5"
                >
                    <label>Genero</label>
                    <v-select
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
                        v-model="natural.celular"
                        :rules="Rules"
                        required
                    ></v-text-field>
                </v-col>

                <v-col
                    md="5"
                >
                    <label>Tipo identificación</label>
                    <v-select
                        style="margin-right: 15px;"
                        v-model="natural.tipoIdentificacion"
                        :items="tipoIdent"
                        item-text="tipo"
                        item-value="tipo"
                        :rules="Rules"
                        required
                    ></v-select>
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
                    <label>Correo</label>
                    <v-text-field
                        :rules="emailRules"
                        v-model="natural.correo"
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
                        @click="EntidadNatural()"
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
        menu: false,
        modal: false,
        menu2: false,
        show1: false,
        show2: false,
        paisId: 0,
        paises: [],
        genero:[
            {genero:"M"},
            {genero:"F"}
        ],
        tipoIdent:[
            {tipo:"Cedula"},
            {tipo:"Pasaporte"},
            {tipo:"Visa"}
        ],
        ciudad: [],
        tipoentidad: [],
        actividadjurid: [],
        valid: false,
        firstname: '',
        lastname: '',
        Rules: [
            v => !!v || 'Campo requerido',
        ],
        email: '',
        emailRules: [
            v => !!v || 'E-mail is required',
            v => /.+@.+/.test(v) || 'E-mail must be valid',
        ],

        natural: {
            primerNombre: "",
            segundoNombre: "",
            primerApellido: "",
            segundoApellido: "",
            fechaNacimiento: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
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
            idTipoPersona: 1
        },

        password: "",
        confirmPassword: "",

        respuesta: {},
        respuesta2: "",
    }),
    created(){
        this.Pais();
        this.Ciudad();
        this.TipoEntidad();
        this.ActividadJuridica();
    },
    mounted() {
    },
    methods: {
        EntidadNatural: async function (){
            console.log(this.natural);
            console.log(this.password);
            await axios
            .post("http://localhost:3000/entidad/create/", this.natural)
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
                nombre: this.natural.primerNombre +' '+ this.natural.primerApellido ,
                email: this.natural.correo,
                password: this.password,
                estado: false,
                idEntidad: this.respuesta.idEntidad,
            }
            await axios
            .post("http://localhost:3000/usuario/create/", send)
            .then((resp) => {
                if (resp.status == 201) {
                   alert("Usuario Natural creado exitosamente.");
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
         TipoEntidad: async function () {
             console.log('Hola');
            await axios
            .get('http://localhost:3000/tipoentidad')
            .then((resp) => {
            if (resp.status == 200) {
                this.tipoentidad = resp.data
            }
            })
            console.log(this.tipoentidad);
         },
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