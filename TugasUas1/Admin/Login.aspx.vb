Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnLogin_Click(sender As Object, e As EventArgs) Handles BtnLogin.Click
        Dim username As String = TxtUsername.Text
        Dim password As String = TxtPassword.Text

        'validasi username dan password tidak boleh kosong
        If username = "" Then
            MsgBox("Username wajib diisi")
            TxtUsername.Focus()
        ElseIf password = "" Then
            MsgBox("Password wajib diisi")
            TxtPassword.Focus()
        Else
            'akses CekLogin dari akun
            Dim ap As New akun
            Dim dt As New DataTable
            dt = ap.CekLogin(username, password)

            'cek apakah login berhasil
            Dim jumbar As Integer = dt.Rows.Count
            If jumbar = 0 Then
                MsgBox("Username/Password yang ada masukkan salah")
                TxtUsername.Text = ""
                TxtPassword.Text = ""
                TxtUsername.Focus()
            Else
                ' Jika login berhasil, langsung redirect
                Response.Redirect("Berandaadmin.aspx")
            End If
        End If
    End Sub
End Class