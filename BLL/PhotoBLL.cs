using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
using DAL;
namespace BLL
{
    public class PhotoBLL
    {
        public  bool PhotoAdd(Photo photo)
        {
            if (PhotoDAL.GetAllPhotoNum() >= 3)
            {
                return false;
            }
            else
            {
               
                return PhotoDAL.PhotoAdd(photo);
            }

        }
        public bool PhotoUpdate(Photo photo)
        {
            return PhotoDAL.PhotoUpdate(photo);     
        }
        public  bool PhotoDelete(string  Id)
        {
            return PhotoDAL.PhotoDelete(Id);
        }
        public DataSet GetAllPhotoByDs()
        {
            return PhotoDAL.GetAllPhotoByDs();
        }
        public  Photo GetPhotoById(string Id)
        {
            return PhotoDAL.GetPhotoById(Id);
        }
    }
}
