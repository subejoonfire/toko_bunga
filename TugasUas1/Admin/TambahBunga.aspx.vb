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

        If nama <> "" AndAlso idjenis <> "" AndAlso stok <> "" AndAlso harga <> "" AndAlso foto.HasFile Then
            Dim kt As New Bunga_M
            Dim fotoBytes() As Byte
            fotoBytes = New Byte(foto.PostedFile.ContentLength - 1) {}
            foto.PostedFile.InputStream.Read(fotoBytes, 0, foto.PostedFile.ContentLength)

            Dim status As Boolean = kt.Tambah(0, nama, fotoBytes, Convert.ToInt32(idjenis), Convert.ToInt32(stok), Convert.ToInt32(harga))
            If status = True Then
                MsgBox("Data bunga berhasil di tambah")
                Response.Redirect("Berandaadmin.aspx")
            Else
                MsgBox("Data bunga tidak berhasil di tambah")
            End If
        Else
            MsgBox("Semua field harus diisi dan foto harus diupload!")
        End If
    End Sub


    Protected Sub btnKembali_Click(sender As Object, e As EventArgs) Handles btnKembali.Click
        Response.Redirect("Berandaadmin.aspx")
    End Sub
End Class