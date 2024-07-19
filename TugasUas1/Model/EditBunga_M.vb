Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Public Class EditBunga_M
    Private idbunga As Integer
    Private nama, idjenis, stok, harga As String

    Public Sub SetIdBunga(idbunga As Integer)
        Me.idbunga = idbunga
    End Sub

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

    Public Function Update() As Boolean
        Dim query As String = "UPDATE bunga SET nama=@nama, idjenis=@idjenis, stok=@stok, harga=@harga WHERE idbunga=@idbunga"

        Dim parameters As MySqlParameter() = {
            New MySqlParameter("@idbunga", idbunga),
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
            Return False
        End Try
    End Function

    Public Function Delete(idbunga As Integer) As Boolean
        Dim query As String = "DELETE FROM bunga WHERE idbunga=@idbunga"
        Dim parameters As MySqlParameter() = {
            New MySqlParameter("@idbunga", idbunga)
        }

        Try
            Dim k As New Koneksidb
            Dim status As Boolean = k.Execute(query, parameters)
            Return status
        Catch ex As Exception
            Return False
        End Try
    End Function
    Public Function GetBungaById(idbunga As Integer) As DataTable
        Dim dt As New DataTable
        Dim query As String = "SELECT idbunga, nama,stok, harga, idjenis FROM bunga WHERE idbunga = " & idbunga

        Dim parameters As MySqlParameter() = {
            New MySqlParameter("@idBunga", idbunga)
        }

        Try
            Dim k As New Koneksidb
            dt = k.GetResult(query, parameters)
        Catch ex As Exception
            ' Handle exceptions
        End Try

        Return dt
    End Function
End Class