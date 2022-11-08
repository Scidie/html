import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
	state: {
		playerID: "",
		hideUI: false
	},
	getters: {
		playerID(state) {
			return state.playerID;
		},

		hideUI(state) {
			return state.hideUI;
		}
	},
	mutations: {
		setPlayerID(state, payload) {
			state.playerID = payload.data;
		},

		setHideUI(state) {
			state.hideUI = true;
			console.log("hiding ui!")
		}
	},
	actions: {},
});
