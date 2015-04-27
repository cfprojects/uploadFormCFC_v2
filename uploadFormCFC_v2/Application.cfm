<cfapplication name="uploadFormCFC_v2_1_1" sessionmanagement="Yes">
<cfif NOT StructKeyExists(application, "multiUploadCFC")>
	<cflock timeout="10" name="multiUploadCFCLock" type="EXCLUSIVE">
		<cfif NOT StructKeyExists(application, "multiUploadCFC")>
			<cfset application.multiUploadCFC = createObject("component","uploadFormCFC.upload")>
		</cfif>
	</cflock>
</cfif>
