<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>


<cfif isdefined("form.fieldnames")>

<!--- Set component path --->
<cfset f = application.multiUploadCFC>
<!--- Set the directory where you want to upload to --->
<cfset f.setDirectory("#ExpandPath('\uploadFormCFC_v2')#") />
<!--- Set the filenames, we just pass the default file name that the form generated --->
<cfset f.setNameofimages("#form.fieldnames#") />
<!--- set the name conflict to whatever you want, Overwrite, Error etc --->
<cfset f.setNameconflict("Overwrite") />
<!--- set the accept file type --->
<cfset f.setAccept("image/*") />
<!--- Then finally upload the files --->
<cfset showmsg = f.upload()>
<!--- Display user the thank you message --->
<br>

<cfoutput>#cgi.HTTP_REFERER#</cfoutput>
<cfoutput>#cgi.QUERY_STRING#</cfoutput>

<script>

	parent.$("#uploadResponseMsg").show();
	parent.$("#uploadResponseMsg").fadeIn("slow").append("<cfoutput>#showmsg#</cfoutput>");
	parent.$("#uploadResponseMsg").Highlight(900, '#00f');
	parent.$("#files_list").empty();
	//parent.location.href="index.cfm";
</script> 
</cfif> 

</body>
</html>
