<template>
  <div class="row mt-2">
    <div class="col-md-3 col-12 mt-2">
      <label class="badge badge-success"><strong class="cs-badge">Choose Month</strong></label>
      <Select2 v-model="month" :options="listMonth" @change="selectMonth($event)" />
      <hr />
      <label class="badge badge-success"><strong class="cs-badge">Choose Room</strong></label>
      <Select2 v-model="roomID" :options="listRoom" @change="selectRoom($event)" />
    </div>
    <div class="col-md-9 col-12">
      <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    </div>

  </div>
</template>

<script>
  import axios from "axios"
  import EventBus from "./EventBus"
  import Datepicker from 'vuejs-datepicker'
  import Select2 from 'v-select2-component';

  export default {
    components: {
      Datepicker,
      Select2
    },
    data() {
      return {
        listMonth: [
          { id: 0, text: 'Choose Month' },
          { id: 1, text: 'January' },
          { id: 2, text: 'February' },
          { id: 3, text: 'March' },
          { id: 4, text: 'April' },
          { id: 5, text: 'May' },
          { id: 6, text: 'June' },
          { id: 7, text: 'July' },
          { id: 8, text: 'August' },
          { id: 9, text: 'September' },
          { id: 10, text: 'October' },
          { id: 11, text: 'November' },
          { id: 12, text: 'December' },
        ],
        listRoom: [],
        month: 0,
        roomID: 0,
        year:0
      }
    },
    methods: {
      getDataChart(month, year, roomID) {
        let seft = this;
        ShowLoading();
        axios.post('/Chart/GetDataChart', { Month: month, Year: year, roomID: roomID })
          .then(res => {
            let data = res.data;
            Chart.Init(data);
            HideLoading();
            //console.log("Week in month", data);
          })
      },

      getListRoom() {
         this.listRoom = [{ id: 0, text: "Tất cả phòng" }];
        axios.get('/Room/GetListRoom')
          .then(res => {
            let data = res.data;
            console.log(data);
            for (let i = 0; i < data.length; i++) {
              let model = [];
              model['id'] = data[i].RoomID;
              model['text'] = data[i].RoomName;
              this.listRoom.push(model);
            }
          })
      },

      selectMonth(month) {
        let seft = this;
        seft.month = month;
        ShowLoading();
        seft.getDataChart(month, seft.year, seft.roomID);
      },

      selectRoom(roomID) {
         let seft = this;
       this.roomID = roomID;
        ShowLoading()
        seft.getDataChart(seft.month, seft.year, seft.roomID);
      }
    },

    mounted() {

    },

    watch: {

    },
    created() {
      let seft = this;
      var date = new Date();
      var month = date.getMonth() + 1;
      this.year = date.getFullYear();
      seft.month = month;
      seft.getDataChart(month, this.year, seft.roomID)
      seft.getListRoom();
      ShowLoading();
    },
  }
</script>



