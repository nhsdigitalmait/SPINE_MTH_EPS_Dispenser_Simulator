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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN540101UK31/hl7:ControlActEvent/hl7:subject" priority="1000" mode="M3">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:RebuildDispenseHistory)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:DispenseNotification root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN extractRootHL7ID-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/*" priority="1000" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single hl7:ID/@root must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|hl7EventID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN rootPrescriptionIDCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN540101UK31/hl7:ControlActEvent/hl7:subject/hl7:RebuildDispenseHistory/hl7:pertinentInformation1/hl7:pertinentPrescriptionID" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single PrescriptionID must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="(count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1 and string-length(hl7:value/@extension)=20) or (string-length(hl7:value/@root)=36) or (string-length(hl7:value/@root)=37)"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single PrescriptionID must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">***report|root_targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:value/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=0">***report|root_targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:value/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">***report|root_targetPrescriptionVersion|R2***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=0">***report|root_targetPrescriptionVersion|R1***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN withdrawalReasonCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN540101UK31/hl7:ControlActEvent/hl7:subject/hl7:RebuildDispenseHistory/hl7:pertinentInformation3/hl7:pertinentWithdrawReason" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value/@code)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single withdrawal reason must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value/@code)=1">***report|withdrawReason|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN repeatTargetInstance-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN540101UK31/hl7:ControlActEvent/hl7:subject/hl7:RebuildDispenseHistory/hl7:pertinentInformation2/hl7:pertinentRepeatInstanceInfo" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A valid repeat instance reference must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value/@value)=1">***report|targetInstance|<axsl:text/><axsl:value-of select="hl7:value/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN nonRepeatTargetInstance-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN540101UK31/hl7:ControlActEvent/hl7:subject/hl7:RebuildDispenseHistory" priority="1000" mode="M8">

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2/hl7:pertinentRepeatInstanceInfo)=0">***report|targetInstance|1***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN componentCount-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN540101UK31/hl7:ControlActEvent/hl7:subject/hl7:RebuildDispenseHistory" priority="1000" mode="M9">

		<!--REPORT -->
<axsl:if test="count(hl7:component/hl7:DispenseNotification)=0">***fault|ErrorBase1634.UNABLE_TO_PROCESS|At least one dispense notification must be provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|componentCount|<axsl:text/><axsl:value-of select="count(hl7:component/hl7:DispenseNotification)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN540101UK31/hl7:ControlActEvent/hl7:subject/hl7:RebuildDispenseHistory/hl7:component" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:sequenceNumber/@value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Sequence Number must be provided for all dispense components***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentSupplyHeader root not found for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentPrescriptionID root not found for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation3/hl7:pertinentPrescriptionStatus)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentPrescriptionStatus root not found for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:recordTarget/hl7:patient)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:Patient root not found for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:author/hl7:AgentPerson/hl7:representedOrganization/hl7:id/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|dispensingOrganization ID not found for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:id)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Dispense Notification ID missing for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single PrescriptionID must be provided for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="(count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1 and string-length(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value/@extension)=20) or (string-length(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value/@root)=36) or (string-length(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value/@root)=37)"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single PrescriptionID must be provided for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:effectiveTime/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Dispense Notification Timestamp must be provided for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:recordTarget/hl7:patient/hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|NHSNumber missing for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation3/hl7:pertinentPrescriptionStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.35']/@code)=4"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Prescription Status missing for dispenseNotification component <axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:replacementOf/hl7:priorMessageRef)=1">***fault|ErrorBase1634.UNABLE_TO_PROCESS|Amendment is not supported within rebuild dispense history***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;0"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|At least 1 SuppliedLineItem must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|report|DN_<axsl:text/><axsl:value-of select="hl7:sequenceNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:id)=1">+++dispenseNotificationID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++dispensingOrganization|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:author/hl7:AgentPerson/hl7:representedOrganization/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">+++targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=0">+++targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">+++targetPrescriptionVersion|R2+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation4/hl7:pertinentPrescriptionID/hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=0">+++targetPrescriptionVersion|R1+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:effectiveTime/@value)=1">+++dispenseNotificationTime|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:effectiveTime/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:recordTarget/hl7:patient/hl7:id[@root='2.16.840.1.113883.2.1.4.1'])=1">+++nhsNumber|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:recordTarget/hl7:patient/hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation3/hl7:pertinentPrescriptionStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.35']/@code)=4">+++prescriptionStatus|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation3/hl7:pertinentPrescriptionStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.35']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:repeatNumber/hl7:high/@value)=1">+++prescriptionRepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:repeatNumber/hl7:low/@value)=1">+++prescriptionRepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;0">+++totalLineItems|<axsl:text/><axsl:value-of select="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;0">+++lineItem1Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;0">+++lineItem1Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;0">+++dnLineItem1ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem1RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem1RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[1]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;1">+++lineItem2Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;1">+++lineItem2Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;1">+++dnLineItem2ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem2RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem2RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[2]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;2">+++lineItem3Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;2">+++lineItem3Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;2">+++dnLineItem3ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem3RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem3RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[3]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;3">+++lineItem4Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;3">+++lineItem4Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;3">+++dnLineItem4ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem4RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem4RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[4]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;4">+++lineItem5Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;4">+++lineItem5Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;4">+++dnLineItem5ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem5RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem5RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[5]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;5">+++lineItem6Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;5">+++lineItem6Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;5">+++dnLineItem6ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem6RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem6RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[6]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;6">+++lineItem7Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;6">+++lineItem7Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;6">+++dnLineItem7ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem7RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem7RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[7]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;7">+++lineItem8Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;7">+++lineItem8Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;7">+++dnLineItem8ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem8RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem8RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[8]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;8">+++lineItem9Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;8">+++lineItem9Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;8">+++dnLineItem9ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem9RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem9RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[9]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;9">+++lineItem10Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;9">+++lineItem10Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;9">+++dnLineItem10ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem10RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem10RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[10]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;10">+++lineItem11Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;10">+++lineItem11Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;10">+++dnLineItem11ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem11RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem11RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[11]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;11">+++lineItem12Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;11">+++lineItem12Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;11">+++dnLineItem12ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem12RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem12RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[12]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;12">+++lineItem13Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;12">+++lineItem13Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;12">+++dnLineItem13ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem13RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem13RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[13]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;13">+++lineItem14Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;13">+++lineItem14Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;13">+++dnLineItem14ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem14RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem14RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[14]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;14">+++lineItem15Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;14">+++lineItem15Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;14">+++dnLineItem15ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem15RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem15RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[15]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;15">+++lineItem16Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;15">+++lineItem16Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;15">+++dnLineItem16ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem16RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem16RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[16]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;16">+++lineItem17Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;16">+++lineItem17Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;16">+++dnLineItem17ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem17RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem17RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[17]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;17">+++lineItem18Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;17">+++lineItem18Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;17">+++dnLineItem18ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem18RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem18RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[18]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;18">+++lineItem19Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;18">+++lineItem19Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;18">+++dnLineItem19ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem19RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem19RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[19]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;19">+++lineItem20Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;19">+++lineItem20Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;19">+++dnLineItem20ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem20RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem20RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[20]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;20">+++lineItem21Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;20">+++lineItem21Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;20">+++dnLineItem21ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem21RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem21RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[21]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;21">+++lineItem22Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;21">+++lineItem22Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;21">+++dnLineItem22ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem22RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem22RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[22]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;22">+++lineItem23Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;22">+++lineItem23Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;22">+++dnLineItem23ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem23RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem23RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[23]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;23">+++lineItem24Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;23">+++lineItem24Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;23">+++dnLineItem24ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem24RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem24RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[24]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;24">+++lineItem25Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;24">+++lineItem25Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;24">+++dnLineItem25ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem25RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem25RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[25]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;25">+++lineItem26Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;25">+++lineItem26Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;25">+++dnLineItem26ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem26RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem26RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[26]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;26">+++lineItem27Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;26">+++lineItem27Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;26">+++dnLineItem27ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem27RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem27RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[27]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;27">+++lineItem28Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;27">+++lineItem28Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;27">+++dnLineItem28ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem28RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem28RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[28]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;28">+++lineItem29Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;28">+++lineItem29Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;28">+++dnLineItem29ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem29RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem29RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[29]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;29">+++lineItem30Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;29">+++lineItem30Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;29">+++dnLineItem30ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem30RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem30RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[30]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;30">+++lineItem31Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;30">+++lineItem31Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;30">+++dnLineItem31ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem31RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem31RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[31]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;31">+++lineItem32Status|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:pertinentInformation3/hl7:pertinentItemStatus/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.23']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;31">+++lineItem32Ref|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:inFulfillmentOf/hl7:priorOriginalItemRef/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1)&gt;31">+++dnLineItem32ID|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value)=1">+++dnLineItem32RepeatLow|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value)=1">+++dnLineItem32RepeatHigh|<axsl:text/><axsl:value-of select="hl7:DispenseNotification/hl7:pertinentInformation1/hl7:pertinentSupplyHeader/hl7:pertinentInformation1[32]/hl7:pertinentSuppliedLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template></axsl:stylesheet>
