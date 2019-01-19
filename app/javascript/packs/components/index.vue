<template>
  <div>
    <a href="#" v-for="event in events" class="col s12 m6">
      <div class="card blue-grey lighten-5">
        <div class="card-content">
          <span class="card-title">{{ event.name }}</span>
        </div>
      </div>
    </a>
  </div>
</template>

<script>

import axios from 'axios';

export default {
  data: function(){
    return {
      events: [],
    }
  },
  mounted: function(){
    this.fetchEvents();
  },
  methods: {
    fetchEvents: function(){
      axios.get('/api/events').then((response) => {
        for(var i = 0; i < response.data.events.length; i++){
          this.events.push(response.data.events[i]);
        }
      }, (error) => {
        console.log(error);
      });
    },
  }
}

</script>