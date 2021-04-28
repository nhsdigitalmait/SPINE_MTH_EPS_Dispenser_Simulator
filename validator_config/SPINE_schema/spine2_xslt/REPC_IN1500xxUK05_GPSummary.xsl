<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:DigSig="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:hl7ebxml="urn:hl7-org:transport/ebXML/DSTUv1.0" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:presText="xhtml:NPfIT:PresentationText" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/><axsl:apply-templates select="/" mode="M22"/><axsl:apply-templates select="/" mode="M23"/><axsl:apply-templates select="/" mode="M24"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:GPSummary)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|hl7:GPSummary root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*" mode="M10"/></axsl:template>

<!--PATTERN CoreInformation-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary" priority="1000" mode="M11">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:GPSummary/hl7:id/@root must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|eventID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code/@code)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:GPSummary/hl7:code/@code must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|eventTypeCode|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|eventTypeCodeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|eventTypeDisplayName|<axsl:text/><axsl:value-of select="hl7:code/@displayName"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:statusCode/@code)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:GPSummary/hl7:statusCode/@code must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|statusCode|<axsl:text/><axsl:value-of select="hl7:statusCode/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/@value)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:GPSummary/hl7:effectiveTime/@value must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|eventEffectiveTime|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget/hl7:patient/hl7:id/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single nhsNumber should be provided in hl7:GPSummary/hl7:recordTarget/hl7:patient/hl7:id/@extension***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumberCode|<axsl:text/><axsl:value-of select="hl7:recordTarget/hl7:patient/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumberCodeSystem|<axsl:text/><axsl:value-of select="hl7:recordTarget/hl7:patient/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*" mode="M11"/></axsl:template>

<!--PATTERN targetOf-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="count(hl7:replacementOf/hl7:priorMessageRef/hl7:id/@root)&gt;2">***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|zero or one replacementOf targets may be provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:replacementOf/hl7:priorMessageRef/hl7:id/@root)=1">***report|targetOfRef|<axsl:text/><axsl:value-of select="hl7:replacementOf/hl7:priorMessageRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*" mode="M12"/></axsl:template>

<!--PATTERN authorCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary/hl7:author" priority="1000" mode="M13">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:time/@value)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:GPSummary/hl7:author/hl7:time/@value must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(*/hl7:agentOrganizationSDS)+count(*/hl7:agentOrganization)+count(*/hl7:agentPersonSDS)+count(*/hl7:agentPerson)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|Either a single agentPersonSDS or agentOrganizationSDS must be provided as the event author***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(*/hl7:agentOrganizationSDS)=(count(*/hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension)+count(*/hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.109']/@extension))"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single organizationSDS ID attribute of root codeSystem 1.2.826.0.1285.0.1.10 or 1.2.826.0.1285.0.2.0.109 must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(*/hl7:agentPersonSDS)=count(*/hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension)"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single author roleProfileID attribute of root codeSystem 1.2.826.0.1285.0.2.0.67 must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(*/hl7:agentPersonSDS)=count(*/hl7:agentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.65']/@extension)"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single author personSDS ID attribute of root codeSystem 1.2.826.0.1285.0.2.0.65 must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*" mode="M13"/></axsl:template>

<!--PATTERN authorReport-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary/hl7:author" priority="1000" mode="M14">

		<!--REPORT -->
<axsl:if test="true()">***report|author/time|<axsl:text/><axsl:value-of select="hl7:time/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*" mode="M14"/></axsl:template>

<!--PATTERN authorAgentPersonSDSReport-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary/hl7:author/*/hl7:agentPersonSDS" priority="1000" mode="M15">

		<!--REPORT -->
<axsl:if test="true()">***report|author.type|agentPersonSDS***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/roleProfileIdCode|<axsl:text/><axsl:value-of select="../hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/roleProfileIdCodeSystem|<axsl:text/><axsl:value-of select="../hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/personIdCode|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/personIdCodeSystem|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:name)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single author Name must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)=0">***report|author/unstructuredName|<axsl:text/><axsl:value-of select="hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/familyName|<axsl:text/><axsl:value-of select="hl7:name/hl7:family"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/givenName1|<axsl:text/><axsl:value-of select="hl7:name/hl7:given[1]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/givenName2|<axsl:text/><axsl:value-of select="hl7:name/hl7:given[2]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/prefix|<axsl:text/><axsl:value-of select="hl7:name/hl7:prefix"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/suffix|<axsl:text/><axsl:value-of select="hl7:name/hl7:suffix"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*" mode="M15"/></axsl:template>

<!--PATTERN authorAgentPersonReport-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary/hl7:author/*/hl7:agentPerson" priority="1000" mode="M16">

		<!--REPORT -->
<axsl:if test="true()">***report|author.type|agentPerson***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/jobRoleCode|<axsl:text/><axsl:value-of select="../hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/jobRoleCodeSystem|<axsl:text/><axsl:value-of select="../hl7:code/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/jobRoleDescription|<axsl:text/><axsl:value-of select="../hl7:code/@displayName"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/addressUse|<axsl:text/><axsl:value-of select="../hl7:addr/@use"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/address|<axsl:text/><axsl:value-of select="../hl7:addr"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:name)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single author Name must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)=0">***report|author/unstructuredName|<axsl:text/><axsl:value-of select="hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/familyName|<axsl:text/><axsl:value-of select="hl7:name/hl7:family"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/givenName1|<axsl:text/><axsl:value-of select="hl7:name/hl7:given[1]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/givenName2|<axsl:text/><axsl:value-of select="hl7:name/hl7:given[2]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/prefix|<axsl:text/><axsl:value-of select="hl7:name/hl7:prefix"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/suffix|<axsl:text/><axsl:value-of select="hl7:name/hl7:suffix"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:code)=1">***report|author/representedScoperChoice/code/code|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:id)=1">***report|author/representedScoperChoice/id/root|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:id)=1">***report|author/representedScoperChoice/id/extension|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:name/*)=0">***report|author/representedScoperChoice/unstructuredName|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:name/*)&gt;0">***report|author/representedScoperChoice/structuredName/familyName|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:name/hl7:family"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:name/*)&gt;0">***report|author/representedScoperChoice/structuredName/givenName1|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:name/hl7:given[1]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:name/*)&gt;0">***report|author/representedScoperChoice/structuredName/givenName2|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:name/hl7:given[2]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:name/*)&gt;0">***report|author/representedScoperChoice/structuredName/prefix|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:name/hl7:prefix"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:name/*)&gt;0">***report|author/representedScoperChoice/structuredName/suffix|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:name/hl7:suffix"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*" mode="M16"/></axsl:template>

<!--PATTERN authorAgentOrganizationSDSReport-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary/hl7:author/*/hl7:agentOrganizationSDS" priority="1000" mode="M17">

		<!--REPORT -->
<axsl:if test="true()">***report|author.type|agentOrgSDS***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/idCode|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/idCodeSystem|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:name)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single author Name must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|author/unstructuredName|<axsl:text/><axsl:value-of select="hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="*" mode="M17"/></axsl:template>

<!--PATTERN authorAgentOrganizationReport-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary/hl7:author/*/hl7:agentOrganization" priority="1000" mode="M18">

		<!--REPORT -->
<axsl:if test="true()">***report|author.type|agentOrg***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/organizationRoleCode|<axsl:text/><axsl:value-of select="../hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/organizationRoleCodeSystem|<axsl:text/><axsl:value-of select="../hl7:code/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/organizationRoleDisplayName|<axsl:text/><axsl:value-of select="../hl7:code/@displayName"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/organizationCode|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/addressUse|<axsl:text/><axsl:value-of select="../hl7:addr/@use"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author/address|<axsl:text/><axsl:value-of select="../hl7:addr"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:name)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single author Name must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|author/unstructuredName|<axsl:text/><axsl:value-of select="hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:code)=1">***report|author/representedScoperChoice/code/code|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:id)=1">***report|author/representedScoperChoice/id/root|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1 and count(../hl7:representedScoperChoice/hl7:id)=1">***report|author/representedScoperChoice/id/extension|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(../hl7:representedScoperChoice)=1">***report|author/representedScoperChoice/unstructuredName|<axsl:text/><axsl:value-of select="../hl7:representedScoperChoice/hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="*" mode="M18"/></axsl:template>

<!--PATTERN nhsNumberCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary/hl7:author" priority="1000" mode="M19">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:time/@value)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:GPSummary/hl7:author/hl7:time/@value must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="*" mode="M19"/></axsl:template>

<!--PATTERN enrichedContentCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:GPSummary" priority="1000" mode="M20">

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144036UK01.AlcoholIntake/hl7:id/@root)&gt;0">***report|AlcoholIntake|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144036UK01.LifeStyle/hl7:id/@root)&gt;0">***report|LifeStyle|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144036UK01.Smoking/hl7:id/@root)&gt;0">***report|Smoking|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144036UK01.SocialOrPersonalCircumstance/hl7:id/@root)&gt;0">***report|SocialOrPersonalCircumstance|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144041UK01.RiskToPerson/hl7:id/@root)&gt;0">***report|RiskToPerson|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144046UK01.PersonalPreference/hl7:id/@root)&gt;0">***report|PersonalPreference|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144047UK01.Service/hl7:id/@root)&gt;0">***report|Service|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144049UK01.ProvisionOfAdviceAndInformation/hl7:id/@root)&gt;0">***report|ProvisionOfAdviceAndInformation|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144050UK01.AdministrativeProcedure/hl7:id/@root)&gt;0">***report|AdministrativeProcedure|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144054UK01.RiskToPatient/hl7:id/@root)&gt;0">***report|RiskToPatient|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144040UK01.AcuteMedication/hl7:id/@root)&gt;0">***report|AcuteMedication|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144040UK01.CurrentRepeatMedication/hl7:id/@root)&gt;0">***report|CurrentRepeatMedication|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144040UK01.DiscontinuedRepeatMedication/hl7:id/@root)&gt;0">***report|DiscontinuedRepeatMedication|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144040UK01.MedicationAdministration/hl7:id/@root)&gt;0">***report|MedicationAdministration|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144053UK02.Allergy/hl7:id/@root)&gt;0">***report|Allergy|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144035UK01.CareProfessionalDocumentation/hl7:id/@root)&gt;0">***report|CareProfessionalDocumentation|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144035UK01.PatientCarerCorrespondence/hl7:id/@root)&gt;0">***report|PatientCarerCorrespondence|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144035UK01.ThirdPartyCorrespondence/hl7:id/@root)&gt;0">***report|ThirdPartyCorrespondence|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144037UK01.CareEvent/hl7:id/@root)&gt;0">***report|CareEvent|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144038UK02.Problem/hl7:id/@root)&gt;0">***report|Problem|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144042UK01.Diagnosis/hl7:id/@root)&gt;0">***report|Diagnosis|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144043UK02.BloodPressure/hl7:id/@root)&gt;0">***report|BloodPressure|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144043UK02.Finding/hl7:id/@root)&gt;0">***report|Finding|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144043UK02.FindingOrganizer/hl7:id/@root)&gt;0">***report|FindingOrganizer|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144043UK02.Height/hl7:id/@root)&gt;0">***report|Height|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144043UK02.Temperature/hl7:id/@root)&gt;0">***report|Temperature|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144043UK02.Weight/hl7:id/@root)&gt;0">***report|Weight|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144044UK01.FamilyHistory/hl7:id/@root)&gt;0">***report|FamilyHistory|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144045UK01.Investigation/hl7:id/@root)&gt;0">***report|Investigation|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144048UK01.AllergyDE/hl7:id/@root)&gt;0">***report|AllergyDE|True***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentCREType/hl7:component/hl7:UKCT_MT144055UK01.Treatment/hl7:id/@root)&gt;0">***report|Treatment|True***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="*" mode="M20"/></axsl:template>

<!--PATTERN DissentToStore_CASE1-->


	<!--RULE -->
<axsl:template match="//presText:td[contains(.,'Refused consent for upload to national shared electronic record')]" priority="1003" mode="M21">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE1a***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M21"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h1[contains(.,'Refused consent for upload to national shared electronic record')]" priority="1002" mode="M21">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE1b***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M21"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h2[contains(.,'Refused consent for upload to national shared electronic record')]" priority="1001" mode="M21">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE1c***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M21"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h3[contains(.,'Refused consent for upload to national shared electronic record')]" priority="1000" mode="M21">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|ISOFT***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="*" mode="M21"/></axsl:template>

<!--PATTERN DissentToStore_CASE2-->


	<!--RULE -->
<axsl:template match="//presText:td[contains(.,'Following discussion with a member of the practice staff this patient has chosen not to store their clinical information')]" priority="1003" mode="M22">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE2a***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M22"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h1[contains(.,'Following discussion with a member of the practice staff this patient has chosen not to store their clinical information')]" priority="1002" mode="M22">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE2b***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M22"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h2[contains(.,'Following discussion with a member of the practice staff this patient has chosen not to store their clinical information')]" priority="1001" mode="M22">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE2c***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M22"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h3[contains(.,'Following discussion with a member of the practice staff this patient has chosen not to store their clinical information')]" priority="1000" mode="M22">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|Standard***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M22"/></axsl:template><axsl:template match="text()" priority="-1" mode="M22"/><axsl:template match="@*|node()" priority="-2" mode="M22"><axsl:apply-templates select="*" mode="M22"/></axsl:template>

<!--PATTERN DissentToStore_CASE3-->


	<!--RULE -->
<axsl:template match="//presText:td[contains(.,'After discussions with a member of the practice staff this patient has chosen not to have a Summary Care Record')]" priority="1003" mode="M23">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE3a***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M23"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h1[contains(.,'After discussions with a member of the practice staff this patient has chosen not to have a Summary Care Record')]" priority="1002" mode="M23">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE3b***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M23"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h2[contains(.,'After discussions with a member of the practice staff this patient has chosen not to have a Summary Care Record')]" priority="1001" mode="M23">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|CASE3c***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M23"/></axsl:template>

	<!--RULE -->
<axsl:template match="//presText:h3[contains(.,'After discussions with a member of the practice staff this patient has chosen not to have a Summary Care Record')]" priority="1000" mode="M23">

		<!--REPORT -->
<axsl:if test="true()">***report|dissentToStore|INPS***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M23"/></axsl:template><axsl:template match="text()" priority="-1" mode="M23"/><axsl:template match="@*|node()" priority="-2" mode="M23"><axsl:apply-templates select="*" mode="M23"/></axsl:template>

<!--PATTERN NoSignificantContent-->


	<!--RULE -->
<axsl:template match="//presText:h3[contains(.,'The practice holds no significant data on this patient')]" priority="1000" mode="M24">

		<!--REPORT -->
<axsl:if test="true()">***report|noSignificantContent|standard***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*" mode="M24"/></axsl:template><axsl:template match="text()" priority="-1" mode="M24"/><axsl:template match="@*|node()" priority="-2" mode="M24"><axsl:apply-templates select="*" mode="M24"/></axsl:template></axsl:stylesheet>
