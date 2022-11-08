<template>
  <v-app dark v-if="isVisible">
    <component :is="view"/>
  </v-app>
</template>

<script>
import {mapMutations} from "vuex";
import PainterCard from "@/views/PainterCard";
import AppCard from "@/views/AppCard";
import util from "@/util";

export default {
  name: "App",
  // data: () => ({
  //   view: PainterCard,
  //   isVisible: false,
  // }),

    data() {
      return {
        view: AppCard,
        isVisible: true,
      }
  },

  methods: {
    ...mapMutations(["setPlayerID"]),
    toggleShow(view) {
      console.log(`view.payload.view: ${view.payload.view}`)
      console.log(`view.payload: ${view.payload}`)
      view = view.payload
      switch (String(view)) {
        case "mechanicUI":
          this.view = AppCard;
          console.log("MECHANIC!")
          break;
        case "painterUI":
          this.view = PainterCard;
          console.log("PAINTER!")
          break;
        default:
          console.log("DEFAULT!")
          this.view = PainterCard;
          break;
      }
      this.isVisible = !this.isVisible;
    },
  },

  mounted() {
    this.listener = window.addEventListener("message", (e) => {
      const item = e.data || e.detail;
      if (this[item.type]) this[item.type](item);
      // if (item.type === "toggleShow") {
      //   this.toggleShow(item.view)
      // }
    });

    window.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        util.sendNUI("exitMenu")
      }
    })
  },

  destroyed() {
    window.removeEventListener("message", this.listener);
  },
};
</script>
<style>
 * {
  box-sizing: border-box;
 }

::-webkit-scrollbar {
  width: 0;
  display: inline !important;
}

.v-application {
  background: rgb(0, 0, 0, 0) !important;
}
</style>
