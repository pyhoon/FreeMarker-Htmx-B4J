B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=1.06
@EndOfDesignText@
'Class module
Sub Class_Globals
	Private Request As ServletRequest
	Private Response As ServletResponse
End Sub

Public Sub Initialize

End Sub

Sub Handle (Req As ServletRequest, Resp As ServletResponse)
	Request = Req
	Response = Resp
	Select Request.Method.ToUpperCase
		Case "POST"
			Dim data As String = PrintAllParameters
			Log(data)
			Response.Write("See B4J logs")
		Case Else
			Log("Invalid method")
	End Select
End Sub

Public Sub PrintAllParameters As String
	Dim sb As StringBuilder
	sb.Initialize
	sb.Append("<ul>").Append(CRLF)
	Dim params As Map = Request.ParameterMap
	For Each name As String In params.Keys
		sb.Append("<li>").Append(name).Append(":")
		Dim values() As String = params.Get(name)
		For Each value As String In values
			sb.Append(" ").Append(value)
		Next
		sb.Append("</li>").Append(CRLF)
	Next
	sb.Append("</ul>")
	Return sb.ToString
End Sub