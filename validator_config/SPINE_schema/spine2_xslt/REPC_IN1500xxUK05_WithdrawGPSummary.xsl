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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:MessageWithdrawal)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|hl7:MessageWithdrawal root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN payloadID-->


	<!--RULE -->
<axsl:template match="/*" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:interactionId)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|a single interactionID root and extension must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|payloadIDCode|<axsl:text/><axsl:value-of select="hl7:interactionId/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|payloadIDCodeSystem|<axsl:text/><axsl:value-of select="hl7:interactionId/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN CoreInformation-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:MessageWithdrawal" priority="1000" mode="M11">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:MessageWithdrawal/hl7:id/@root must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|eventID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code/@code)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:MessageWithdrawal/hl7:code/@code must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|eventTypeCode|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|eventTypeCodeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|eventTypeDisplayName|<axsl:text/><axsl:value-of select="hl7:code/@displayName"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|statusCode|active***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/@value)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single hl7:MessageWithdrawal/hl7:effectiveTime/@value must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|eventEffectiveTime|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget/hl7:patient/hl7:id/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single nhsNumber should be provided in hl7:MessageWithdrawal/hl7:recordTarget/hl7:patient/hl7:id/@extension***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumberCode|<axsl:text/><axsl:value-of select="hl7:recordTarget/hl7:patient/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumberCodeSystem|<axsl:text/><axsl:value-of select="hl7:recordTarget/hl7:patient/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reason/hl7:justifyingReason/hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.143']/@code)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single justifyingReason code of codeSystem 2.16.840.1.113883.2.1.3.2.4.17.143 should be provided in hl7:MessageWithdrawal/hl7:reason/hl7:justifyingReason/hl7:code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|withdrawingReasonCode|<axsl:text/><axsl:value-of select="hl7:reason/hl7:justifyingReason/hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|withdrawingReasonCodeSystem|<axsl:text/><axsl:value-of select="hl7:reason/hl7:justifyingReason/hl7:code/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|withdrawingReasonDisplayName|<axsl:text/><axsl:value-of select="hl7:reason/hl7:justifyingReason/hl7:code/@displayName"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reason/hl7:justifyingReason/hl7:text)=1"/><axsl:otherwise>***report|withdrawingReasonText|Not Provided in message***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:reason/hl7:justifyingReason/hl7:text)=1">***report|withdrawingReasonText|<axsl:text/><axsl:value-of select="hl7:reason/hl7:justifyingReason/hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN targetOf-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:MessageWithdrawal" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="count(hl7:subject/hl7:messageRef/hl7:id/@root)&gt;1">***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|zero or one replacementOf targets may be provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subject/hl7:messageRef/hl7:id/@root)=0">***report|targetOfRef|None***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subject/hl7:messageRef/hl7:id/@root)=1">***report|targetOfRef|<axsl:text/><axsl:value-of select="hl7:subject/hl7:messageRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN authorCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:MessageWithdrawal/hl7:author" priority="1000" mode="M13">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(*/hl7:agentPersonSDS)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single agentPersonSDS must be provided as the event author***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(*/hl7:agentPersonSDS)=count(*/hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension)"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single author roleProfileID attribute of root codeSystem 1.2.826.0.1285.0.2.0.67 must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(*/hl7:agentPersonSDS)=count(*/hl7:agentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.65']/@extension)"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_DOCUMENT_DATA|A single author personSDS ID attribute of root codeSystem 1.2.826.0.1285.0.2.0.65 must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN authorAgentPersonSDSReport-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:MessageWithdrawal/hl7:author/*/hl7:agentPersonSDS" priority="1000" mode="M14">

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
<axsl:if test="count(hl7:name/*)&gt;0">***report|author/structuredName/suffix|<axsl:text/><axsl:value-of select="hl7:name/hl7:suffix"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template></axsl:stylesheet>
