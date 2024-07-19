<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Sidebar.ascx.vb" Inherits="TugasUas1.Sidebar" %>

<!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">                
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/foto.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Imelia</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">                    
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Dashboard</a>
                </div>
                <div class="navbar-nav w-100">                    
                    <a href="Bunga.aspx" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Bunga</a>
                </div>
                <div class="navbar-nav w-100">                    
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Jenis Bunga</a>
                </div>
                <div class="navbar-nav w-100">                    
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Jumlah Bunga</a>
                </div> 
            </nav>
        </div>
        <!-- Sidebar End -->