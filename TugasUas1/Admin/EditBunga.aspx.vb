Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Public Class EditBunga
    Inherits System.Web.UI.Page
    Dim Bunga_M As New Bunga_M
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim idbunga As Integer = Convert.ToInt32(Request.QueryString("id"))
            LoadData(idbunga)
        End If
    End Sub

    Private Sub LoadData(idBunga As Integer)
        Try
            Dim dt As DataTable
            dt = Bunga_M.Cari(idBunga)
            If dt.Rows.Count > 0 Then
                hfIdBunga.Value = dt.Rows(0)("idbunga").ToString()
                txtNama.Text = dt.Rows(0)("nama").ToString()
                txtIdjenis.Text = dt.Rows(0)("idjenis").ToString()
                txtStok.Text = dt.Rows(0)("stok").ToString()
                txtHarga.Text = dt.Rows(0)("harga").ToString()
            End If
        Catch ex As Exception
            ' Handle error
            MsgBox("Error loading data: " & ex.Message)
        End Try
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim idbunga As Integer = Convert.ToInt32(hfIdBunga.Value)
        Dim nama As String = txtNama.Text
        Dim idjenis As Integer = Convert.ToInt32(txtIdjenis.Text)
        Dim stok As Integer = Convert.ToInt32(txtStok.Text)
        Dim harga As Integer = Convert.ToInt32(txtHarga.Text)

        Dim foto As Byte() = Nothing
        If fuFoto.HasFile Then
            foto = fuFoto.FileBytes
        End If

        Dim bungaM As New Bunga_M
        If bungaM.Ubah(idbunga, nama, foto, idjenis, stok, harga) Then
            ' update successful, redirect to a success page or display a success message
            Response.Redirect("Berandaadmin.aspx")
        Else
            ' update failed, display an error message
        End If
    End Sub
End Class
