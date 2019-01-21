<template>

  <div>
    <h3>{{ event.name }}</h3>
    <div style='border: 4px solid grey; width: 100%; height: 240px; overflow: scroll; '>
      <div v-for='row in csv' v-bind:key='row.id' v-bind:style="size">
        <div v-for='col in row' v-bind:key='col.id'>
          <div v-if='col == 0' style='width: 24px; height: 24px; float: left'>
          </div>
          <div v-else v-on:click="checkContents( col )" style='border:1px black solid; width: 24px; height: 24px; float: left'>
            {{ col }}
          </div>
        </div>
      </div>
    </div>
  </div>

</template>

<script>

import axios from 'axios';

export default {
  data: function(){
    return {
      event: [],
      rnum: 0,
      cnum: 0,
      size: {
        width: '',
      },
      height: 0,
      csv: []
    }
  },
  mounted: function(){
    this.fetchEvent();
  },
  methods: {
    fetchEvent: function(){
      axios.get('/api/event/' + this.$route.params.id).then((response) => {
        this.event = response.data;
        let csv = this.event.map;
        var h = "";
        if(csv == null || csv == "") {
          h = "map情報がありません。";
        }else {
          csv = csv.split('\n');
          this.cnum = parseInt(csv[0].split(',')[0]);
          this.rnum = parseInt(csv[0].split(',')[1]);
          this.size.width = this.cnum * 24 + "px";
          this.height = this.rnum * 24;
          for(var i = 0; i < this.rnum; i++){
            let line = csv[i + 1].split(',');
            this.csv.push([]);
            for(var j = 0; j < this.cnum; j++){
              this.csv[i].push(line[j]);
            }

          }
        }
      }, (error) => {
        console.log(error);
      });
    },
    checkContents: function(id){
      alert(id);
    }
  }
}

</script>