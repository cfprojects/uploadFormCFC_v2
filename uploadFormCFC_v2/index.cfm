<!--- create component --->
<cfset f = application.multiUploadCFC>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
	  	<title>uploadFormCFC</title>
		<cfoutput>#f.jquery()#</cfoutput>
		
	<style>
	#files_list {
		padding:5px;
		margin: 5px;
		font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
		font-size: 11px;
	}
	
	#files_list input {
		padding:0 0 0 5px;
	
	}
	
</style>
</head>
<body bgcolor="#666666">
<div id="container">

	<table width="100%" cellspacing="2" cellpadding="2">
			<tr>
			<td valign="top" colspan="2">
				<div id="box1" style="padding:5px;">
				<div id="uploadResponseMsg" style="background-color:#ffcc33;width:350px;"></div>
					<div id="panel1">
						
						<!--- Set your upload page --->
						<cfset f.setAction("upload.cfm") />
						<!--- Set how many rows you want --->
						<cfset f.setNumofrows("11") />
						<!--- Set the name of your input field, for example if foo, the code will make foo0, foo1, foo2 etc --->
						<cfset f.setInputname("foo") />
						<!--- Set the id of id of the input field, you can change to it whatever you want, so as long as it's unique --->
						<cfset f.setInputid("my_file_element") />
						<!--- Set the name of the div to display the list of selected files, this also must be unique --->
						<cfset f.setListid("files_list") />
						<!--- Display the form --->
						
						<form enctype="multipart/form-data" action="<cfoutput>#f.getAction()#</cfoutput>" method = "post" target="upload" name="myupload">
							<input type="text" name="firstname" value="" /><br />
							<cfoutput>#f.displayForm()#</cfoutput>
							<input type="submit" value="Upload">
						</form>
							
					</div>
				</div>	
				</td>
			</tr>
		</table>
	</div>	
<iframe src="upload.cfm" name="upload" width="400" height="400" marginwidth="0" marginheight="0" scrolling="no" frameborder="0"></iframe>
</body>
</html>

