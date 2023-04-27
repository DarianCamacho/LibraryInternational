<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Library.Views.ShoppingCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.2/lux/bootstrap.min.css" />
    <link href="../css/resorts.css" rel="stylesheet" />
    <script src="../js/site.js"></script>
    <title>My Cart</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Library.com</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="Inicio.aspx">Libros</a>
                            </li>
                            <li id="tabBookings" runat="server" class="nav-item">
                                <a class="nav-link" href="ShoppingCart.aspx">My Cart</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <asp:Repeater ID="repShoppingCart" runat="server">
                <HeaderTemplate>
                    <div class="container">
                        <div class="row">
                </HeaderTemplate>
                <ItemTemplate>
                    <div id="elementCard" class="card">
                        <h5 id="" class="card-title"><%# Eval("Titulo")%></h5>
                        <img src="<%# Eval("Foto")%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col">
                                    <section class="card-text">Fecha: <%# Eval("Fecha")%></section>
                                </div>
                                <div class="col">
                                    <section class="card-text">ISBN: <%# Eval("ISBN")%></section>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <section class="card-text">Precio$: <%# Eval("Precio")%></section>
                                </div>
                                <div class="col">
                                    <section class="card-text">Kids: <%# Eval("Kids")%></section>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <h4 class="card-text">Cost: $<%# Eval("Cost")%></h4>
                                </div>
                                <div class="col">
                                    <h4 class="card-text">Total: $<%# Eval("Total")%></h4>
                                </div>
                            </div>
                            <hr />
                            <div class="row mb-3">
                                <div class="col">
                                    <button runat="server" type="button" dataid='<%# Eval("bookId")%>' onserverclick="btnDelete_ServerClick" class="btn btn-danger">Delete</button>
                                </div>
                                <div class="col">
                                    <a href="Book.aspx?id=<%# Eval("Id")%>&bookId=<%# Eval("bookId")%>" class="btn btn-success">Edit</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                    </div>                   
                </FooterTemplate>
            </asp:Repeater>

            <div id="divNoBooks" runat="server" hidden="hidden">
                <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header">
                        <h4 class="me-auto">:(</h4>
                        <button type="button" class="btn-close ms-2 mb-1" data-bs-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true"></span>
                        </button>
                    </div>
                    <div class="toast-body">
                        You don't have any booking yet! 
                        <br />
                        <br />
                        Please go <a href="Booking.aspx">here</a> to book.
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">
                            <label id="lblModalTitle"></label>
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <label id="lblModalMessage"></label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancel</button>
                        <button id="btnDeleteBooking" runat="server" onserverclick="btnConfirmDelete_ServerClick" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>