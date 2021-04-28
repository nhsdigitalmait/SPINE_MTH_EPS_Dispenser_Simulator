<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
<axsl:param name="archiveDirParameter"/><axsl:param name="archiveNameParameter"/><axsl:param name="fileNameParameter"/><axsl:param name="fileDirParameter"/>

<!--PHASES-->


<!--PROLOG-->


<!--KEYS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<axsl:template match="*" mode="schematron-select-full-path"><axsl:apply-templates select="." mode="schematron-get-full-path"/></axsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<axsl:template match="*" mode="schematron-get-full-path"><axsl:apply-templates select="parent::*" mode="schematron-get-full-path"/><axsl:text>/</axsl:text><axsl:choose><axsl:when test="namespace-uri()=''"><axsl:value-of select="name()"/><axsl:variable name="p_1" select="1+    count(preceding-sibling::*[name()=name(current())])"/><axsl:if test="$p_1&gt;1 or following-sibling::*[name()=name(current())]">[<axsl:value-of select="$p_1"/>]</axsl:if></axsl:when><axsl:otherwise><axsl:text>*[local-name()='</axsl:text><axsl:value-of select="local-name()"/><axsl:text>' and namespace-uri()='</axsl:text><axsl:value-of select="namespace-uri()"/><axsl:text>']</axsl:text><axsl:variable name="p_2" select="1+   count(preceding-sibling::*[local-name()=local-name(current())])"/><axsl:if test="$p_2&gt;1 or following-sibling::*[local-name()=local-name(current())]">[<axsl:value-of select="$p_2"/>]</axsl:if></axsl:otherwise></axsl:choose></axsl:template><axsl:template match="@*" mode="schematron-get-full-path"><axsl:text>/</axsl:text><axsl:choose><axsl:when test="namespace-uri()=''">@<axsl:value-of select="name()"/></axsl:when><axsl:otherwise><axsl:text>@*[local-name()='</axsl:text><axsl:value-of select="local-name()"/><axsl:text>' and namespace-uri()='</axsl:text><axsl:value-of select="namespace-uri()"/><axsl:text>']</axsl:text></axsl:otherwise></axsl:choose></axsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->
<axsl:template match="node() | @*" mode="schematron-get-full-path-2"><axsl:for-each select="ancestor-or-self::*"><axsl:text>/</axsl:text><axsl:value-of select="name(.)"/><axsl:if test="preceding-sibling::*[name(.)=name(current())]"><axsl:text>[</axsl:text><axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/><axsl:text>]</axsl:text></axsl:if></axsl:for-each><axsl:if test="not(self::*)"><axsl:text/>/@<axsl:value-of select="name(.)"/></axsl:if></axsl:template>

<!--MODE: GENERATE-ID-FROM-PATH -->
<axsl:template match="/" mode="generate-id-from-path"/><axsl:template match="text()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/></axsl:template><axsl:template match="comment()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/></axsl:template><axsl:template match="processing-instruction()" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/></axsl:template><axsl:template match="@*" mode="generate-id-from-path"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:value-of select="concat('.@', name())"/></axsl:template><axsl:template match="*" mode="generate-id-from-path" priority="-0.5"><axsl:apply-templates select="parent::*" mode="generate-id-from-path"/><axsl:text>.</axsl:text><axsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/></axsl:template><!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
<axsl:template match="node() | @*" mode="schematron-get-full-path-3"><axsl:for-each select="ancestor-or-self::*"><axsl:text>/</axsl:text><axsl:value-of select="name(.)"/><axsl:if test="parent::*"><axsl:text>[</axsl:text><axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/><axsl:text>]</axsl:text></axsl:if></axsl:for-each><axsl:if test="not(self::*)"><axsl:text/>/@<axsl:value-of select="name(.)"/></axsl:if></axsl:template>

<!--MODE: GENERATE-ID-2 -->
<axsl:template match="/" mode="generate-id-2">U</axsl:template><axsl:template match="*" mode="generate-id-2" priority="2"><axsl:text>U</axsl:text><axsl:number level="multiple" count="*"/></axsl:template><axsl:template match="node()" mode="generate-id-2"><axsl:text>U.</axsl:text><axsl:number level="multiple" count="*"/><axsl:text>n</axsl:text><axsl:number count="node()"/></axsl:template><axsl:template match="@*" mode="generate-id-2"><axsl:text>U.</axsl:text><axsl:number level="multiple" count="*"/><axsl:text>_</axsl:text><axsl:value-of select="string-length(local-name(.))"/><axsl:text>_</axsl:text><axsl:value-of select="translate(name(),':','.')"/></axsl:template><!--Strip characters--><axsl:template match="text()" priority="-1"/>

<!--SCHEMA METADATA-->
<axsl:template match="/"><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN TransmissionWrapperChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*" priority="1000" mode="M3">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id)=1 and string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_ID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:creationTime)=1 and string-length(hl7:creationTime/@value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_CREATION_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:versionCode)=1 and string-length(hl7:versionCode/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_VERSION_CODE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:interactionId[@root='2.16.840.1.113883.2.1.3.2.4.12']/@extension)=1 and hl7:interactionId[@root='2.16.840.1.113883.2.1.3.2.4.12']/@extension=local-name()"/><axsl:otherwise>***fault|ErrorBase1732.INCONSISTENT_HL7_INTERACTION_ID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionRcv/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107'])=1 and string-length(hl7:communicationFunctionRcv/hl7:device/hl7:id[@root = '1.2.826.0.1285.0.2.0.107']/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_COMM_FUNC_RCV***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionSnd/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107'])=1 and string-length(hl7:communicationFunctionSnd/hl7:device/hl7:id[@root = '1.2.826.0.1285.0.2.0.107']/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_COMM_FUNC_SND***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent)=1"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_CONTROL_ACT***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent/hl7:author1)=1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|author1***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent/hl7:author1/hl7:AgentSystemSDS/hl7:agentSystemSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension)=1 and string-length(hl7:ControlActEvent/hl7:author1/hl7:AgentSystemSDS/hl7:agentSystemSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|author1***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|interactionID|<axsl:text/><axsl:value-of select="hl7:interactionId[@root='2.16.840.1.113883.2.1.3.2.4.12']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|messageVersion|<axsl:text/><axsl:value-of select="hl7:versionCode/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|messageID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|toASID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionRcv/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|fromASID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionSnd/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|authorSystem|<axsl:text/><axsl:value-of select="hl7:ControlActEvent/hl7:author1/hl7:AgentSystemSDS/hl7:agentSystemSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN cpisQueryChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery" priority="1000" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|Event ID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:queryByParameter/hl7:person.NHSnumber/hl7:value/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|NHS Number***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN cpisQueryReport-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery" priority="1000" mode="M5">

		<!--REPORT -->
<axsl:if test="true()">***report|eventId|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumberCode|<axsl:text/><axsl:value-of select="hl7:queryByParameter/hl7:person.NHSnumber/hl7:value/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN cpisAuthorChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="hl7:author/hl7:COCT_TP145102GB01.AssignedAuthor or hl7:author/hl7:COCT_TP145104GB01.System"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|[authorPerson or authorDevice]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN cpisAuthorPersonChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery/hl7:author/hl7:COCT_TP145102GB01.AssignedAuthor" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|Job Role Code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@displayName)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|Job Role Name***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:representedOrganization/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|Organisation Code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:representedOrganization/hl7:name)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|Organisation Name***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id[@root='1.2.826.0.1285.0.2.0.65']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|authorID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN cpisAuthorPersonReport-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery/hl7:author/hl7:COCT_TP145102GB01.AssignedAuthor" priority="1000" mode="M8">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|report|authorPerson***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++jobRoleCode|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++jobRoleName|<axsl:text/><axsl:value-of select="hl7:code/@displayName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|<axsl:text/><axsl:value-of select="hl7:id[@root='1.2.826.0.1285.0.2.0.65']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension)&gt;0">+++profileId|<axsl:text/><axsl:value-of select="hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++prefix|<axsl:text/><axsl:value-of select="hl7:assignedAuthorPerson/hl7:name/hl7:prefix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++givenName1|<axsl:text/><axsl:value-of select="hl7:assignedAuthorPerson/hl7:name/hl7:given[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:assignedAuthorPerson/hl7:name/hl7:given[2])&gt;0">+++givenName2|<axsl:text/><axsl:value-of select="hl7:assignedAuthorPerson/hl7:name/hl7:given[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:assignedAuthorPerson/hl7:name/hl7:given[3])&gt;0">+++givenName3|<axsl:text/><axsl:value-of select="hl7:assignedAuthorPerson/hl7:name/hl7:given[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:assignedAuthorPerson/hl7:name/hl7:given[4])&gt;0">+++givenName4|<axsl:text/><axsl:value-of select="hl7:assignedAuthorPerson/hl7:name/hl7:given[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:assignedAuthorPerson/hl7:name/hl7:given[5])&gt;0">+++givenName5|<axsl:text/><axsl:value-of select="hl7:assignedAuthorPerson/hl7:name/hl7:given[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++familyName|<axsl:text/><axsl:value-of select="hl7:assignedAuthorPerson/hl7:name/hl7:family"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:assignedAuthorPerson/hl7:name/hl7:suffix)&gt;0">+++suffix|<axsl:text/><axsl:value-of select="hl7:assignedAuthorPerson/hl7:name/hl7:suffix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++orgCode|<axsl:text/><axsl:value-of select="hl7:representedOrganization/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++orgName|<axsl:text/><axsl:value-of select="hl7:representedOrganization/hl7:name"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN cpisAuthorDeviceChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery/hl7:author/hl7:COCT_TP145104GB01.System" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|authorDevice.systemID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:maintainingOrganization/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|authorDevice.orgCode***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:maintainingOrganization/hl7:name)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|authorDevice.orgName***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN cpisAuthorDeviceReport-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery/hl7:author/hl7:COCT_TP145104GB01.System" priority="1000" mode="M10">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|report|authorDevice***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++systemId|<axsl:text/><axsl:value-of select="hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++orgCode|<axsl:text/><axsl:value-of select="hl7:maintainingOrganization/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++orgName|<axsl:text/><axsl:value-of select="hl7:maintainingOrganization/hl7:name"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN cpisAuthorDeviceIndirectAuthorityChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery/hl7:author/hl7:COCT_TP145104GB01.System/hl7:indirectAuthority" priority="1000" mode="M11">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:superiorAssignedEntity/hl7:code/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|authorDevice.jobRoleCode***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:superiorAssignedEntity/hl7:code/@displayName)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|authorDevice.jobRoleName***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|authorDevice.assignedPersonName***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN cpisAuthorDeviceIndirectAuthorityReport-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:CP-ISQueryStub/hl7:cP-ISNHSQuery/hl7:author/hl7:COCT_TP145104GB01.System/hl7:indirectAuthority" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|report|indirectAuthority***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++jobRoleCode|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++jobRoleName|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:code/@displayName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++prefix|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:prefix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++givenName1|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[2])&gt;0">+++givenName2|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[3])&gt;0">+++givenName3|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[4])&gt;0">+++givenName4|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[5])&gt;0">+++givenName5|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:given[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++familyName|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:family"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:suffix)&gt;0">+++suffix|<axsl:text/><axsl:value-of select="hl7:superiorAssignedEntity/hl7:assignedPerson/hl7:name/hl7:suffix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN ReportMPSDetailsWSA-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Header" priority="1000" mode="M13">

		<!--REPORT -->
<axsl:if test="string-length(wsa:Action)&gt;0">***report|extractedActionName|<axsl:text/><axsl:value-of select="wsa:Action"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(wsa:MessageID)&gt;0">***report|wsaMessageID|<axsl:text/><axsl:value-of select="wsa:MessageID"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(wsa:From/wsa:Address)&gt;0">***report|wsaFrom|<axsl:text/><axsl:value-of select="wsa:From/wsa:Address"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template></axsl:stylesheet>
