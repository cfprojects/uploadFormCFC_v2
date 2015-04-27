<cfcomponent displayname="Multiupload" hint="Component to upload x number of images">

	<cfset variables.cleanedList = "" />
	<cfset variables.action = "" />
	<cfset variables.inputname = "" />
	<cfset variables.inputid = "" />
	<cfset variables.numofrows = "" />
	<cfset variables.listid = "" />
	<cfset variables.nameofimages = "" />
	<cfset variables.directory = "" />
	<cfset variables.nameconflict = "" />
	<cfset variables.accept = "" />
	
	<cfscript>
/**
 * Returns elements in list1 that are found in list2.
 * Based on ListCompare by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param List1 	 Full list of delimited values.  
 * @param List2 	 Delimited list of values you want to compare to List1.  
 * @param Delim1 	 Delimiter used for List1.  Default is the comma.  
 * @param Delim2 	 Delimiter used for List2.  Default is the comma.  
 * @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma.  
 * @return Returns a delimited list of values. 
 * @author Michael Slatoff (rbils@amkor.commichael@slatoff.com) 
 * @version 1, August 20, 2001 
 */
function ListInCommon(List1, List2)
{
  var TempList = "";
  var Delim1 = ",";
  var Delim2 = ",";
  var Delim3 = ",";
  var i = 0;
  // Handle optional arguments
  switch(ArrayLen(arguments)) {
    case 3:
      {
        Delim1 = Arguments[3];
        break;
      }
    case 4:
      {
        Delim1 = Arguments[3];
        Delim2 = Arguments[4];
        break;
      }
    case 5:
      {
        Delim1 = Arguments[3];
        Delim2 = Arguments[4];          
        Delim3 = Arguments[5];
        break;
      }        
  } 
   /* Loop through the second list, checking for the values from the first list.
    * Add any elements from the second list that are found in the first list to the
    * temporary list
    */  
  for (i=1; i LTE ListLen(List2, "#Delim2#"); i=i+1) {
    if (ListFindNoCase(List1, ListGetAt(List2, i, "#Delim2#"), "#Delim1#")){
     TempList = ListAppend(TempList, ListGetAt(List2, i, "#Delim2#"), "#Delim3#");
    }
  }
  Return TempList;
}
</cfscript>
	
	
	<cffunction name="getCleanedList" access="public" hint="Getter for cleanedList" output="false" returnType="string">
		<cfreturn variables.cleanedList />
	</cffunction>

	<cffunction name="setCleanedList" access="public" hint="Setter for cleanedList" output="false" returnType="void">
		<cfargument name="cleanedList" hint="" required="yes" type="string" />
		<cfset variables.cleanedList = arguments.cleanedList />
	</cffunction>
	
	<cffunction name="getAction" access="public" hint="Getter for action" output="false" returnType="string">
		<cfreturn variables.action />
	</cffunction>

	<cffunction name="setAction" access="public" hint="Setter for action" output="false" returnType="void">
		<cfargument name="action" hint="" required="yes" type="string" />
		<cfset variables.action = arguments.action />
	</cffunction>

	<cffunction name="getInputname" access="public" hint="Getter for inputname" output="false" returnType="string">
		<cfreturn variables.inputname />
	</cffunction>

	<cffunction name="setInputname" access="public" hint="Setter for inputname" output="false" returnType="void">
		<cfargument name="inputname" hint="" required="yes" type="string" />
		<cfset variables.inputname = arguments.inputname />
	</cffunction>

	<cffunction name="getInputid" access="public" hint="Getter for inputid" output="false" returnType="string">
		<cfreturn variables.inputid />
	</cffunction>

	<cffunction name="setInputid" access="public" hint="Setter for inputid" output="false" returnType="void">
		<cfargument name="inputid" hint="" required="yes" type="string" />
		<cfset variables.inputid = arguments.inputid />
	</cffunction>

	<cffunction name="getNumofrows" access="public" hint="Getter for numofrows" output="false" returnType="string">
		<cfreturn variables.numofrows />
	</cffunction>

	<cffunction name="setNumofrows" access="public" hint="Setter for numofrows" output="false" returnType="void">
		<cfargument name="numofrows" hint="" required="yes" type="string" />
		<cfset variables.numofrows = arguments.numofrows />
	</cffunction>

	<cffunction name="getListid" access="public" hint="Getter for listid" output="false" returnType="string">
		<cfreturn variables.listid />
	</cffunction>

	<cffunction name="setListid" access="public" hint="Setter for listid" output="false" returnType="void">
		<cfargument name="listid" hint="" required="yes" type="string" />
		<cfset variables.listid = arguments.listid />
	</cffunction>

	<cffunction name="getNameofimages" access="public" hint="Getter for nameofimages" output="false" returnType="string">
		<cfreturn variables.nameofimages />
	</cffunction>

	<cffunction name="setNameofimages" access="public" hint="Setter for nameofimages" output="false" returnType="void">
		<cfargument name="nameofimages" hint="" required="yes" type="string" />
		<cfset variables.nameofimages = arguments.nameofimages />
	</cffunction>

	<cffunction name="getDirectory" access="public" hint="Getter for directory" output="false" returnType="string">
		<cfreturn variables.directory />
	</cffunction>

	<cffunction name="setDirectory" access="public" hint="Setter for directory" output="false" returnType="void">
		<cfargument name="directory" hint="" required="yes" type="string" />
		<cfset variables.directory = arguments.directory />
	</cffunction>

	<cffunction name="getNameconflict" access="public" hint="Getter for nameconflict" output="false" returnType="string">
		<cfreturn variables.nameconflict />
	</cffunction>

	<cffunction name="setNameconflict" access="public" hint="Setter for nameconflict" output="false" returnType="void">
		<cfargument name="nameconflict" hint="" required="yes" type="string" />
		<cfset variables.nameconflict = arguments.nameconflict />
	</cffunction>

	<cffunction name="getAccept" access="public" hint="Getter for accept" output="false" returnType="string">
		<cfreturn variables.accept />
	</cffunction>

	<cffunction name="setAccept" access="public" hint="Setter for accept" output="false" returnType="void">
		<cfargument name="accept" hint="" required="yes" type="string" />
		<cfset variables.accept = arguments.accept />
	</cffunction>

<cffunction name="upload" access="public" returntype="any" output="yes">
	<!--- Local variables --->
<cfset var fieldlist = "" />
<cfset var uploadedInput = "" />
<cfset var uploadedInputList = "" />
<cfset var cleanedList = "" />
<cfset var i = "">
<cfset var filefield = "">
<cfset var uploadsuccess = 0 >	
<cfset var numofimages = "">	


<!--- Get the list of form fields ---> 
<cfset fieldlist = getNameofimages()>

<!--- Get the name of the input that is used for the uploaded input --->
<cfset uploadedInput = getInputname()>

<cfloop index="i" from="1" to="#ListLen(fieldlist,",")#">
	<cfset uploadedInputList = uploadedInputList & uploadedInput & i & ",">
</cfloop>
<!--- This is the cleaned list, abstracting all fields that are not uploadeable --->
<cfset cleanedList = ListInCommon(fieldlist, Left(uploadedInputList,Len(uploadedInputList)-1))>
<cfset numofimages = ListLen(cleanedList)>
	<!--- Loop thru to upload the files --->
	<cftry>
		
		<cfloop index="i" from="1" to="#numofimages#">
			<cfset filefield = ListGetAt(cleanedList, i, ",")>
			<cfif Evaluate("Form.#filefield#") NEQ "">
				<cfset uploadsuccess = uploadsuccess + 1>
				<cffile action="UPLOAD" filefield="#filefield#" destination="#getDirectory()#" result="rsUpload" nameconflict="#getNameconflict()#" accept="#getAccept()#">
			</cfif>
		</cfloop>
	
	<!--- Display msg base on how many files were uploaded --->	
	<cfif uploadsuccess GT 1>
		<cfset successmsg = "Thank You #uploadsuccess# files were uploaded!">
	<cfelse>
		<cfset successmsg = "Thank You #uploadsuccess# file was uploaded!">	
	</cfif>
	<!--- Return message --->
	<cfreturn successmsg>
	<cfcatch type="Any">
			<cfreturn cfcatch.message>
	</cfcatch>
	</cftry>
</cffunction>


<cffunction name="jquery" access="public" returntype="string" output="false">
	<cfsavecontent variable="viewOutput">
	<script>
		<cfinclude template="jquery.js">
		<cfinclude template="interface.js">
		$(function(){
  			// Document is ready
			$("#uploadResponseMsg").hide();
		});
		
		
	</script>
	</cfsavecontent>
	<cfreturn viewOutput>
</cffunction>



<cffunction name="uploadForm" access="public" returntype="string" output="false">

<cfsavecontent variable="viewOutput">
<script>
// Multiple file selector by Stickman -- http://www.the-stickman.com 
// with thanks to: [for Safari fixes] Luis Torrefranca -- http://www.law.pitt.edu and Shawn Parker & John Pennypacker -- http://www.fuzzycoconut.com [for duplicate name bug] 'neal'
function MultiSelector( list_target, max ){
	this.list_target = list_target;this.count = 1;
	this.id = 1;
		if( max ){
	this.max = max;
	} else {
	this.max = -1;
};

this.addElement = function( element ){
	if( element.tagName == 'INPUT' && element.type == 'file' ){
		element.name = '<cfoutput>#getInputname()#</cfoutput>' + this.id++;
		element.multi_selector = this;
		element.onchange = function(){
		var new_element = document.createElement( 'input' );
		new_element.type = 'file';
		
		this.parentNode.insertBefore( new_element, this );
		this.multi_selector.addElement( new_element );
		this.multi_selector.addListRow( this );
		this.style.position = 'absolute';
		this.style.left = '-1000px';
	};
		
if( this.max != -1 && this.count >= this.max ){
	element.disabled = true;
};
this.count++;
this.current_element = element;
} else {
	alert( 'Error: not a file input element' );
	};
};

this.addListRow = function( element ){
	var new_row = document.createElement( 'div' );
	var new_row_button = document.createElement( 'input' );
	new_row_button.type = 'image';
	new_row_button.value = 'Delete';
	new_row_button.src = 'close_btn.gif';
	new_row.element = element;
	
	new_row_button.onclick = function(){
	this.parentNode.element.parentNode.removeChild( this.parentNode.element );
	this.parentNode.parentNode.removeChild( this.parentNode );
	this.parentNode.element.multi_selector.count--;
	this.parentNode.element.multi_selector.current_element.disabled = false;
	//alert('hi');
	parent.$("#uploadResponseMsg").empty();
	return false;
	};
	new_row.innerHTML = element.value;
	new_row.appendChild( new_row_button );
	this.list_target.appendChild( new_row );
	parent.$("#uploadResponseMsg").empty();
	//alert('hello');
	};
};
</script>


		<cfoutput>
	<!--- This is the form, nothing special here --->
			<input id="#getInputid()#" type="file" name="#getInputname()#">	
	<!--- This is div to show the user what they just picked --->
		<div id="#getListid()#"></div>
			<script>
				<!-- Create an instance of the multiSelector class, pass it the output target and the max number of files -->
				var multi_selector = new MultiSelector(document.getElementById('#getListid()#'), #getNumofrows()#);
				<!-- Pass in the file element -->
				multi_selector.addElement(document.getElementById('#getInputid()#'));
			</script>
		</cfoutput>
	</cfsavecontent>						
</cffunction>
	
<!--- This is the function to display the form --->	
<cffunction name="displayForm" access="public" output="false" returntype="Any">
		<cfset var viewOutput = "">
		<cfset viewOutput = uploadForm() />
<!--- Return to the user --->		
		<cfreturn viewOutput />
	</cffunction>
</cfcomponent>