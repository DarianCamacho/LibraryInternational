using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using m = Library.Model;

namespace Library.DatabaseHelper
{
    public class Database
    {
        const string database = "LibreriaInternacional";
        const string server = "localhost";
        SqlConnection connection = new SqlConnection($"Data Source={server};Initial Catalog={database};Integrated Security=True");

        public DataTable GetBooks()
        {
            return this.Fill("[dbo].[spGetBooks]", null);
        }

        public DataTable GetBook(int Id)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Id", Id),
            };

            return this.Fill("[dbo].[spGetBook]", param);
        }

        public void SaveBook(m.Book book)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Id", book.Id),
                new SqlParameter("@BuyId", book.BuyId),
                new SqlParameter("@ISBN", book.ISBN),
                new SqlParameter("@Foto", book.Foto),
                new SqlParameter("@Titulo", book.Titulo),
                new SqlParameter("@Autor", book.Autor),
                new SqlParameter("@Fecha", book.Fecha),
                new SqlParameter("@Precio", book.Precio),
            };

            this.ExecuteQuery("[dbo].[spSaveBook]", param);
        }

        public DataTable GetMyBooks(string Email)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Email", Email),
            };

            return this.Fill("[dbo].[spGetMyBooks]", param);
        }

        public DataTable GetBookBuyId(int BuyId)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Buyid", BuyId),
            };

            return this.Fill("[dbo].[spGetBookBuyId]", param);
        }

        public void DeleteBook(string Email, int BuyId)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Email", Email),
                new SqlParameter("@BuyId", BuyId),
            };

            this.ExecuteQuery("[dbo].[spDeleteBook]", param);
        }

        public DataTable Fill(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    DataTable ds = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ExecuteQuery(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}