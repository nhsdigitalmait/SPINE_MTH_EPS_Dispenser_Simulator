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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN BodyChecks-->


	<!--RULE -->
<axsl:template match="/*[1]" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id)=1 and string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_ID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:creationTime)=1 and string-length(hl7:creationTime/@value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_CREATION_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:versionCode)=1 and string-length(hl7:versionCode/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_VERSION_CODE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent)=1"/><axsl:otherwise>***fault|ErrorBase1732.INVALID_CONTROL_ACT***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent[1]/hl7:author)=0 or count(hl7:ControlActEvent[1]/hl7:author)=1"/><axsl:otherwise>***fault|ErrorBase1732.CONTROL_ACT_AUTHOR_INVALID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent[1]/hl7:author1)=1 or count(hl7:ControlActEvent[1]/hl7:author1)=2"/><axsl:otherwise>***fault|ErrorBase1732.CONTROL_ACT_AUTHOR_INVALID_CARDINALITY***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent[1]/hl7:query)=1 and count(hl7:ControlActEvent[1]/hl7:query/*)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.CONTROL_ACT_QUERY_INVALID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|messageID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|toASID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionRcv/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|fromASID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionSnd/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|creationTime|<axsl:text/><axsl:value-of select="hl7:creationTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN DissentOverride-->


	<!--RULE -->
<axsl:template match="/*[1]/hl7:ControlActEvent[1]/hl7:query" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:dissentOverride/hl7:value/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1733.MANDATORY_FIELD_MISSING|dissentOverride.value code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:dissentOverride/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.60']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_OID|DissentOverrideReasonCodeOID|<axsl:text/><axsl:value-of select="hl7:dissentOverride/hl7:value/@codeSystem"/><axsl:text/>|2.16.840.1.113883.2.1.3.2.4.17.60***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:dissentOverride/hl7:semanticsText) = 1"/><axsl:otherwise>***fault|ErrorBase1733.MANDATORY_FIELD_MISSING|dissentOverride.semanticsText***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|dissentOverrideReasonCode|<axsl:text/><axsl:value-of select="hl7:dissentOverride/hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|dissentOverrideDisplayName|<axsl:text/><axsl:value-of select="hl7:dissentOverride/hl7:value/@displayName"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|dissentOverrideOriginalText|<axsl:text/><axsl:value-of select="hl7:dissentOverride/hl7:value/hl7:originalText"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN NHSNumber-->


	<!--RULE -->
<axsl:template match="/*[1]/hl7:ControlActEvent[1]/hl7:query" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patient.id/hl7:value[@root='2.16.840.1.113883.2.1.4.1'])=1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_OID|PatientOID|<axsl:text/><axsl:value-of select="hl7:patient.id/hl7:value/@root"/><axsl:text/>|2.16.840.1.113883.2.1.4.1***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:patient.id/hl7:value/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|Patient Id***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patient.id/hl7:semanticsText) = 1"/><axsl:otherwise>***fault|ErrorBase1733.MANDATORY_FIELD_MISSING|patientID.semanticsText***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumber|<axsl:text/><axsl:value-of select="hl7:patient.id/hl7:value/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN ResponseType-->


	<!--RULE -->
<axsl:template match="/*[1]/hl7:ControlActEvent[1]/hl7:query" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:response.Type/hl7:value/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|Response Type***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:response.Type/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.10']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_OID|ResponseTypeOID|<axsl:text/><axsl:value-of select="hl7:response.Type/hl7:value/@codeSystem"/><axsl:text/>|2.16.840.1.113883.2.1.3.2.4.17.10***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:response.Type/hl7:semanticsText) &gt; 1"/><axsl:otherwise>***fault|ErrorBase1733.MANDATORY_FIELD_MISSING|response.Type.semanticsText***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|responseType|<axsl:text/><axsl:value-of select="hl7:response.Type/hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN TimePeriod-->


	<!--RULE -->
<axsl:template match="/*[1]/hl7:ControlActEvent[1]/hl7:query/hl7:time.Period" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value/hl7:effectiveTime/hl7:low/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|Start Date***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:semanticsText) &gt; 1"/><axsl:otherwise>***fault|ErrorBase1733.MANDATORY_FIELD_MISSING|timePeriod.semanticsText***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|timePeriodLow|<axsl:text/><axsl:value-of select="hl7:value/hl7:effectiveTime/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:value/hl7:effectiveTime/hl7:high/@value) &gt; 0">***report|timePeriodHigh|<axsl:text/><axsl:value-of select="hl7:value/hl7:effectiveTime/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN AuthorCheck-Person-->


	<!--RULE -->
<axsl:template match="/*[1]/hl7:ControlActEvent[1]/hl7:author[1]/hl7:AgentPersonSDS" priority="1000" mode="M11">

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root='1.2.826.0.1285.0.2.0.67'])=1">***report|agentPersonSDSRole|<axsl:text/><axsl:value-of select="hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:agentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.65'])=1">***report|agentPersonSDSPerson|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.65']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:part/hl7:partSDSRole/hl7:id[@root='1.2.826.0.1285.0.2.1.104'])=1">***report|agentPersonSDS|<axsl:text/><axsl:value-of select="hl7:part/hl7:partSDSRole/hl7:id[@root='1.2.826.0.1285.0.2.1.104']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN AuthorCheck-System1-->


	<!--RULE -->
<axsl:template match="/*[1]/hl7:ControlActEvent[1]/hl7:author1[1]/hl7:AgentSystemSDS/hl7:agentSystemSDS" priority="1000" mode="M12">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='1.2.826.0.1285.0.2.0.107'])=1 and string-length(hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.CONTROL_ACT_AUTHOR_AGENT_INVALID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root='1.2.826.0.1285.0.2.0.107'])=1">***report|agentSystemSDS1|<axsl:text/><axsl:value-of select="hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template></axsl:stylesheet>
