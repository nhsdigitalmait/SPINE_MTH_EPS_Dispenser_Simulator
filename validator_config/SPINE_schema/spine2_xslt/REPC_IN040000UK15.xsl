<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:DigSig="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:hl7ebxml="urn:hl7-org:transport/ebXML/DSTUv1.0" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN BodyChecks-->


	<!--RULE -->
<axsl:template match="/*" priority="1000" mode="M9"><axsl:variable name="MessageGUID" select="hl7:id/@root"/><axsl:variable name="InteractionID" select="hl7:interactionId/@extension"/><axsl:variable name="SenderAsid" select="hl7:communicationFunctionSnd/hl7:device/hl7:id/@extension"/>

		<!--REPORT -->
<axsl:if test="string-length($MessageGUID)&gt;36">***fault|ErrorBase1712.UUID_TOO_LONG***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length($InteractionID)&gt;17">***fault|ErrorBase1712.INTERACTION_ID_TOO_LONG***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length($SenderAsid)&gt;12">***fault|ErrorBase1712.ACCREDITED_SYSTEM_ID_TOO_LONG***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id)=1 and string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|id or id root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:creationTime)=1 and string-length(hl7:creationTime/@value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|creationTime missing or blank***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:versionCode)=1 and string-length(hl7:versionCode/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|versionCode missing or blank***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionRcv/hl7:device/hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|communicationFunctionRcv ID root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionSnd/hl7:device/hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|communicationFunctionSnd ID root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent/hl7:subject/hl7:SCRequest)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|CreateRequest Root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|messageID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|hl7eventTime|<axsl:text/><axsl:value-of select="hl7:creationTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|toASID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionRcv/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|fromASID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionSnd/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN SCRequest-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN040000UK15/hl7:ControlActEvent/hl7:subject/hl7:SCRequest" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reasonCode) = 1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing reasonCode***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget) = 1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing recordTarget***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:author) = 1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing author***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[pertinentInformation]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reasonCode[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.22']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing reasonCode***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reasonCode/@code) = 1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing reasonCode***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|reasonCode.codeSystem|<axsl:text/><axsl:value-of select="hl7:reasonCode/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|reasonCode.code|<axsl:text/><axsl:value-of select="hl7:reasonCode/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN SCRequest.author AgentDeviceSDS or AgentPersonSDS-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN040000UK15/hl7:ControlActEvent/hl7:subject/hl7:SCRequest/hl7:author" priority="1000" mode="M11">

		<!--ASSERT -->
<axsl:choose><axsl:when test="(count(hl7:AgentDeviceSDS) + count(hl7:AgentPersonSDS) = 1)"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_ELEMENT***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN SCRequest.author.AgentDeviceSDS elements-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN040000UK15/hl7:ControlActEvent/hl7:subject/hl7:SCRequest/hl7:author/hl7:AgentDeviceSDS" priority="1000" mode="M12">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id) = 0 or count(hl7:id[@root='1.2.826.0.1285.0.2.0.107']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[agentDeviceSDS.id.root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id) = 0 or count(hl7:id/@extension) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[agentDeviceSDS.id.extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code) &lt; 2"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[agentDeviceSDS.code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentDeviceSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.107']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[agentDeviceSDS.agentDeviceSDS.id.root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentDeviceSDS/hl7:id/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[agentDeviceSDS.agentDeviceSDS.id.extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="string-length(hl7:id/@root) &gt; 0">***report|author.system.codeSystem|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:id/@extension) &gt; 0">***report|author.system.code|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:code/@code) &gt; 0">***report|author.system.roleProfile.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:code/@code) &gt; 0">***report|author.system.roleProfile.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:agentDeviceSDS/hl7:id/@root) &gt; 0">***report|author.system.device.codeSystem|<axsl:text/><axsl:value-of select="hl7:agentDeviceSDS/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:agentDeviceSDS/hl7:id/@extension) &gt; 0">***report|author.system.device.code|<axsl:text/><axsl:value-of select="hl7:agentDeviceSDS/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN SCRequest.author.AgentPersonSDS attributes-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN040000UK15/hl7:ControlActEvent/hl7:subject/hl7:SCRequest/hl7:author" priority="1000" mode="M13">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:AgentPersonSDS) = 0 or count(hl7:AgentPersonSDS) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[author.agentPersonSDS]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN SCRequest.author.AgentPersonSDS elements-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN040000UK15/hl7:ControlActEvent/hl7:subject/hl7:SCRequest/hl7:author/hl7:AgentPersonSDS" priority="1000" mode="M14">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='1.2.826.0.1285.0.2.0.67']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[author.agentPersonSDS.id.root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@extension) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[author.agentPersonSDS.id.extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.65']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[author.agentPersonSDS.agentPersonSDS.id.root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentPersonSDS/hl7:id/@extension) = 12"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[author.agentPersonSDS.agentPersonSDS.id.extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="string-length(hl7:id/@extension) &gt; 0">***report|author.person.roleProfile.code|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:id/@root) &gt; 0">***report|author.person.roleProfile.codeSystem|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:agentPersonSDS/hl7:id/@root) &gt; 0">***report|author.person.codeSystem|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:agentPersonSDS/hl7:id/@extension) &gt; 0">***report|author.person.code|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN SCRequest.recordTarget elements-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN040000UK15/hl7:ControlActEvent/hl7:subject/hl7:SCRequest/hl7:recordTarget" priority="1000" mode="M15">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patient/hl7:id[@root='2.16.840.1.113883.2.1.4.1']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_OID|PatientOID|<axsl:text/><axsl:value-of select="hl7:patient/hl7:id/@root"/><axsl:text/>|2.16.840.1.113883.2.1.4.1***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:patient/hl7:id/@extension) = 10"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[patient.id.extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumbereringScheme|<axsl:text/><axsl:value-of select="hl7:patient/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumberCode|<axsl:text/><axsl:value-of select="hl7:patient/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN SCRequest.pertinentInformation.pertinentLR attributes-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN040000UK15/hl7:ControlActEvent/hl7:subject/hl7:SCRequest/hl7:pertinentInformation" priority="1000" mode="M16">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentLR/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.3']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:pertinentLR/hl7:id/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[pertinentLR.id.extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="string-length(hl7:pertinentLR/hl7:id/@extension) &gt; 20">***fault|ErrorBase1712.INVALID_REQUEST[pertinentLR.id.extension]***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|pertinentInformation.pertinentLR.root|<axsl:text/><axsl:value-of select="hl7:pertinentLR/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|pertinentInformation.pertinentLR.extension|<axsl:text/><axsl:value-of select="hl7:pertinentLR/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template></axsl:stylesheet>
