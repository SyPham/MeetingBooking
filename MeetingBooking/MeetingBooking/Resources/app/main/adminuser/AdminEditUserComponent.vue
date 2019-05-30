<template>
  <div id="edit-user" class="modal fade bd-example-modal-lg" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header title-booking">
          <span class="modal-title">
            <i class="fa fa-book"></i>
            Edit User&nbsp;{{fullName}}
          </span>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Họ tên:
            </label>
            <div class="col-md-6 col-sm-6 col-md-6 col-sm-6 col-9">
              <input type="text" class="form-control" placeholder="Họ tên" v-model="fullName">
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Email:
            </label>
            <div class="col-md-6 col-sm-6 col-md-6 col-sm-6 col-9">
              <input type="text" class="form-control" placeholder="Email" v-model="email">
            </div>
          </div>

          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Điện thoại:
            </label>
            <div class="col-md-6 col-sm-6 col-md-6 col-sm-6 col-9">
              <input type="text" class="form-control" placeholder="Số điện thoại" v-model="mobi">
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Khoa:
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <select class="custom-select" v-model="facultyID">
                <option v-for="item in listFaculty" :value="item.FacultyID">{{item.FacultyName}}</option>
              </select>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Hình đại diện:
            </label>
            <div class="col-md-6 col-sm-6 col-9 avatar-room">
              <img class="img-fluid img-circle" :src="avatar" />
              <input type="file" @change="onFileChanged" class="btn btn-sm btn-outline-warning">
            </div>
          </div>

          <div class="form-group row" v-if="checkAcount">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Phân quyền:
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" v-model="roles" value="true">
                <label class="form-check-label" for="radio_ready">Full Controll</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" v-model="roles" value="false">
                <label class="form-check-label" for="radio_busy">User Booking</label>
              </div>
            </div>
          </div>

          <div class="form-group row" v-if="isVisible">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Trạng thái:
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" v-model="visible" value="true">
                <label class="form-check-label" for="radio_ready">Hiện</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" v-model="visible" value="false">
                <label class="form-check-label" for="radio_busy">Tạm ẩn</label>
              </div>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Ghi chú (Nếu có):
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="input-group">
                <input class="form-control" id="note" />
              </div>
              <small class="form-text text-danger">Ghi chú thêm gì đó nếu bạn cần.</small>
            </div>
          </div>

          <div class="text-center">
            <input type="submit" value="Lưu lại" @click="UpdateUserDetail($event)" class="btn btn-success mr-2">
            <input type="reset" value="Làm lại" class="btn btn-warning">
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
  import EventBus from "../EventBus";
  import axios from "axios";
  export default {
    components: {

    },
    data() {
      return {
        avatar: "/Content/Images/nopic.png",
        facultyID: 0,
        listFaculty: {},
        fullName: "",
        userID: "",
        mobi: "",
        email: "",
        visible: true,
        roles: false,
        file: null,
        createBy: "",
        isVisible: true,
       user: null,
        checkAcount: false,
      }
    },
    methods: {
      //On change Func
      onChangeFaculty(e) {
        this.facultyName = e.target.value;
      },

      onFileChange(e) {
        var files = e.target.files || e.dataTransfer.files;
        if (!files.length)
          return;
        this.createImage(files[0]);
      },

      onFileChanged(event) {
        let seft = this;
        seft.file = event.target.files[0];
        let formData = new FormData();
        formData.append("file", seft.file);

        axios.post("/Room/Uploadmage", formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
          .then(res => {
            seft.avatar = res.data;
          })
          .catch(error => {
            AlertDanger("Upload avatar thất bại, vui lòng chọn file ảnh và thử lại!");
            return;
          });
      },

      UpdateUserDetail() {
        let seft = this;
        if (seft.fullName == "") {
          AlertWarning("Vui lòng nhập người dùng!");
          return;
        }
        if (seft.facultyID == 0) {
          AlertWarning("Vui chọn khoa!");
          return;
        }
        let data = {
          userID: seft.userID, fullName: seft.fullName, facultyID: seft.facultyID, mobi: seft.mobi,
          email: seft.email, visible: seft.visible, roles: seft.roles, password: seft.password, avatar: seft.avatar, createBy: seft.createBy
        }
        axios.post("/User/UpdateUserDetail", data).then(res => {
          if (res.data.status == 1) {
            AlertSuccess("Dữ liệu đã được cập nhật thành công!");
            $("#edit-user").modal("hide");
             seft.user = res.data;
            seft.$cookies.set('user', res.data);
            EventBus.$emit("BindUserHome", true);
            return;
          }
          else {
            AlertDanger("Rất tiếc, dữ liệu chưa được cập nhật, vui lòng kiểm tra và thử lại!");
            return;
          }
        })
          .catch(error => {
            AlertDanger("Lỗi hệ thống, vui lòng thử lại sau!");
            return;
          });
      },

    },
    mounted() {

    },

    created() {
      let seft = this;
      if (seft.$cookies.get('user').Roles) {
        seft.checkAcount = true;
      }
      EventBus.$on("EditUser", item => {
        if (item.UserID == seft.$cookies.get('user').UserID) {
          seft.isVisible = false;
        }
        seft.user      = item;
        seft.userID    = item.UserID;
        seft.fullName  = item.FullName;
        seft.facultyID = item.FacultyID;
        seft.avatar    = item.Avatar;
        seft.mobi      = item.Mobi;
        seft.email     = item.Email;
        seft.roles     = item.Roles;
        seft.createBy  = seft.$cookies.get('user').FullName;
        $("#edit-user").modal("show");
      });
      axios.post("/Faculty/GetAllFaculty").then(res => {
        seft.listFaculty = res.data;
      });
    }
  }
</script>
