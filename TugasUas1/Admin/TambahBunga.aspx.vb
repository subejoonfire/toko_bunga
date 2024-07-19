Imports TugasUas1.TambahBunga

Public Class TambahBunga
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtNama.Attributes("placeholder") = "Masukkan nama bunga"
            txtIdjenis.Attributes("placeholder") = "Masukkan id jenis"
            txtStok.Attributes("placeholder") = "Masukkan stok"
            txtHarga.Attributes("placeholder") = "Masukkan harga"
        End If
    End Sub

    Protected Sub btnSimpan_Click(sender As Object, e As EventArgs) Handles btnSimpan.Click
        Dim nama As String = txtNama.Text
        Dim idjenis As String = txtIdjenis.Text
        Dim stok As String = txtStok.Text
        Dim harga As String = txtHarga.Text

        If nama <> "" AndAlso idjenis <> "" AndAlso stok <> "" AndAlso harga <> "" Then
            Dim kt As New TambahBunga_M
            kt.SetNama(nama)
            kt.SetIdjenis(idjenis)
            kt.SetStok(Convert.ToInt32(stok))
            kt.SetHarga(Convert.ToDecimal(harga))
            Dim status As Boolean = kt.Tambah()
            If status = True Then
                MsgBox("Data bunga berhasil di tambah")
                Response.Redirect("Berandaadmin.aspx")
            Else
                MsgBox("Data bunga tidak berhasil di tambah")
            End If
        Else
            MsgBox("Semua field harus diisi!")
        End If
    End Sub


    Protected Sub btnKembali_Click(sender As Object, e As EventArgs) Handles btnKembali.Click
        Response.Redirect("Berandaadmin.aspx")
    End Sub
End Class