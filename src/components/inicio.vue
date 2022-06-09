<template>
    <v-container>
        <v-row justify="center" id="top">
            <v-carousel cycle>
                <v-carousel-item v-for="(item, i) in items" :key="i" :src="item.src"
                    reverse-transition="fade-transition" transition="fade-transition"></v-carousel-item>
            </v-carousel>

            <v-container>
                <v-row justify="center" id="top">
                    <v-col sm="12" md="12">
                        <center>
                            <h1>Categorías de habitación</h1>
                        </center>
                    </v-col>

                    <v-col sm="12" md="3" v-for="(item, i) in categoriaHab" :key="i">

                        <!-- Nueva card -->

                        <v-card class="mx-auto" max-width="344" id="top">
                            <v-img :src="item.img" width="300px"></v-img>

                            <v-card-title>
                                {{ item.titulo }}
                            </v-card-title>

                            <v-card-subtitle>
                                {{ item.capacidad }}
                            </v-card-subtitle>

                            <v-card-actions>
                                <v-btn color="orange lighten-2" text @click="linkToggle(item.idcategoriaHab)">
                                    Ver habitaciones
                                </v-btn>

                                <v-spacer></v-spacer>

                                <v-btn icon @click="show = !show">
                                    <v-icon>{{ show ? 'mdi-chevron-up' : 'mdi-chevron-down' }}</v-icon>
                                </v-btn>
                            </v-card-actions>

                            <v-expand-transition>
                                <div v-show="show">
                                    <v-divider></v-divider>

                                    <v-card-text>
                                        {{ item.descricion }}
                                    </v-card-text>
                                </div>
                            </v-expand-transition>
                        </v-card>
                    </v-col>
                </v-row>
            </v-container>

            <v-container>
                <v-row justify="center">
                    <v-col md="12" sm="12" xl="12" id="top">
                        <center>
                            <h1>Servicios del hotel</h1>
                        </center>
                    </v-col>
                    <v-col md="4" id="top">
                        <v-card class="pa-2" outlined tile>
                            <v-img lazy-src="../../public/images/servicios/servicio1.jpg" max-height="290"
                                max-width="500" src="../../public/images/servicios/servicio1.jpg"></v-img>
                        </v-card>
                    </v-col>
                    <v-col md="5">
                        <v-card class="pa-2" outlined tile>
                            <v-img lazy-src="../../public/images/servicios/servisios2.jpg" max-height="290"
                                max-width="500" src="../../public/images/servicios/servisios2.jpg"></v-img>
                        </v-card>
                    </v-col>
                    <v-col md="4">
                        <v-card class="pa-2" outlined tile>
                            <v-img lazy-src="../../public/images/servicios/granadaH.jpg" max-height="290"
                                max-width="500" src="../../public/images/servicios/granadaH.jpg"></v-img>
                        </v-card>
                    </v-col>
                    <v-col md="4">
                        <v-card class="pa-2" outlined tile>
                            El sistema cuenta con tres paquetes de servicios los cuales son:
                            <ul>
                                <li>Paquete basico</li>
                                <li>Paquete regular</li>
                                <li>Paquete premium</li>
                            </ul>
                        </v-card>
                    </v-col>
                </v-row>
            </v-container>
        </v-row>
    </v-container>
</template>

<script>


import axios from 'axios'
export default {
    name: 'HelloWorld',
    setup() {

    },
    data() {

        return {
            show: false,
            items: [
                {
                    src: 'https://exp.cdn-hotels.com/hotels/9000000/8400000/8396100/8396008/b1f54e86_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
                },
                {
                    src: 'https://exp.cdn-hotels.com/hotels/9000000/8400000/8396100/8396008/0fadf41c_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
                },
                {
                    src: 'https://exp.cdn-hotels.com/hotels/9000000/8400000/8396100/8396008/23daf29f_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
                },
            ],
            categoriaHab: [],
        }
    },

    created() {
        this.categoriaHabitacion();
    },

    methods: {
        linkToggle(numero) {
            window.localStorage.setItem('categoriaHab', numero)
            location.replace('/Habitaciones')
        },

        categoriaHabitacion: async function () {
            console.log('Hola');
            await axios
                .get('https://dlido.herokuapp.com/categoriaHab')
                .then((resp) => {
                    if (resp.status == 200) {
                        this.categoriaHab = resp.data
                    }
                })
            console.log(this.categoriaHab);
        },
    }
}

let inactivityTime = function () {
    let time;
    window.onload = resetTimer;
    document.onload = resetTimer;
    document.onmousemove = resetTimer;
    document.onmousedown = resetTimer; // touchscreen presses
    document.ontouchstart = resetTimer;
    document.onclick = resetTimer; // touchpad clicks
    document.onkeypress = resetTimer;
    document.addEventListener('scroll', resetTimer, true); // improved; see comments
    function logout() {
        window.sessionStorage.clear();
        location.replace('/login')
        console.log("You are now logged out.")
    }
    function resetTimer() {
        clearTimeout(time);
        time = setTimeout(logout, 30000);


    }
};
inactivityTime();
console.log('Please wait...');
</script>
</script>


<style scoped>
#top {
    margin-top: 30px;
}
</style>
