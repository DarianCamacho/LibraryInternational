<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="Library.Views.Tienda" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Tienda</title>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Libreria Internacional</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="Inicio.aspx">Home
            <span class="visually-hidden">(current)</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <form id="form1" runat="server">
        <div class="container mt-3">
            <div class="row">
                <!-- Utilizar un Repeater para generar múltiples Cards -->
                <asp:Repeater ID="repBook" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <img src="<%#Eval("Foto") %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Titulo") %></h5>
                                    <p class="card-text"><%# Eval("Autor") %></p>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                    <p class="card-text"><%# Eval("ISBN") %></p>
                                    <p class="card-date"><small class="text-muted"><%# Eval("Fecha") %></small></p>
                                    <a href="Tienda.aspx?Id=<%# Eval("Id") %>" class="btn btn-primary btn-block">Comprar por $<%#Eval("Precio") %></a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <%--BOOK--%>

                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-header">
                            ¡Compra este libro!
                        </div>
                        <div class="card-body">
                            <p class="card-text">El costo se vera reflejado en el precio total</p>
                        </div>
                        <div class="row align-items-center">
                            <div class="col-6">
                                Cantidad:
                            </div>
                            <div class="col-6">
                                <select class="form-control" name="cantidad" aria-label="Default select example">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <%--BOOK--%>

                <%--Details--%>

                <div class="card m-2" style="width: 30rem">
                    <div class="card-header">
                        Details
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="cantidad" class="form-label mt-4">Cantidad</label>
                                </div>
                                <div class="col-6">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">
                                            <label id="lblCantidad" runat="server"></label>
                                        </span>
                                        <span class="input-group-text">x $<label id="lblPrecio" runat="server"></label></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="cantidad" class="form-label mt-4">Cost</label>
                                </div>
                                <div class="col-6">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">$</span>
                                        <span class="input-group-text">
                                            <label id="lblCost" runat="server"></label>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="checkin" class="form-label mt-4">Total</label>
                                </div>
                                <div class="col-6">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">$</span>
                                        <span class="input-group-text">
                                            <label id="lblTotal" runat="server"></label>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button id="btnSave" class="btn btn-primary" runat="server" onserverclick="btnSave_ServerClick">Save</button>
                    </div>
                </div>
            </div>
        </div>

      <%--Details--%>

    </form>

</body>
</html>
