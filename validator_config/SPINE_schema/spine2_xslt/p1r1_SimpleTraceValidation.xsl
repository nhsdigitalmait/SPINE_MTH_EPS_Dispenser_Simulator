<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN soapSchema-->


	<!--RULE -->
<axsl:template match="/" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(SOAP:Envelope)=1"/><axsl:otherwise>***fault|ErrorBaseTms.MESSAGE_NOT_WELL_FORMED[soapEnvelopeCount]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(SOAP:Envelope/SOAP:Header)=1"/><axsl:otherwise>***fault|ErrorBaseTms.MESSAGE_NOT_WELL_FORMED[soapHeaderCount]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(SOAP:Envelope/SOAP:Body)=1"/><axsl:otherwise>***fault|ErrorBaseTms.MESSAGE_NOT_WELL_FORMED[soapBodyCount]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN HeaderChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Header[1]/*[1]" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:interactionId[@root='2.16.840.1.113883.2.1.3.2.4.12'][@extension='QUPA_IN010000UK01'])=1"/><axsl:otherwise>***fault|ErrorBaseTms.INVALID_SOAP_INTERACTION_ID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root[1])=1 and string-length(hl7:id/@root[1])&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.INVALID_SOAP_ROOT***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionRcv[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension)=1 and string-length(hl7:communicationFunctionRcv[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.SOAP_NASP_COMM_FUNC_RCV_ERROR***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionSnd[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension)=1 and string-length(hl7:communicationFunctionSnd[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.SOAP_NASP_COMM_FUNC_SND_ERROR***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN BodyChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Body[1]/*[1]" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1 and string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_ID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:creationTime/@value)=1 and string-length(hl7:creationTime/@value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_CREATION_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:versionCode/@code)=1 and string-length(hl7:versionCode/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_VERSION_CODE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionRcv[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10'][1]/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_COMM_FUNC_RCV***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionSnd[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10'][1]/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_COMM_FUNC_SND***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:interactionId[@root='2.16.840.1.113883.2.1.3.2.4.12'][@extension='QUPA_IN010000UK01'])=1"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_EXTENSION***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActProcess/hl7:pdsTraceQuery/*)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.CONTROL_ACT_RETRIEVAL_QUERY_INVALID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActProcess//hl7:author/hl7:assignedEntity)"/><axsl:otherwise>***fault|pdsquery|0***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN HeaderToBodyCompare-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="SOAP:Body/*[1]/hl7:communicationFunctionRcv/hl7:device/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension=SOAP:Header/*[1]/hl7:communicationFunctionRcv[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension"/><axsl:otherwise>***fault|ErrorBase1732.INCONSISTENT_COMM_FUNC_RCV***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="SOAP:Body/*[1]/hl7:communicationFunctionSnd/hl7:device/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension=SOAP:Header/*[1]/hl7:communicationFunctionSnd[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension"/><axsl:otherwise>***fault|ErrorBase1732.INCONSISTENT_COMM_FUNC_SND***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="SOAP:Body/*[1]/hl7:id/@root=SOAP:Header[1]/*[1]/hl7:id/@root"/><axsl:otherwise>***fault|ErrorBase1732.INCONSISTENT_INTERACTION_ID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN AuthorAuthorChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Body[1]/*[1]/hl7:ControlActProcess/hl7:author/hl7:assignedEntity" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[1]/@extension)=1 and count(hl7:id[1]/@root)=1"/><axsl:otherwise>***fault|pdsquery|0***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code/@code)=1"/><axsl:otherwise>***fault|pdsquery|0***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:representedOrganization/hl7:id[1]/@extension)=1 and count(hl7:representedOrganization/hl7:id[1]/@root)=1"/><axsl:otherwise>***fault|pdsquery|0***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN HeaderChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Header[1]/*[1]" priority="1000" mode="M11">

		<!--REPORT -->
<axsl:if test="true()">***report|extractedActionName|urn:nhs:names:services:pds/QUPA_IN010000UK01***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|toSystemID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionRcv[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|fromSystemID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionSnd[1]/hl7:device[1]/hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.10']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN ReportMessageID-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Body[1]/*[1]/hl7:id" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="true()">***report|messageID|<axsl:text/><axsl:value-of select="@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN ReportAuthorAuthor-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Body[1]/*[1]/hl7:ControlActProcess/hl7:author/hl7:assignedEntity" priority="1000" mode="M13">

		<!--REPORT -->
<axsl:if test="true()">***report|agentPersonP1R1|<axsl:text/><axsl:value-of select="hl7:id[1]/@root"/><axsl:text/>:<axsl:text/><axsl:value-of select="hl7:id[1]/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|agentHCPTypeP1R1|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|agentSystemP1R1|<axsl:text/><axsl:value-of select="hl7:representedOrganization/hl7:id[1]/@root"/><axsl:text/>:<axsl:text/><axsl:value-of select="hl7:representedOrganization/hl7:id[1]/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:representedOrganization/hl7:code/@code)=1">***report|agentSystemTypeP1R1|<axsl:text/><axsl:value-of select="hl7:representedOrganization/hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN basicLayout-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/*/hl7:ControlActProcess" priority="1000" mode="M14">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pdsTraceQuery/hl7:person.birthTime/hl7:value/@value)=1"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_MANDATORY_SEARCH_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pdsTraceQuery/hl7:person.administrativeGenderCode/hl7:value)=1"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_MANDATORY_SEARCH_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pdsTraceQuery/hl7:person.name/hl7:value/hl7:family)=1"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_MANDATORY_SEARCH_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN administrativeGenderCodeCheck-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/*/hl7:ControlActProcess/hl7:pdsTraceQuery/hl7:person.administrativeGenderCode" priority="1000" mode="M15">

		<!--ASSERT -->
<axsl:choose><axsl:when test="hl7:value/@code='0' or hl7:value/@code='1' or hl7:value/@code='2' or hl7:value/@code='9'"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_MANDATORY_SEARCH_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|administrativeGenderCode|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN birthTimeCheck-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/*/hl7:ControlActProcess/hl7:pdsTraceQuery/hl7:person.birthTime" priority="1000" mode="M16">

		<!--REPORT -->
<axsl:if test="true()">***report|birthTime|<axsl:text/><axsl:value-of select="hl7:value/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN nameReport-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/*/hl7:ControlActProcess/hl7:pdsTraceQuery/hl7:person.name" priority="1000" mode="M17">

		<!--REPORT -->
<axsl:if test="true()">***report|name.family|<axsl:text/><axsl:value-of select="hl7:value/hl7:family"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|givenNameCount|<axsl:text/><axsl:value-of select="count(hl7:value/hl7:given)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/hl7:given[1]">***report|name.given|<axsl:text/><axsl:value-of select="hl7:value/hl7:given[1]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/hl7:given[2]">***report|name.otherGiven1|<axsl:text/><axsl:value-of select="hl7:value/hl7:given[2]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN deceasedTimeCheck-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/*/hl7:ControlActProcess/hl7:pdsTraceQuery/hl7:person.deceasedTime" priority="1000" mode="M18">

		<!--REPORT -->
<axsl:if test="true()">***report|deceasedTime|<axsl:text/><axsl:value-of select="hl7:value/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN addressReport-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope/SOAP:Body/*/hl7:ControlActProcess/hl7:pdsTraceQuery/hl7:person.address" priority="1000" mode="M19">

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:postalCode)=1">***report|address.postalCode|<axsl:text/><axsl:value-of select="hl7:value/hl7:postalCode"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:addressKey)=1">***report|address.addressKey|<axsl:text/><axsl:value-of select="hl7:value/hl7:addressKey"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template></axsl:stylesheet>
