<template>
  <div id="add-faculty" class="modal fade bd-example-modal-lg" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header title-booking">
          <span class="modal-title">
            <i class="fa fa-book"></i>
            Thêm khoa
          </span>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Tên khoa
            </label>
            <div class="col-md-6 col-sm-6 col-md-6 col-sm-6 col-9">
              <input type="text" class="form-control" placeholder="Tên khoa" v-model="facultyName">
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

          <div class="form-group row">
            <label class="col-md-3 col-sm-3 col-3 col-form-label col-form-label-sm text-right">
              Mô tả (Nếu có):
            </label>
            <div class="col-md-6 col-sm-6 col-9">
              <div class="input-group">
                <textarea class="form-control" id="desc" v-model="desc" />
              </div>
              <small class="form-text text-danger">Mô tả thêm thông tin cho khu vực.</small>
            </div>
          </div>

          <div class="form-group row">
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

          <div class="text-center">
            <button class="btn btn-success mr-2" @click="AddFaculty($event)">
              <i class="fa fa-save"></i>&nbsp;Thêm khoa
            </button>
            <button class="btn btn-warning mr-2" @click="ClearForm()">
              <i class="fa fa-remove"></i>&nbsp;Làm lại
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import EventBus from "../EventBus";
  import axios from "axios";
  import { create } from "domain";
  export default {
    components: {

    },
    data() {
      return {
        avatar: "/Content/Images/nopic.png",
        desc: "",
        facultyName: "",
        visible: true,
        file: null,
        createBy: "",
      }
    },
    methods: {
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

      AddFaculty() {
        let seft = this;
        if (seft.facultyName == "") {
          AlertWarning("Vui lòng nhập tên khoa!");
          return;
        }
        if (!seft.$cookies.isKey("user")) {
          AlertWarning("Vui lòng đăng nhập để thực hiện chức năng này!");
          return;
        }
        else {
          seft.create = seft.$cookies.get('user').FullName;
        }
        let data = { facultyName: seft.facultyName, avatar: seft.avatar, desc: seft.desc, visible: seft.visible, createBy: seft.createBy }
        axios.post("/Faculty/AddFaculty", data)
          .then(res => {
            if (res.data.status == 1) {
              AlertSuccess("Xin chúc mừng dữ liệu đã được cập nhật thành công!");
              seft.ClearForm();
              $("#add-area").modal("hide");
              EventBus.$emit("BinFaculty", true);
              return;

            }
            if (res.data.status == 2) {
              AlertWarning("Tên khoa này đã tồn tại vui lòng chọn tên khác!");
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

      ClearForm() {
        let seft         = this;
        seft.facultyName = "";
        seft.desc        = "";
        seft.avatar      = "/Content/Images/nopic.png";
      },
    },
    mounted() {

    },

    created() {
      let seft = this;
      seft.createBy = seft.$cookies.get('user').FullName;
    }
  }
</script>
