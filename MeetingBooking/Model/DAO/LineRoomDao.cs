using Model.EF;
using Model.ViewModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class LineRoomDao
    {
        DBContext db = null;

        public LineRoomDao()
        {
            db = new DBContext();
        }

        public object GetLineRoomByRoomID(int roomID)
        {
            var data = db.LineRooms.Where(x => x.RoomID == roomID).Select(x => new
            {
                id = x.LineRoomID,
                title = x.LineRoomName,
                start = x.TimeStart,
                end = x.TimeEnd
            }).ToList();

            List<FullCalendarModel> dataFullCalendar = new List<FullCalendarModel>();
            foreach (var item in data)
            {
                FullCalendarModel lineRoomModel = new FullCalendarModel
                {
                    id = item.id,
                    title = item.title,
                    start = item.start.Value.ToString("yyyy-MM-dd HH:mm"),
                    end = item.end.Value.ToString("yyyy-MM-dd HH:mm")
                };
                dataFullCalendar.Add(lineRoomModel);

            }
            return dataFullCalendar;
        }

        public object GetDetailLineRoomByID(int lineRoomID)
        {
            var data = db.LineRooms.Select(x => new LineRoomDetailModel
            {
                LineRoomID      = x.LineRoomID,
                LineRoomName    = x.LineRoomName,
                Content         = x.Content,
                CreateBy        = x.CreateBy,
                Description     = x.Description,
                NumberPerson    = x.NumberPerson,
                TimeStart       = x.TimeStart,
                TimeEnd         = x.TimeEnd,
                Seat            = db.Rooms.FirstOrDefault(z => z.RoomID == x.RoomID).Seat,
                Avatar          = db.Rooms.FirstOrDefault(z => z.RoomID == x.RoomID).Avatar,
                FullName        = db.Users.FirstOrDefault(z => z.UserID == x.CreateBy).FullName
            }).FirstOrDefault(x => x.LineRoomID == lineRoomID);

            return data;
        }

        public object DeleteLineRoomByID(int lineRoomID,int roomID)
        {
            var itemLineRoom = db.LineRooms.Find(lineRoomID);
            var timeEnd      = db.LineRooms.Find(lineRoomID).TimeEnd;

            DateTime end = Convert.ToDateTime(timeEnd);

            if (itemLineRoom != null)
            {
                if (end < DateTime.Now)
                {
                    return new
                    {
                        isDelete = false,
                        message = "Dữ liệu cuộc họp đã kết thúc bạn không được xóa dữ liệu này! Vui lòng kiểm tra lại!"
                    };
                }
                else
                {
                    db.LineRooms.Remove(itemLineRoom);
                    try
                    {
                        db.SaveChanges();
                        return new
                        {
                            isDelete = true,
                            message = "Bạn đã đặt xóa phòng họp thành công",
                            result = new LineRoomDao().GetLineRoomByRoomID(roomID)
                        };
                    }
                    catch
                    {
                        return new
                        {
                            isDelete = false,
                            message = "Lỗi hệ thống! Vui lòng thử lại"
                        };
                    }
                }
            }
            return new
            {
                isDelete = false,
                message = "Không tìm thấy dữ liệu phòng"
            };
        }
    }
}
