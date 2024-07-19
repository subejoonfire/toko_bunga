﻿Imports MySql.Data.MySqlClient
Public Class Koneksidb
    Dim username, password, server, database As String
    Dim mycn As MySqlConnection
    Dim mydata As MySqlDataAdapter
    Dim mycmd As MySqlCommand

    Public Sub New()
        username = "root"
        password = ""
        server = "localhost"
        database = "toko_bunga"
        Dim con_str As String
        con_str = "user=" & username & ";"
        con_str &= "pwd=" & password & ";"
        con_str &= "server=" & server & ";"
        con_str &= "database=" & database
        mycn = New MySqlConnection(con_str)
    End Sub

    Public Sub CekKoneksi()
        Try
            mycn.Open()
            mycn.Close()
            MsgBox("Koneksi Berhasil")
        Catch ex As Exception
            If mycn.State = ConnectionState.Open Then
                mycn.Close()
            End If
            MsgBox("Koneksi Gagal")
        End Try
    End Sub

    Public Function GetResult(query As String) As DataTable
        Dim dt As New DataTable
        Try
            mycn.Open()
            mydata = New MySqlDataAdapter(query, mycn)
            mydata.Fill(dt)
            mycn.Close()
        Catch ex As Exception
            If mycn.State = ConnectionState.Open Then
                mycn.Close()
            End If
            MsgBox("Data tidak dapat ditemukan, silahkan hubungi admin untuk dapat informasi lebih lanjut", MsgBoxStyle.Information, "Informasi")
        End Try
        Return dt
    End Function

    Public Function GetResult(query As String, parameters As MySqlParameter()) As DataTable
        Dim dt As New DataTable()
        Try
            Using conn As New MySqlConnection
                Using cmd As New MySqlCommand(query, conn)
                    cmd.Parameters.AddRange(parameters)
                    Using da As New MySqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using
                End Using
            End Using
        Catch ex As Exception
            ' Handle exceptions
        End Try
        Return dt
    End Function

    Public Function GetData(query As String) As DataTable
        Dim dt As New DataTable
        Try
            mycn.Open()
            Dim mydata As New MySqlDataAdapter(query, mycn)
            mydata.Fill(dt)
        Catch ex As Exception
            ' Handle error
        Finally
            mycn.Close()
        End Try
        Return dt
    End Function

    Public Function Execute(query As String, parameters As MySqlParameter()) As Boolean
        Dim status As Boolean
        Try
            mycn.Open()
            mycmd = New MySqlCommand(query, mycn)
            mycmd.Parameters.AddRange(parameters)
            mycmd.ExecuteNonQuery()
            status = True
            mycn.Close()
        Catch ex As Exception
            If mycn.State = ConnectionState.Open Then
                mycn.Close()
                MsgBox(ex.Message)
                status = False
            End If
        End Try
        Return status
    End Function

End Class