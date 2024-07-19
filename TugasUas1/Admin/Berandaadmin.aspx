<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Berandaadmin.aspx.vb" Inherits="TugasUas1.Berandaadmin" %>

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
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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

        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/foto.jpg" alt="" style="width: 50px; height: 50px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Imelia</h6>
                        <span>Admin</span>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->

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
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <h6 class="mb-0">Grafik Penjualan Bunga</h6>
                    <canvas id="grafikCanvas" width="400" height="200"></canvas>
                </div>
            </div>
            <!-- Grafik End -->
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script type="text/javascript">
                var ctx = document.getElementById('grafikCanvas').getContext('2d');
                var chart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: [],
                        datasets: [{
                            label: 'Grafik',
                            data: [],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

    <% 
                Dim dt As System.Data.DataTable = ViewState("GrafikData")
                For Each row As System.Data.DataRow In dt.Rows
    %>
                chart.data.labels.push("<%= row("nama_grafik") %>");
                chart.data.datasets[0].data.push(<%= row("angka_grafik") %>);
    <%
                Next
    %>
                chart.update();
            </script>
            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Daftar Nama Bunga</h6>
                        <a href="">Show All</a>
                    </div>
                    <!-- Tombol Tambah -->
                    <div class="mb-3 d-flex justify-content-start">
                        <a href="TambahBunga.aspx" class="btn btn-primary">Tambah</a>
                    </div>
                    <div class="table-responsive">
                        <form runat="server">
                            <asp:GridView ID="GridView" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="idbunga">
                                <Columns>
                                    <asp:BoundField DataField="idbunga" HeaderText="No" ReadOnly="True" />
                                    <asp:BoundField DataField="nama" HeaderText="Nama Bunga" />
                                    <asp:BoundField DataField="idjenis" HeaderText="ID Jenis" />
                                    <asp:BoundField DataField="stok" HeaderText="Stok" />
                                    <asp:BoundField DataField="harga" HeaderText="Harga" />
                                    <asp:TemplateField HeaderText="Foto">
                                        <ItemTemplate>
                                            <asp:Image ID="imgFoto" runat="server" ImageUrl='<%# "data:image/jpeg;base64," & Convert.ToBase64String(Eval("foto")) %>' Width="100" Height="100" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Aksi">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btnEdit" runat="server" NavigateUrl='<%# "EditBunga.aspx?id=" & Eval("idbunga") %>' CssClass="btn btn-warning btn-sm">Edit</asp:HyperLink>
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("idbunga") %>' Text="Hapus" CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Apakah Anda yakin ingin menghapus item ini?');"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->
        </div>
        <!-- Content End -->

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
