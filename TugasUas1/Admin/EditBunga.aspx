﻿<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="EditBunga.aspx.vb" Inherits="TugasUas1.EditBunga" %>

<%@ Register TagPrefix="uc" TagName="Sidebar" Src="~/Admin/Sidebar.ascx" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Halaman Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <uc:Sidebar runat="server" />
        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control bg-dark border-0" type="search" placeholder="Search">
                </form>
            </nav>
            <!-- Navbar End -->

            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Edit Bunga</h6>
                        <a href="Berandaadmin.aspx">Kembali</a>
                    </div>
                    <form runat="server">
                        <asp:HiddenField ID="hfIdBunga" runat="server" />

                        <div class="mb-0 d-flex justify-content-start">
                            <asp:Label ID="Label1" runat="server" Text="Nama Bunga"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtNama" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />

                        <div class="mb-0 d-flex justify-content-start">
                            <asp:Label ID="Label2" runat="server" Text="Idjenis"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtIdjenis" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />

                        <div class="mb-0 d-flex justify-content-start">
                            <asp:Label ID="Label3" runat="server" Text="Stok"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtStok" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                        <div class="mb-0 d-flex justify-content-start">
                            <asp:Label ID="Label4" runat="server" Text="Harga"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtHarga" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                        <br />

                        <div class="mb-0 d-flex justify-content-start">
                            <asp:Label ID="Label5" runat="server" Text="Foto"></asp:Label>
                        </div>
                        <asp:FileUpload ID="fuFoto" runat="server" CssClass="form-control" />
                        <br />
                        <br />

                        <div class="mb-0 d-flex justify-content-start">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                            &nbsp;
        <asp:Button ID="btnKembali" runat="server" Text="Kembali" CssClass="btn btn-secondary" PostBackUrl="~/Berandaadmin.aspx" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>