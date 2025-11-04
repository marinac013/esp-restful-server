<template>
  <v-container>
    <v-layout text-xs-center wrap>
      <v-flex xs12 sm6 offset-sm3>
          <div class="button-stack">
            <h-card>
              <vtext style="h1">Relay 1</vtext>
              <v-btn fab dark medium color="blue accent-4" @click="toggle(state(0))">
                <v-icon dark>toggle_on</v-icon>
              </v-btn>
              <vtext>this.state[0] ? 'On' : 'Off'</vtext>
            </h-card>
            <h-card>
              <vtext style="h1">Relay 2</vtext>
              <v-btn fab dark medium color="blue accent-4" @click="toggle(state(1))">
                <v-icon dark>toggle_on</v-icon>
              </v-btn>
              <vtext>this.state[1] ? 'On' : 'Off'</vtext>
            </h-card>
            <h-card>
              <vtext style="h1">Relay 3</vtext>
              <v-btn fab dark medium color="blue accent-4" @click="toggle(state(2))">
                <v-icon dark>toggle_on</v-icon>
              </v-btn>
              <vtext>this.state[2] ? 'On' : 'Off'</vtext>
            </h-card>
            <h-card>
              <vtext style="h1">Relay 4</vtext>
              <v-btn fab dark medium color="blue accent-4" @click="toggle(state(3))">
                <v-icon dark>toggle_on</v-icon>
              </v-btn>
              <vtext>this.state[3] ? 'On' : 'Off'</vtext>
            </h-card>
          </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data () {
    return { state: [0, 0, 0, 0] }
  },
  methods: {
    toggle: function (relay) {
      this.state[relay] = this.state[relay] ? 0 : 1 // toggle state
      this.$ajax
        .post(`/api/v1/relays/${relay}`, {
          state: this.state[relay]
        })
        .then(data => {
          console.log(data)
        })
        .catch(error => {
          console.log(error)
        })
    }
  }
}
</script>

<style scoped>
.button-stack {
  display: flex;
  flex-direction: column;   /* stack vertically */
  align-items: center;      /* center horizontally */
  justify-content: center;  /* center vertically in parent */
  gap: 12px;                /* space between buttons */
}

.button-stack button {
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}
</style>
