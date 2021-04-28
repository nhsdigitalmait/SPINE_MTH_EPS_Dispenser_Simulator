<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:DigSig="http://www.w3.org/2000/09/xmldsig#" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject" priority="1000" mode="M3">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ETPWithdraw)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:DispenseWithdraw root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN correctPatternRoots-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject/hl7:ETPWithdraw" priority="1000" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation5/hl7:pertinentWithdrawReason)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentWithdrawReason root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation2/hl7:pertinentWithdrawType)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentWithdrawType root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation3/hl7:pertinentWithdrawID)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentWithdrawID root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget/hl7:patient)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:patient root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:author)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:author root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="(hl7:pertinentInformation2/hl7:pertinentWithdrawType/hl7:value/@code='LD') and count(hl7:pertinentInformation4/hl7:pertinentDispenseNotificationRef)&gt;1">***fault|ErrorBase1634.UNABLE_TO_PROCESS|only a single dispense notification ref may be provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1/hl7:pertinentRepeatInstanceInfo)&gt;1">***fault|ErrorBase1634.UNABLE_TO_PROCESS|only a single repeat instance ref may be provided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN extractBasicInformation-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject/hl7:ETPWithdraw" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:id not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:effectiveTime not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|dispenseWithdrawID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|dispenseWithdrawTime|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN extractRootHL7ID-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/*" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single hl7:ID/@root must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|hl7EventID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN extractPatientInformation-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject/hl7:ETPWithdraw/hl7:recordTarget/hl7:patient" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='2.16.840.1.113883.2.1.4.1'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient NHS Number not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumber|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN extractPrescriptionInformation-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject/hl7:ETPWithdraw/hl7:pertinentInformation3/hl7:pertinentWithdrawID" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="(count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1 and string-length(hl7:value/@extension)=20) or (string-length(hl7:value/@root)=36) or (string-length(hl7:value/@root)=37)"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Withdraw ID (target prescription) not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">***report|targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:value/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=0">***report|targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:value/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">***report|targetPrescriptionVersion|R2***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=0">***report|targetPrescriptionVersion|R1***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN extractWithdrawType-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject/hl7:ETPWithdraw/hl7:pertinentInformation2/hl7:pertinentWithdrawType" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.109'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Withdraw Type not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|withdrawType|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN extractWithdrawReason-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject/hl7:ETPWithdraw/hl7:pertinentInformation5/hl7:pertinentWithdrawReason" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.110'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single Withdraw Reason must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|withdrawReason|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN extractOptionalRepeatInstanceRef-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject/hl7:ETPWithdraw/hl7:pertinentInformation1/hl7:pertinentRepeatInstanceInfo" priority="1000" mode="M11">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single repeat instance reference must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|targetInstance|<axsl:text/><axsl:value-of select="hl7:value/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN extractOptionalDispenseNotificationRef-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN510101UK31/hl7:ControlActEvent/hl7:subject/hl7:ETPWithdraw/hl7:pertinentInformation4/hl7:pertinentDispenseNotificationRef" priority="1000" mode="M12">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single Dispense Notification reference must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="../../hl7:pertinentInformation2/hl7:pertinentWithdrawType/hl7:value/@code='LD'">***report|dispenseNotificationRef|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template></axsl:stylesheet>
