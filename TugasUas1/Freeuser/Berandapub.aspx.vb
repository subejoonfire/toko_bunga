Public Class Berandapub
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'DROPDOWNLIST DDLJenis
        'Tampilkan data kategori di DdlJenis
        Dim dtjenis As New DataTable
        Dim mk As New Jenis
        dtjenis = mk.Lihat()
        'Hapus isi dari dropdownlist terlebih dahulu
        Ddljenis.Items.Clear()
        'Atur dropdownlist: data yang ditampilkan dan data yang menjadi nilai
        Ddljenis.DataSource = dtjenis
        Ddljenis.DataTextField = "jenis"
        Ddljenis.DataValueField = "idjenis"
        'Bind data ke Dropdownlist
        Ddljenis.DataBind()
        'Menambahkan item kosong
        Ddljenis.Items.Insert(0, New ListItem("", ""))

        'Tampilkan data koleksi di GV
        Dim dtbg As New DataTable
        Dim bunga As New Bunga_M()
        dtbg = bunga.Lihat()
        'Hapus isi dari GV terlebih dahulu
        'Atur Gridview
        GV.DataSource = dtbg
        GV.DataBind()
    End Sub

End Class