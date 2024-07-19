Imports MySql.Data.MySqlClient

Public Class TambahBunga_M

    Dim id_bunga As Integer
    Dim nama, idjenis, stok, harga As String

    Public Function Tambah() As Boolean
        Dim query As String = "INSERT INTO bunga (nama, idjenis, stok, harga) VALUES (@nama, @idjenis, @stok, @harga)"

        ' Membuat array parameter sesuai dengan query
        Dim parameters As MySqlParameter() = {
            New MySqlParameter("@nama", nama),
            New MySqlParameter("@idjenis", idjenis),
            New MySqlParameter("@stok", stok),
            New MySqlParameter("@harga", harga)
        }

        Try
            Dim k As New Koneksidb
            Dim status As Boolean = k.Execute(query, parameters)
            Return status
        Catch ex As Exception
            ' Handle exception (jika diperlukan)
            Return False
        End Try
    End Function

    Public Function Lihat() As DataTable
        Dim dt As New DataTable
        ' Menggunakan JOIN untuk menggabungkan tabel bunga dan jenis_bunga
        Dim query As String = "SELECT b.idbunga AS ID, b.nama AS Nama, j.nama AS Jenis, b.stok AS Stok, b.harga AS Harga " &
                              "FROM bunga b " & "JOIN jenis_bunga j ON b.idjenis = j.idjenis"

        Try
            Dim k As New Koneksidb
            dt = k.GetResult(query)
        Catch ex As Exception
            ' Handle exception (jika diperlukan)
        End Try

        Return dt
    End Function

    Public Sub SetNama(nama As String)
        Me.nama = nama
    End Sub

    Public Sub SetIdjenis(idjenis As String)
        Me.idjenis = idjenis
    End Sub

    Public Sub SetStok(stok As String)
        Me.stok = stok
    End Sub

    Public Sub SetHarga(harga As String)
        Me.harga = harga
    End Sub

End Class