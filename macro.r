i = 0
'x = 0
For j = 1 To 3



If j = 1 Then

p = Sheets("TABLE_DETAILS").Range("B2").Offset(i + 1, 2)
q = Sheets("TABLE_DETAILS").Range("C2").Offset(i + 1, 2)
x = Sheets("TABLE_DETAILS").Range("D2").Offset(i + 1, 2)

strqry = " select " & x & " from  " & q & " where " & p & ""

y = "select count(*) from (" & strqry & ")"

rs.Open y, cn, adOpenStatic
Sheets("TABLE_DETAILS").Range("E2").Offset(i, 2).CopyFromRecordset rs
Sheets("TABLE_DETAILS").Range("F2").Offset(i, 2) = y
rs.Close
ElseIf j > 1 Then

p = Sheets("TABLE_DETAILS").Range("B2").Offset(i, 2)
q = Sheets("TABLE_DETAILS").Range("C2").Offset(i, 2)
r = Sheets("TABLE_DETAILS").Range("B2").Offset(i + 1, 2)
s = Sheets("TABLE_DETAILS").Range("C2").Offset(i + 1, 2)
x = Sheets("TABLE_DETAILS").Range("D2").Offset(i + 1, 2)
'rs.cursortype = adopenforwardonly

strqry = " select " & x & " from  " & q & " where " & p & ""
strqry1 = " select " & x & " from  " & s & " where " & r & ""
strqry2 = "" & strqry2 & "  intersect " & strqry1 & ""
'Z = "" & strqry1 & " intersect " & strqry & ""

A = "select count(*) from (" & strqry & " " & strqry2 & ")"
rs.Open A, cn, adOpenStatic
Sheets("TABLE_DETAILS").Range("E2").Offset(i + 1, 2).CopyFromRecordset rs
Sheets("TABLE_DETAILS").Range("F2").Offset(i + 1, 2) = A
rs.Close
i = i + 1
End If

On Error Resume Next
Next j

UserForm1.Hide
Me.TextBox1.Value = Null
Me.TextBox2.Value = Null
Set rs = Nothing
Set cn = Nothing
End Sub
