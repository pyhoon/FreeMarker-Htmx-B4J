B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.8
@EndOfDesignText@
'Handler class
Sub Class_Globals
	Private Request As ServletRequest
	Private Response As ServletResponse
End Sub

Public Sub Initialize
	
End Sub

Sub Handle (req As ServletRequest, resp As ServletResponse)
	Request = req
	Response = resp
	Response.ContentType = "text/html"
	
	If Request.RequestURI = "/provinces" Then
		Dim Content As String = $"<datalist id="provinces">
	<option value="Gauteng">
	<option value="Western Cape">
	<option value="KwaZulu-Natal">
</datalist>"$
	Response.Write(Content)
	Else
		Dim List1 As List
		List1.Initialize
		'List1.Add("Province 1")
		'List1.Add("Province 2")
		'List1.Add("Province 3")
		List1.Add(CreateMap("province": "Province 1"))
		List1.Add(CreateMap("province": "Province 2"))
		List1.Add(CreateMap("province": "Province 3"))
		Dim FM As Freemarker
		FM.Initialize
		FM.DirectoryForTemplateLoading = File.Combine(File.DirApp, "templates")
		Dim TM As Template = FM.getTemplate("index.html")
		Response.Write(TM.stdOut(CreateMap("provincetables": List1)))
	End If
End Sub