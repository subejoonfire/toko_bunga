<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Berandapub.aspx.vb" Inherits="TugasUas1.Berandapub" %>

<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Toko Bunga Imelia</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="assets/js/config.js"></script>

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="stylesheet" href="vendors/swiper/swiper-bundle.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link href="assets/css/theme.css" rel="stylesheet" id="style-default">
    <link href="assets/css/user-rtl.css" rel="stylesheet" id="user-style-rtl">
    <link href="assets/css/user.css" rel="stylesheet" id="user-style-default">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>

<body>
    <form id="form1" runat="server">
        <!-- ===============================================-->
        <!--    Main Content-->
        <!-- ===============================================-->
        <main class="main" id="top">
            <div class="bg-white">
                <div class="content">
                    <div class="bg-white p-1 p-lg-2"></div>
                    <nav class="navbar navbar-expand-lg py-1" id="navbar-top" data-navbar-soft-on-scroll="data-navbar-soft-on-scroll">
                        <div class="container">
                            <a class="navbar-brand me-lg-auto cursor-pointer" href="">
                                <img class="w-50 w-md-100 img-fluid" src="assets/img/logos/logo.png" alt="" />
                            </a>
                            <button class="navbar-toggler border-0 pe-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent" data-navbar-collapse="data-navbar-collapse">
                                <div class="container d-lg-flex justify-content-lg-end pe-lg-0 w-lg-100">
                                    <input class="search fs-8 bg-transparent form-control" type="search" name="search" placeholder="search plants..." />
                                    <div class="search-icon">
                                        <span class="uil uil-search"></span>
                                    </div>
                                    <ul class="navbar-nav mt-2 mt-lg-1 ms-lg-4 ms-xl-8 ms-2xl-9 gap-lg-x1" data-navbar-nav="data-navbar-nav">
                                        <li class="nav-item">
                                            <a class="nav-link nav-bar-item px-0" href="/Admin/Login.aspx" title="support">Login</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="container" data-bs-target="#navbar-top" data-bs-spy="scroll" tabindex="0">
                        <section class="mb-9 mb-lg-10 mb-xxl-11 text-center text-lg-start mt-9" id="home">
                            <div>
                                <div class="row g-4 g-lg-6 g-xl-7 mb-6 mb-lg-7 mb-xl-10 align-items-center">
                                    <div class="col-12 col-lg-6">
                                        <img class="img-fluid w-50 w-lg-100" src="assets/img/Hero/man_watering.png" alt="" />
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <h1 class="fs-5 fs-md-3 fs-xxl-2 text-black fw-light mb-4">Selamat Datang di Toko Bunga Imelia</h1>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="container text-center">
                        <button class="btn scroll-to-top" data-scroll-top="data-scroll-top">
                            <span class="uil uil-angle-up text-white"></span>
                        </button>
                        <br />
                        <div class="form-group">
                            <asp:DropDownList class="form-select bg-white border-1" ID="Ddljenis" runat="server"></asp:DropDownList>
                            <label for="Ddljenis">Pilih Jenis</label>
                        </div>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary text-white w-100 py-3" ID="BtnPilih" runat="server" Text="Pilih Jenis" />
                        </div>
                        <div class="text-center">
                            <asp:GridView ID="GV" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="idbunga">
                                <Columns>
                                    <asp:BoundField DataField="idbunga" HeaderText="No" ReadOnly="True" />
                                    <asp:BoundField DataField="nama" HeaderText="Nama Bunga" />
                                    <asp:BoundField DataField="idjenis" HeaderText="ID Jenis" />
                                    <asp:BoundField DataField="stok" HeaderText="Stok" />
                                    <asp:BoundField DataField="harga" HeaderText="Harga" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <footer class="Footer" style="background-image: url('assets/img/illustrations/BOTTOM.png')">
                        <div class="pb-x1 px-3 px-lg-0">
                            <div class="container">
                                <div class="row align-items-end g-4 g-sm-6">
                                    <div class="col-6 col-md-4">
                                        <div class="mb-6 mb-md-8">
                                            <a class="cursor-pointer" href="">
                                                <img class="img-fluid" src="assets/img/logos/Footer_logo.png" alt="" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="row g-4 g-sm-6 g-md-0">
                                            <div class="col-6 col-md-12 mb-md-7">
                                                <h3 class="fs-9 fs-md-8 fw-bold mb-3" style="color: #FFF0D3;">Follow Sosial Media Kami</h3>
                                                <div class="d-flex align-items-center">
                                                    <a class="social-icon me-2" href="#!">
                                                        <span class="uil uil-facebook fs-8"></span>
                                                    </a>
                                                    <a class="social-icon me-2" href="#!">
                                                        <span class="uil uil-linkedin fs-8"></span>
                                                    </a>
                                                    <a class="social-icon me-2" href="#!">
                                                        <span class="uil uil-youtube fs-8"></span>
                                                    </a>
                                                    <a class="social-icon" href="#!">
                                                        <span class="uil uil-twitter fs-8"></span>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-6 col-md-12">
                                                <div class="mb-3">
                                                    <p class="fs-9 fs-md-8 fw-bold lh-nomal mb-0" style="color: #FFF0D3;">Kontak</p>
                                                </div>
                                                <div class="fs-10 fs-md-9">
                                                    <p class="mb-0 text-white opacity-70">Imelia Aprianah</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </main>
        <!-- ===============================================-->
        <!--    End of Main Content-->
        <!-- ===============================================-->

        <!-- ===============================================-->
        <!--    JavaScripts-->
        <!-- ===============================================-->
        <script src="vendors/popper/popper.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.min.js"></script>
        <script src="vendors/is/is.min.js"></script>
        <script src="vendors/countup/countUp.umd.js"></script>
        <script src="vendors/swiper/swiper-bundle.min.js"></script>
        <script src="vendors/lodash/lodash.min.js"></script>
        <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
        <script src="vendors/list.js/list.min.js"></script>
        <script src="assets/js/theme.js"></script>
    </form>
</body>

</html>
