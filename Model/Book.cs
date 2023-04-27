using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Library.Model
{
    public class Book
    {
        public int Id { get; set; }
        public int BuyId { get; set; }
        public long ISBN { get; set; }
        public string Foto { get; set; }
        public string Titulo { get; set; }
        public string Autor { get; set; }
        public string Fecha { get; set; }
        public decimal Precio { get; set; }
        public string Descripcion { get; set;}
    }
}