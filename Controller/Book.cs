
using Library.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;
using m = Library.Model;

namespace Library.Controller.DatabaseHelper
{
    public class Book
    {
        public List<m.Book> GetBooks()
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();



            DataTable ds = db.GetBooks();



            return ConvertDSToList(ds);
        }



        public List<m.Book> GetBook(int Id)
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();



            DataTable ds = db.GetBook(Id);



            return ConvertDSToList(ds);
        }



        public List<m.Book> SearchBook(string searchValue)
        {
            DatabaseHelper.Database db = new DatabaseHelper.Database();



            DataTable ds = db.SearchBook(searchValue);



            return ConvertDSToList(ds);
        }



        public List<m.Book> ConvertDSToList(DataTable ds)
        {
            List<m.Book> booksList = new List<m.Book>();



            foreach (DataRow row in ds.Rows)
            {
                booksList.Add(new m.Book
                {
                    Id = Convert.ToInt16(row["Id"]),
                    ISBN = Convert.ToInt16(row["ISBN"]),
                    Titulo = row["Titulo"].ToString(),
                    Autor = row["Autor"].ToString(),
                    Fecha = row["Fecha"].ToString(),
                    Foto = row["Foto"].ToString(),
                    Precio = Convert.ToDecimal(row["Precio"])
                });
            }



            return booksList;
        }
    }
}