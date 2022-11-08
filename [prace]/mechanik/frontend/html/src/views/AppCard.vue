<template>
<div id="app">
  <v-app id="inspire">
    <v-app id="inspire">
      <v-navigation-drawer
        v-model="drawer"
        app
        clipped
      >
        <v-list dense>
          <v-list-item
            v-for="item in items"
            :key="item.text"
            link
          >
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>
                {{ item.text }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>

      <v-app-bar app clipped-left dense>
        <v-icon class="mx-3" large>mdi-tools</v-icon>
        <v-toolbar-title class="mr-12 align-center">
          <span class="title">Mechanic App v0.1</span>
        </v-toolbar-title>
<!--        <v-spacer></v-spacer>-->
        <div>
          <button>Station 1</button><button>Station 2</button><button>Station 3</button>
        </div>
      </v-app-bar>

      <v-main>
        <v-container class="fill-height" v-if="stationsView">
          <span>text</span>
        </v-container>
      </v-main>
    </v-app>
  </v-app>
</div>
</template>

<script>
// import util from "@/util";

export default {
  name: "AppCard",

  data() {
    return {
      stationsView: true,
      currentDir: "index",
      items: [
      { icon: 'mdi-monitor-dashboard', text: 'Dashboard' },
      { icon: 'mdi-car-wrench', text: 'Stations' },
      { icon: 'mdi-format-align-justify', text: 'Inventory' },
      { icon: 'mdi-cart', text: 'Shop' },
    ],
    items2: [
      { picture: 28, text: 'Joseph' },
      { picture: 38, text: 'Apple' },
      { picture: 48, text: 'Xbox Ahoy' },
      { picture: 56, text: 'Nokia' },
      { picture: 78, text: 'MKBHD' },
    ],
    }
  },

  computed: {

  },

  methods: {
  },

  mounted() {
    // window.addEventListener("message", e => {
    //   if (e.type === "painter") {
    //     this.painterZoneVehicle = e.painterZoneVehicle
    //   }
    // })

    // window.addEventListener("keydown", (e) => {
    //     if (e.key === "Escape") {
    //       util.sendNUI("exitMenu")
    //     }
    //   })
  }
}
</script>

<style scoped>
.v-application {
  background: rgb(0, 0, 0) !important;
  width:70%;
  height:40%;
}
</style>