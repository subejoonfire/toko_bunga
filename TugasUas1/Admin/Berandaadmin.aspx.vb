Imports System.Data.SqlClient

Public Class Berandaadmin
    Inherits System.Web.UI.Page
    Dim Bunga_M As New Bunga_M
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim query As String = "SELECT nama_grafik, angka_grafik FROM grafik"
            Dim k As New Koneksidb
            Dim dt As System.Data.DataTable = k.GetResult(query)
            ViewState("GrafikData") = dt
            dataBunga()
        End If
    End Sub

    Public Sub dataBunga()
        Dim dt As DataTable = Bunga_M.Lihat()
        GridView.DataSource = dt
        GridView.DataBind()

        ' Add image column to GridView
        Dim imageColumn As New TemplateField()
        imageColumn.HeaderText = "Foto"
        imageColumn.ItemTemplate = New ImageTemplate()
        GridView.Columns.Add(imageColumn)
    End Sub
    Protected Sub GridView_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView.RowDeleting
        Dim idbunga As Integer = Convert.ToInt32(GridView.DataKeys(e.RowIndex).Values("idbunga"))
        If Bunga_M.Hapus(idbunga) Then
            Response.Redirect("Berandaadmin.aspx")
        Else
        End If
    End Sub
    Protected Sub GridView_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView.RowEditing
        ' Set the edit index of the GridView
        GridView.EditIndex = e.NewEditIndex

        ' Bind the data to the GridView again
        GridView.DataBind()
    End Sub
    Dim dt As New DataTable
    Public Function TampilGrafik() As Object
        Dim query As String = "SELECT nama_grafik, angka_grafik FROM grafik"
        Dim k As New Koneksidb
        Dim grafikData As New List(Of Object)
        dt = k.GetResult(query)
        For Each row As DataRow In dt.Rows
            grafikData.Add(New With {.nama = row("nama_grafik"), .jumlah = row("angka_grafik")})
        Next

        Return grafikData
    End Function

End Class
Public Class ImageTemplate
    Implements ITemplate

    Public Sub InstantiateIn(container As Control) Implements ITemplate.InstantiateIn
        Dim image As New Image()
        image.Width = 100
        image.Height = 100
        container.Controls.Add(image)
    End Sub
End Class