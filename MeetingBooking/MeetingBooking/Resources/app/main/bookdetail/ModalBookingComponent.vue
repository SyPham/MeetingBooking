<template>
  <div id="meeting-booking" class="modal fade bd-example-modal-lg" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header title-booking">
          <span class="modal-title">
            <i class="fa fa-book"></i>
            Đặt phòng
          </span>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Nhân viên
            </label>
            <div class="col-md-6 col-sm-6 col-md-6 col-sm-6 col-9">
              <input type="text" class="form-control" placeholder="UserName" disabled v-model="fullName">
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Bộ phận
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <input type="text" class="form-control" placeholder="Bộ phận" disabled v-model="facutlyName">
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Chọn phòng
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <select class="custom-select" v-model="roomID">
                <option value="0">Chọn phòng...</option>
                <option v-for="item in listRooms" :value="item.RoomID">{{item.RoomName}}</option>
              </select>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Bắt đầu dự kiến
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="input-group date" id="txtBeignMeeting" data-target-input="nearest">
                <date-picker v-model="timeStart" :config="options"></date-picker>
                <div class="input-group-append" data-target="#txtBeignMeeting" data-toggle="datetimepicker">
                  <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Kết thúc dự kiến
            </label>
            <div class="col-md-6 col-sm-6 col-9">

              <div class="input-group date" id="txtEndMeeting" data-target-input="nearest">
                <date-picker v-model="timeEnd" :config="options"></date-picker>
                <div class="input-group-append" data-target="#txtEndMeeting" data-toggle="datetimepicker">
                  <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
              </div>

            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Số người tham gia
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="input-group">
                <input type="number" class="form-control" placeholder="Số người tham gia" v-model="numberPerson" />
              </div>
              <small class="form-text text-danger">Sức chứa của phòng: {{seat}} chỗ ngồi</small>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Tiêu đề cuộc họp
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="input-group">
                <input id="txtTitleMeeting" type="text" class="form-control" placeholder="Tiêu đề cuộc họp" v-model="titleMeeting" />
              </div>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Nội dung cuộc họp
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="input-group">
                <textarea class="form-control" id="content-meeting" v-model="contentMeeting"></textarea>
              </div>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Ghi chú(Nếu có)
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="input-group">
                <input class="form-control" id="note" v-model="noteMeeting" />
              </div>
              <small class="form-text text-danger">Ghi chú nếu bạn cần chuẩn bị thêm gì đó cho cuộc họp.</small>

            </div>
          </div>

          <div class="text-center">
            <button class="btn btn-success mr-2" @click="Book()">Booking</button>
            <input type="reset" value="Reset" class="btn btn-warning" @click="ClearForm()">
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
  // Import this component
  import datePicker from 'vue-bootstrap-datetimepicker';
  // Import date picker css
  import 'pc-bootstrap4-datetimepicker/build/css/bootstrap-datetimepicker.css';
  import EventBus from "../EventBus";

  import axios from "axios";
  export default {
    components: {
      datePicker
    },
    data() {
      return {
        options: {
          format: 'YYYY/MM/DD HH:mm',
          useCurrent: false,
        },
        user: {},
        fullName: "",
        roomID: 0,
        timeStart: "",
        timeEnd: "",
        titleMeeting: "",
        contentMeeting: "",
        noteMeeting: "",
        facutlyName: "",
        numberPerson: 0,
        listRooms: [],
        seat: 0
      }
    },
    methods: {
      convertDate(date) {
        var nowDate = new Date(parseInt(date.substr(6)));
        return nowDate.format("dd/mm/yyyy");
      },
      convertTime(date) {
        var nowDate = new Date(parseInt(date.substr(6)));
        return nowDate.format("HH:MM");
      },
      LoadAllRoom: function () {
        axios.get("/Room/GetAllRoom").then(res => {
          this.listRooms = res.data;
        });
      },
      Book: function () {
        let seft = this;
        if (seft.CheckForm()) {
          let data = { userID: seft.user.UserID, facutlyID: seft.user.FacutlyID, roomID: seft.roomID, timeStart: seft.timeStart, timeEnd: seft.timeEnd, title: seft.titleMeeting, content: seft.contentMeeting, note: seft.noteMeeting, numberPerson: seft.numberPerson };
          axios.post("/BookingRoom/Book", data).then(res => {
            if (res.data.isBooking == true) {
              seft.ClearForm();
              AlertSuccess(res.data.message);
              $("#meeting-booking").modal('hide');
              //$emit Nói 1 cái gì đó để chỗ khác lắng nghe
              EventBus.$emit("loadLineRoom", res.data.result);
              EventBus.$emit("loadLineRoomHome", true);
              return;
            }
            else {
              AlertDanger(res.data.message);
              return;
            }
          });
        }
      },
      CheckForm: function () {
        if (this.fullName == "") {
          AlertWarning("Vui lòng nhập họ và tên");
          return false;
        }
        if (this.facutlyName == "") {
          AlertWarning("Vui lòng nhập bộ phận");
          return false;
        }

        if (this.roomID == "") {
          AlertWarning("Vui lòng chọn phòng");
          return false;
        }

        if (this.timeStart == "") {
          AlertDanger("Vui lòng chọn thời gian bắt đầu");
          return false;
        }

        if (this.timeEnd == "") {
          AlertWarning("Vui lòng chọn thời gian kết thúc");
          return false;
        }

        if (this.timeStart >= this.timeEnd) {
          AlertWarning("Vui lòng chọn thời gian kết thúc lớn hơn thời gian bắt đầu!");
          return false;
        }

        if (this.numberPerson <= 0) {
          AlertWarning("Vui lòng chọn số lượng người tham dự lớn hơn 0");
          return false;
        }

        if (this.seat < this.numberPerson) {
          AlertWarning("Số lượng người quá sức chứa của phòng, vui lòng chọn phòng khác phù hợp!");
          return false;
        }

        //let timeStartCompare = new Date(this.timeStart);
        //let timeEndCompare = new Date(this.timeEnd);
        //if (timeStartCompare >= timeEndCompare) {
        //  AlertDanger("Thời gian bạn chọn không phù hợp! Vui lòng thử lại");
        //  return false;
        //}


        if (this.titleMeeting == "") {
          AlertWarning("Vui lòng nhập nội dung cuộc họp");
          return false;
        }

        return true;
      },
      ClearForm: function () {
        let seft = this;
        if (seft.$cookies.isKey("user")) {

          seft.user        = seft.$cookies.get('user');
          seft.fullName    = seft.user.FullName;
          seft.facutlyName = seft.user.FacutlyName;
        }
        else {
          seft.fullName    = "";
          seft.facutlyName = "";
        }
        seft.titleMeeting   = "";
        seft.contentMeeting = "";
        seft.noteMeeting    = "";
        seft.numberPerson   = 0;

      }
    },
    mounted() {
      let seft = this;
      $("#meeting-booking").on('shown.bs.modal', function (e) {
        axios.post("/Room/GetDetailRoom", { roomID: seft.roomID }).then(res => {
          seft.seat = res.data.Seat;
        })
        if (seft.$cookies.isKey("user")) {

          seft.user = seft.$cookies.get('user');
          seft.fullName = seft.user.FullName;
          seft.facutlyName = seft.user.FacutlyName;
        }
        else {
          seft.fullName = "";
        }

        let roomRouterID = seft.$route.params.id;
        if (roomRouterID != null) {
          seft.roomID = roomRouterID;
        }
      })
    },
    created() {
      let seft = this;
      let currentDate = new Date();
      seft.timeStart = currentDate.format("yyyy/mm/dd HH:MM");
      seft.timeEnd = currentDate.format("yyyy/mm/dd HH:MM");
      seft.LoadAllRoom();
      EventBus.$on("showModalBooking", item => {
        let currentDate = new Date();
        seft.seat = item.Seat;
        seft.timeStart = currentDate.format("yyyy/mm/dd HH:MM");
        seft.timeEnd = currentDate.format("yyyy/mm/dd HH:MM");
        $("#meeting-booking").modal("show");
      });
      //Lắng nghe sự kiện khi show modal booking home
      EventBus.$on("showModalHome", roomID => {
        seft.roomID = roomID;
        $("#meeting-booking").modal("show");
      });
    }
  }
</script>
