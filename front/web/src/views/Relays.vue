<template>
  <v-container>
    <v-layout text-xs-center wrap>
      <v-flex xs12 sm6 offset-sm3>
        <div class="button-stack">
          <h-card v-for="(relay, index) in state" :key="index">
            <vtext style="h1">Relay {{ index + 1 }}</vtext>
            <v-btn fab dark medium color="blue accent-4" @click="toggle(index)">
              <v-icon dark>{{ relay ? 'toggle_on' : 'toggle_off' }}</v-icon>
            </v-btn>
            <vtext>{{ relay ? 'On' : 'Off' }}</vtext>
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
    toggle: function (relayID) {
      this.$set(this.state, relayID, this.state[relayID] ? 0 : 1) // Toggle state locally
      this.$ajax.post(`/api/v1/relays/${relayID}/?state=${this.state[relayID]}`, {
        headers: { 'Content-Type': 'text/plain' }
      })
      this.then(data => {
        console.log(data)
      })
      this.catch(error => {
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
