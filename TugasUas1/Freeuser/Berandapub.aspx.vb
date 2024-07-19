Public Class Berandapub
    Inherits System.Web.UI.Page

    Dim dtbg As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim bunga As New Bunga_M()
        dtbg = bunga.Lihat()
        GV.DataSource = dtbg
        GV.DataBind()
    End Sub

End Class