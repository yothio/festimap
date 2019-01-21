<template>
  <div>
    <div class="card blue-grey lighten-5 col s12 m6" v-for="event in events">
      <a v-bind:href="'/event/' + event.id">
        <div class="card-content">
          <span class="card-title">{{ event.name }}</span>
          <p>{{ event.date }}</p>
          <p>{{ event.begin_time }} ~ {{ event.end_time }}</p>
          <p>{{ event.description }}</p>
        </div>
      </a>
    </div>
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