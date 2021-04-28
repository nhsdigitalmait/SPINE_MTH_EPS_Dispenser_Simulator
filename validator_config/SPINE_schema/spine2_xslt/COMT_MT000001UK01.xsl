<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M1"/><axsl:apply-templates select="/" mode="M2"/><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN checkRoot-->


	<!--RULE -->
<axsl:template match="*" priority="1000" mode="M1">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:author/hl7:AgentPersonSDS)=1"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkRoot:agentPersonSDS]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:author1/hl7:AgentSystemSDS)=1"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkRoot:agentSystemSDS]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent)=1"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkRoot:alertEvent]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M1"/></axsl:template><axsl:template match="text()" priority="-1" mode="M1"/><axsl:template match="@*|node()" priority="-2" mode="M1"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M1"/></axsl:template>

<!--PATTERN checkAgentPerson-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:author/hl7:AgentPersonSDS" priority="1000" mode="M2">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentPersonSDS/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAgentPerson:id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M2"/></axsl:template><axsl:template match="text()" priority="-1" mode="M2"/><axsl:template match="@*|node()" priority="-2" mode="M2"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M2"/></axsl:template>

<!--PATTERN checkAgentSystem-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:author1/hl7:AgentSystemSDS" priority="1000" mode="M3">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentSystemSDS/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAgentSystem:id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN checkAlertEvent-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent" priority="1000" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:code:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@codeSystem)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:code:codeSystem]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:effectiveTime/@value)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:effectiveTime]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reason/hl7:justifyingReasonCoded)=1"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:justifyingReasonCoded]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not(count(hl7:reason1/hl7:justifyingReasonText)&gt;1)"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:justifyingReasonText]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not(count(hl7:component/hl7:notificationMessage)&gt;1)"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:notificationMessage]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget/hl7:patient)=1"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:patient]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:author/hl7:authorSDS)=1"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:authorSDS]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:device/hl7:assignedDeviceSDS)=1"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAlertEvent:assignedDeviceSDS]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN checkJustifyingReasonCoded-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:reason/hl7:justifyingReasonCoded" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkJustifyingReasonCoded:code:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@codeSystem)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkJustifyingReasonCoded:code:codeSystem]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkJustifyingReasonCoded:id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN checkJustifyingReasonText-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:reason1/hl7:justifyingReasonText" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkJustifyingReasonText:id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:text)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkJustifyingReasonText:text]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN checkNotificationMessage-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:component/hl7:notificationMessage" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkNotificationMessage:id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:text)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkNotificationMessage:text]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN checkPatient-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:recordTarget/hl7:patient" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension)=10"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkPatient:nhsNumber]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN checkAuthorSDS-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:author/hl7:authorSDS" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:representedOrganizationSDS/hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAuthorSDS:representedOrganizationSDS:id:root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:representedOrganizationSDS/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAuthorSDS:representedOrganizationSDS:id:extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:representedOrganizationSDS/hl7:name)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAuthorSDS:representedOrganizationSDS:name]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:assignedPerson/hl7:desc)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAuthorSDS:assignedPerson:desc]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:assignedPerson/hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAuthorSDS:assignedPerson:id:root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:assignedPerson/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAuthorSDS:assignedPerson:id:extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:assignedPerson/hl7:name)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAuthorSDS:assignedPerson:name]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN checkAssignedDeviceSDS-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:device/hl7:assignedDeviceSDS" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:assignedDevice/hl7:name)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.ALERT_INVALID_INPUT[checkAssignedDeviceSDS:name]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN reportAgentPerson-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:author/hl7:AgentPersonSDS" priority="1000" mode="M11">

		<!--REPORT -->
<axsl:if test="true()">***report|agentPersonSDS|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN reportAgentSystem-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:author1/hl7:AgentSystemSDS" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="true()">***report|agentSystemSDS|<axsl:text/><axsl:value-of select="hl7:agentSystemSDS/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN reportAlertEvent-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent" priority="1000" mode="M13">

		<!--REPORT -->
<axsl:if test="true()">***report|id|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|effectiveTime|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN reportJustifyingReasonCoded-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:reason/hl7:justifyingReasonCoded" priority="1000" mode="M14">

		<!--REPORT -->
<axsl:if test="true()">***report|justifyingReasonCoded|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN reportJustifyingReasonText-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:reason1/hl7:justifyingReasonText" priority="1000" mode="M15">

		<!--REPORT -->
<axsl:if test="true()">***report|justifyingReasonText|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN reportNotificationMessage-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:component/hl7:notificationMessage" priority="1000" mode="M16">

		<!--REPORT -->
<axsl:if test="true()">***report|notificationMessage|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN reportPatient-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:recordTarget/hl7:patient" priority="1000" mode="M17">

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumber|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN reportAuthorSDS-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:author/hl7:authorSDS" priority="1000" mode="M18">

		<!--REPORT -->
<axsl:if test="true()">***report|representedOrganizationSDS.id.root|<axsl:text/><axsl:value-of select="hl7:representedOrganizationSDS/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|representedOrganizationSDS.id.extension|<axsl:text/><axsl:value-of select="hl7:representedOrganizationSDS/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|representedOrganizationSDS.name|<axsl:text/><axsl:value-of select="hl7:representedOrganizationSDS/hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|assignedPerson.desc|<axsl:text/><axsl:value-of select="hl7:assignedPerson/hl7:desc"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|assignedPerson.id.root|<axsl:text/><axsl:value-of select="hl7:assignedPerson/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|assignedPerson.id.extension|<axsl:text/><axsl:value-of select="hl7:assignedPerson/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|assignedPerson.name|<axsl:text/><axsl:value-of select="hl7:assignedPerson/hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN reportAssignedDeviceSDS-->


	<!--RULE -->
<axsl:template match="/hl7:COMT_IN000001UK01/hl7:ControlActEvent/hl7:subject/hl7:AlertEvent/hl7:device/hl7:assignedDeviceSDS" priority="1000" mode="M19">

		<!--REPORT -->
<axsl:if test="true()">***report|assignedDevice.name|<axsl:text/><axsl:value-of select="hl7:assignedDevice/hl7:name"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template></axsl:stylesheet>
