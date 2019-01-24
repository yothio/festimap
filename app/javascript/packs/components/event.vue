<template>

  <div>
    <h3>{{ event.name }}</h3>
    <div>
      <div v-for='row in csv' v-bind:key='row.id'>
        <div class="row" style="margin: 0;">
        <div v-for='col in row' v-bind:key='col.id' >
          <div v-if='col == 0' class='col s1' style="margin:1px ">
          </div>
          <div v-else v-on:click="checkContents( col )" style='background-color: grey; margin:1px; height: 48px;' class='col s1 ' >
            {{ col }}
          </div>
         </div>
       </div> 
      </div>
    </div>
    <div v-if="showContentDetail">
      <h4>{{ content.name }}</h4>
      <hr>
      <p>{{ content.body }}</p>
    </div>
  </div>
  
</template>

<script>

import axios from 'axios';

export default {
  data: function(){
    return {
      showContentDetail: false,
      event: [],
      contents: [],
      content: [],
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
      axios.get('/api/events/' + this.$route.params.id).then((response) => {
        this.event = response.data.events;
        this.contents = this.event.contents;
        console.log(this.contents);
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
      this.content = [];
      this.contents.forEach(v => {
        if(v.id == id){
          this.content = v;
        }
      });
      this.showContentDetail = true;
    }
  }
}

</script>