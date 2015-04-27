<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<!--- <cfset list1 = "a,b,c">
<cfset myinput = "d">
<cfset list2 = "d0,d1,d2">

<cfset list3 = "">
<cfloop index="i" from="1" to="3">
	<cfset list3 =list3 & myinput & i>
</cfloop>

<cfoutput>#list3#</cfoutput> --->





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




<cfset fieldlist = "a,b,c,d1,d2,d3">
<cfset uploadedInput = "d">

<cfset uploadedInputList = "">
<cfset cleanedList = "">

<cfloop index="i" from="1" to="6">
	<cfset uploadedInputList = uploadedInputList & uploadedInput & i & ",">
</cfloop>

<cfset lenofList = Len(uploadedInputList)>


fieldlist = <cfoutput>#fieldlist#</cfoutput><br>

<cfoutput>#Left(uploadedInputList,lenofList-1)#</cfoutput><br>



<!--- Find the position of the "imgCategory field" --->
<!--- <cfset xlist = ListFindNoCase(fieldlist, "imgCategory",",")>

<!--- Delete it from the list --->
<cfif xlist EQ 0>
	<cfset cleanedList = getNameofimages()>
<cfelse>
	<cfset cleanedList = ListDeleteAt(fieldlist, xlist,",")>
</cfif>  --->



<cfoutput>#ListInCommon(fieldlist, Left(uploadedInputList,lenofList-1))#</cfoutput><BR>

</body>
</html>
