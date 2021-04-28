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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject" priority="1000" mode="M3">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:DispenseNotification root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN correctPatternRoots-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification" priority="1000" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1/hl7:pertinentSupplyHeader)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentSupplyHeader root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentPrescriptionID root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation3/hl7:pertinentPrescriptionStatus)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentPrescriptionStatus root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget/hl7:patient)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:Patient root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN extractRootHL7ID-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/*" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single hl7:ID/@root must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|hl7EventID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN prescriptionIDCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single PrescriptionID must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="(count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1 and string-length(hl7:value/@extension)=20) or (string-length(hl7:value/@root)=36) or (string-length(hl7:value/@root)=37)"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single PrescriptionID must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">***report|targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:value/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=0">***report|targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:value/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">***report|targetPrescriptionVersion|R2***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=0">***report|targetPrescriptionVersion|R1***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN dispenseNotificationIDCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Dispense Notification ID missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id)=1">***report|dispenseNotificationID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN PrescriptionTimeStamp-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Dispense Notification Timestamp must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:effectiveTime/@value)=1">***report|dispenseNotificationTime|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN nhsNumberCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification/hl7:recordTarget/hl7:patient" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|NHSNumber missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root='2.16.840.1.113883.2.1.4.1'])=1">***report|nhsNumber|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN PrescriptionStatusCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation3/hl7:pertinentPrescriptionStatus" priority="1000" mode="M10">

		<!--REPORT -->
<axsl:if test="string-length(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.35']/@code)=4">***report|prescriptionStatus|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.35']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN RepeatValidation-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader" priority="1000" mode="M11">

		<!--REPORT -->
<axsl:if test="count(hl7:repeatNumber/hl7:high/@value)=1">***report|prescriptionRepeatHigh|<axsl:text/><axsl:value-of select="hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:repeatNumber/hl7:low/@value)=1">***report|prescriptionRepeatLow|<axsl:text/><axsl:value-of select="hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN Amendment-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification/hl7:replacementOf/hl7:priorMessageRef" priority="1000" mode="M12">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|a single replacementOf target may be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@root)=36"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|replacementOf target must be a 36-character GUID***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|replacementOf|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN ItemCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN080101UK31/hl7:ControlActEvent/hl7:subject/hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader" priority="1000" mode="M13">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1)&gt;0"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|At least 1 SuppliedLineItem must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;0">***report|totalLineItems|<axsl:text/><axsl:value-of select="count(hl7:pertinentInformation1)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;0">***report|lineItem1Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;0">***report|lineItem1Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;0">***report|dnLineItem1ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem1RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem1RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;1">***report|lineItem2Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;1">***report|lineItem2Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;1">***report|dnLineItem2ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem2RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem2RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;2">***report|lineItem3Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;2">***report|lineItem3Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;2">***report|dnLineItem3ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem3RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem3RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;3">***report|lineItem4Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;3">***report|lineItem4Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;3">***report|dnLineItem4ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem4RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem4RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;4">***report|lineItem5Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;4">***report|lineItem5Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;4">***report|dnLineItem5ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem5RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem5RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;5">***report|lineItem6Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;5">***report|lineItem6Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;5">***report|dnLineItem6ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem6RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem6RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;6">***report|lineItem7Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;6">***report|lineItem7Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;6">***report|dnLineItem7ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem7RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem7RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;7">***report|lineItem8Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;7">***report|lineItem8Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;7">***report|dnLineItem8ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem8RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem8RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;8">***report|lineItem9Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;8">***report|lineItem9Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;8">***report|dnLineItem9ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem9RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem9RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;9">***report|lineItem10Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;9">***report|lineItem10Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;9">***report|dnLineItem10ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem10RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem10RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;10">***report|lineItem11Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;10">***report|lineItem11Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;10">***report|dnLineItem11ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem11RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem11RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;11">***report|lineItem12Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;11">***report|lineItem12Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;11">***report|dnLineItem12ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem12RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem12RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;12">***report|lineItem13Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;12">***report|lineItem13Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;12">***report|dnLineItem13ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem13RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem13RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;13">***report|lineItem14Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;13">***report|lineItem14Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;13">***report|dnLineItem14ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem14RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem14RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;14">***report|lineItem15Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;14">***report|lineItem15Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;14">***report|dnLineItem15ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem15RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem15RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;15">***report|lineItem16Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;15">***report|lineItem16Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;15">***report|dnLineItem16ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem16RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem16RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;16">***report|lineItem17Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;16">***report|lineItem17Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;16">***report|dnLineItem17ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem17RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem17RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;17">***report|lineItem18Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;17">***report|lineItem18Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;17">***report|dnLineItem18ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem18RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem18RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;18">***report|lineItem19Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;18">***report|lineItem19Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;18">***report|dnLineItem19ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem19RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem19RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;19">***report|lineItem20Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;19">***report|lineItem20Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;19">***report|dnLineItem20ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem20RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem20RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;20">***report|lineItem21Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;20">***report|lineItem21Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;20">***report|dnLineItem21ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem21RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem21RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;21">***report|lineItem22Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;21">***report|lineItem22Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;21">***report|dnLineItem22ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem22RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem22RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;22">***report|lineItem23Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;22">***report|lineItem23Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;22">***report|dnLineItem23ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem23RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem23RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;23">***report|lineItem24Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;23">***report|lineItem24Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;23">***report|dnLineItem24ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem24RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem24RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;24">***report|lineItem25Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;24">***report|lineItem25Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;24">***report|dnLineItem25ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem25RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem25RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;25">***report|lineItem26Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;25">***report|lineItem26Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;25">***report|dnLineItem26ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem26RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem26RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;26">***report|lineItem27Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;26">***report|lineItem27Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;26">***report|dnLineItem27ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem27RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem27RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;27">***report|lineItem28Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;27">***report|lineItem28Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;27">***report|dnLineItem28ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem28RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem28RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;28">***report|lineItem29Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;28">***report|lineItem29Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;28">***report|dnLineItem29ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem29RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem29RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;29">***report|lineItem30Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;29">***report|lineItem30Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;29">***report|dnLineItem30ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem30RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem30RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;30">***report|lineItem31Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;30">***report|lineItem31Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;30">***report|dnLineItem31ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem31RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem31RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;31">***report|lineItem32Status|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;31">***report|lineItem32Ref|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;31">***report|dnLineItem32ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">***report|dnLineItem32RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">***report|dnLineItem32RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template></axsl:stylesheet>
