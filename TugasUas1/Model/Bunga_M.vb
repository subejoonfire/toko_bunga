Imports MySql.Data.MySqlClient

Public Class Bunga_M
    Public Function Lihat() As DataTable
        Dim dt As New DataTable
        Dim query As String = "SELECT * FROM bunga"
        'create object k
        Dim k As New Koneksidb
        dt = k.GetResult(query)
        Return dt
    End Function

    Public Function Tambah(idbunga As Integer, nama As String, foto As Byte(), idjenis As Integer, stok As Integer, harga As Integer) As Boolean
        Dim query As String = "INSERT INTO bunga (idbunga, nama, foto, idjenis, stok, harga) VALUES (@idbunga, @nama, @foto, @idjenis, @stok, @harga)"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@idbunga", idbunga))
        parameters.Add(New MySqlParameter("@nama", nama))
        parameters.Add(New MySqlParameter("@foto", foto))
        parameters.Add(New MySqlParameter("@idjenis", idjenis))
        parameters.Add(New MySqlParameter("@stok", stok))
        parameters.Add(New MySqlParameter("@harga", harga))
        Dim k As New Koneksidb
        Return k.Execute(query, parameters.ToArray())
    End Function

    Public Function Ubah(idbunga As Integer, nama As String, foto As Byte(), idjenis As Integer, stok As Integer, harga As Integer) As Boolean
        Dim query As String = "UPDATE bunga SET nama=@nama, foto=@foto, idjenis=@idjenis, stok=@stok, harga=@harga WHERE idbunga=@idbunga"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@idbunga", idbunga))
        parameters.Add(New MySqlParameter("@nama", nama))
        parameters.Add(New MySqlParameter("@foto", foto))
        parameters.Add(New MySqlParameter("@idjenis", idjenis))
        parameters.Add(New MySqlParameter("@stok", stok))
        parameters.Add(New MySqlParameter("@harga", harga))
        Dim k As New Koneksidb
        Return k.Execute(query, parameters.ToArray())
    End Function

    Public Function Hapus(idbunga As Integer) As Boolean
        Dim query As String = "DELETE FROM bunga WHERE idbunga=@idbunga"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@idbunga", idbunga))
        Dim k As New Koneksidb
        Return k.Execute(query, parameters.ToArray())
    End Function
    Dim dt As New DataTable
    Public Function Cari(idbunga As Integer) As DataTable
        Dim k As New Koneksidb
        Dim query As String = "SELECT * FROM bunga WHERE idbunga = " & idbunga
        dt = k.GetResult(query)
        Return dt
    End Function
End Class