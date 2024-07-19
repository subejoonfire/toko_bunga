Public Class Jenis
    Public Function Lihat() As DataTable
        Dim dt As New DataTable
        Dim query As String = "SELECT idjenis AS idjenis, jenis FROM jenis"
        'create object k
        Dim k As New Koneksidb
        dt = k.GetResult(query)
        Return dt
    End Function
End Class