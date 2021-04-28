<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:DigSig="http://www.w3.org/2000/09/xmldsig#" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN HeaderChecks-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Header[1]" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="wsa:MessageID and string-length(wsa:MessageID)=41"/><axsl:otherwise>***fault|ErrorBaseTms.SOAP_MESSAGE_ID_ERROR***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(wsa:Action)=1"/><axsl:otherwise>***fault|ErrorBaseTms.SOAP_ACTION_ERROR***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(wsa:To)=1 and string-length(wsa:To)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.SOAP_TO_ERROR***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionRcv[1]/hl7:device[1]/hl7:id[@root='1.2.826.0.1285.0.2.0.107'])=1 and string-length(hl7:communicationFunctionRcv[1]/hl7:device[1]/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.SOAP_COMM_FUNC_RCV_ERROR***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionSnd[1]/hl7:device[1]/hl7:id[@root='1.2.826.0.1285.0.2.0.107'])=1 and string-length(hl7:communicationFunctionSnd[1]/hl7:device[1]/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBaseTms.SOAP_COMM_FUNC_SND_ERROR***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|wsaID|<axsl:text/><axsl:value-of select="substring-after(wsa:MessageID,'uuid:')"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Body[1]/hl7:PORX_IN999000SM01/hl7:ControlActEvent/hl7:subject" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:prescriptionUpdateRequest)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:ParentPrescription root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN correctPatternRoots-->


	<!--RULE -->
<axsl:template match="hl7:PORX_IN999000SM01/hl7:ControlActEvent/hl7:subject/hl7:prescriptionUpdateRequest" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reference)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single Prescription Reference element must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:optionalItems)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single optionalItems element must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN agentInformationCheck-->


	<!--RULE -->
<axsl:template match="hl7:author/hl7:AgentPerson" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Agent Role Profile Code ID missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension)=1">***report|agentRoleProfileCodeId|<axsl:text/><axsl:value-of select="hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code[@codeSystem='1.2.826.0.1285.0.2.1.104']/@code)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Agent job role code missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:code[@codeSystem='1.2.826.0.1285.0.2.1.104']/@code)=1">***report|agentSdsRole|<axsl:text/><axsl:value-of select="hl7:code[@codeSystem='1.2.826.0.1285.0.2.1.104']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:telecom/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Agent telecom value missing or blank***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:Person/hl7:name)=1 or count(hl7:agentPerson/hl7:name)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Agent name is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentPerson/hl7:id[@root='1.2.826.0.1285.0.2.1.54']/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Dispenser ID missing or blank***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:agentPerson/hl7:id[@root='1.2.826.0.1285.0.2.1.54']/@extension)=1">***report|agentCode|<axsl:text/><axsl:value-of select="hl7:agentPerson/hl7:id[@root='1.2.826.0.1285.0.2.1.54']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN agentOrganisationCheck-->


	<!--RULE -->
<axsl:template match="hl7:author/hl7:AgentPerson/hl7:representedOrganization" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|representedOrganization ID missing or blank***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension)=1">***report|agentOrganization|<axsl:text/><axsl:value-of select="hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.94']/@code)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|representedOrganization type code is invalid***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:name)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|representedOrganization name is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:telecom/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|representedOrganization telecom is missing or blank***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:addr)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|representedOrganization address is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN prescriptionReference-->


	<!--RULE -->
<axsl:template match="hl7:PORX_IN999000SM01/hl7:ControlActEvent/hl7:subject/hl7:prescriptionUpdateRequest/hl7:reference" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:prescriptionID)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Prescription Reference is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:prescriptionID)=1">***report|targetPrescriptionID|<axsl:text/><axsl:value-of select="hl7:prescriptionID/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:prescriptionVersion)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Prescription Version is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:prescriptionVersion)=1">***report|targetPrescriptionVersion|<axsl:text/><axsl:value-of select="hl7:prescriptionVersion/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:currentInstance)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Current Instance must be provided, use 1 for Acute or Repeat Prescribe messages***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:currentInstance)=1">***report|currentInstance|<axsl:text/><axsl:value-of select="hl7:currentInstance/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN optionalItems-->


	<!--RULE -->
<axsl:template match="hl7:PORX_IN999000SM01/hl7:ControlActEvent/hl7:subject/hl7:prescriptionUpdateRequest/hl7:optionalItems" priority="1000" mode="M11">

		<!--REPORT -->
<axsl:if test="count(hl7:prescriptionStatus)=1">***report|prescriptionStatus|<axsl:text/><axsl:value-of select="hl7:prescriptionStatus/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:expiryDate)=1">***report|expiryDate|<axsl:text/><axsl:value-of select="hl7:expiryDate/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:nominatedPerformer)=1">***report|nominatedPerformer|<axsl:text/><axsl:value-of select="hl7:nominatedPerformer/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:dispenseWindowLowDate)=1">***report|dispenseWindowLowDate|<axsl:text/><axsl:value-of select="hl7:dispenseWindowLowDate/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lastDispenseDate)=1">***report|lastDispenseDate|<axsl:text/><axsl:value-of select="hl7:lastDispenseDate/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:dispensingOrganization/@value)=1">***report|dispensingOrganization|<axsl:text/><axsl:value-of select="hl7:dispensingOrganization/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:dispensingOrganization/@nullFlavor)=1">***report|dispensingOrgNullFlavor|<axsl:text/><axsl:value-of select="hl7:dispensingOrganization/@nullFlavor"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:nominatedDownloadDate)=1">***report|nominatedDownloadDate|<axsl:text/><axsl:value-of select="hl7:nominatedDownloadDate/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:completionDate)=1">***report|completionDate|<axsl:text/><axsl:value-of select="hl7:completionDate/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:claimSentDate)=1">***report|claimSentDate|<axsl:text/><axsl:value-of select="hl7:claimSentDate/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|totalLineItems|<axsl:text/><axsl:value-of select="count(hl7:lineItem)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN lineItemUpdates-->


	<!--RULE -->
<axsl:template match="hl7:PORX_IN999000SM01/hl7:ControlActEvent/hl7:subject/hl7:prescriptionUpdateRequest/hl7:optionalItems" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[1]/hl7:ref)=1">***report|lineItem1Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[1]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[1]/hl7:status)&gt;0">***report|lineItem1Status|<axsl:text/><axsl:value-of select="hl7:lineItem[1]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[2]/hl7:ref)=1">***report|lineItem2Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[2]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[2]/hl7:status)=1">***report|lineItem2Status|<axsl:text/><axsl:value-of select="hl7:lineItem[2]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[3]/hl7:ref)=1">***report|lineItem3Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[3]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[3]/hl7:status)=1">***report|lineItem3Status|<axsl:text/><axsl:value-of select="hl7:lineItem[3]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[4]/hl7:ref)=1">***report|lineItem4Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[4]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[4]/hl7:status)=1">***report|lineItem4Status|<axsl:text/><axsl:value-of select="hl7:lineItem[4]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[5]/hl7:ref)=1">***report|lineItem5Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[5]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[5]/hl7:status)=1">***report|lineItem5Status|<axsl:text/><axsl:value-of select="hl7:lineItem[5]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[6]/hl7:ref)=1">***report|lineItem6Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[6]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[6]/hl7:status)=1">***report|lineItem6Status|<axsl:text/><axsl:value-of select="hl7:lineItem[6]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[7]/hl7:ref)=1">***report|lineItem7Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[7]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[7]/hl7:status)=1">***report|lineItem7Status|<axsl:text/><axsl:value-of select="hl7:lineItem[7]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[8]/hl7:ref)=1">***report|lineItem8Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[8]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[8]/hl7:status)=1">***report|lineItem8Status|<axsl:text/><axsl:value-of select="hl7:lineItem[8]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[9]/hl7:ref)=1">***report|lineItem9Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[9]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[9]/hl7:status)=1">***report|lineItem9Status|<axsl:text/><axsl:value-of select="hl7:lineItem[9]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[10]/hl7:ref)=1">***report|lineItem10Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[10]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[10]/hl7:status)=1">***report|lineItem10Status|<axsl:text/><axsl:value-of select="hl7:lineItem[10]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[11]/hl7:ref)=1">***report|lineItem11Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[11]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[11]/hl7:status)=1">***report|lineItem11Status|<axsl:text/><axsl:value-of select="hl7:lineItem[11]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[12]/hl7:ref)=1">***report|lineItem12Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[12]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[12]/hl7:status)=1">***report|lineItem12Status|<axsl:text/><axsl:value-of select="hl7:lineItem[12]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[13]/hl7:ref)&gt;1">***report|lineItem13Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[13]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[13]/hl7:status)=1">***report|lineItem13Status|<axsl:text/><axsl:value-of select="hl7:lineItem[13]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[14]/hl7:ref)&gt;1">***report|lineItem14Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[14]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[14]/hl7:status)=1">***report|lineItem14Status|<axsl:text/><axsl:value-of select="hl7:lineItem[14]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[15]/hl7:ref)&gt;1">***report|lineItem15Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[15]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[15]/hl7:status)=1">***report|lineItem15Status|<axsl:text/><axsl:value-of select="hl7:lineItem[15]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[16]/hl7:ref)&gt;1">***report|lineItem16Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[16]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[16]/hl7:status)=1">***report|lineItem16Status|<axsl:text/><axsl:value-of select="hl7:lineItem[16]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[17]/hl7:ref)&gt;1">***report|lineItem17Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[17]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[17]/hl7:status)=1">***report|lineItem17Status|<axsl:text/><axsl:value-of select="hl7:lineItem[17]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[18]/hl7:ref)&gt;1">***report|lineItem18Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[18]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[18]/hl7:status)=1">***report|lineItem18Status|<axsl:text/><axsl:value-of select="hl7:lineItem[18]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[19]/hl7:ref)&gt;1">***report|lineItem19Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[19]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[19]/hl7:status)=1">***report|lineItem19Status|<axsl:text/><axsl:value-of select="hl7:lineItem[19]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[20]/hl7:ref)&gt;1">***report|lineItem20Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[20]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[20]/hl7:status)=1">***report|lineItem20Status|<axsl:text/><axsl:value-of select="hl7:lineItem[20]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[21]/hl7:ref)&gt;1">***report|lineItem21Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[21]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[21]/hl7:status)=1">***report|lineItem21Status|<axsl:text/><axsl:value-of select="hl7:lineItem[21]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[22]/hl7:ref)&gt;1">***report|lineItem22Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[22]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[22]/hl7:status)=1">***report|lineItem22Status|<axsl:text/><axsl:value-of select="hl7:lineItem[22]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[23]/hl7:ref)&gt;1">***report|lineItem23Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[23]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[23]/hl7:status)=1">***report|lineItem23Status|<axsl:text/><axsl:value-of select="hl7:lineItem[23]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[24]/hl7:ref)&gt;1">***report|lineItem24Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[24]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[24]/hl7:status)=1">***report|lineItem24Status|<axsl:text/><axsl:value-of select="hl7:lineItem[24]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[25]/hl7:ref)&gt;1">***report|lineItem25Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[25]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[25]/hl7:status)=1">***report|lineItem25Status|<axsl:text/><axsl:value-of select="hl7:lineItem[25]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[26]/hl7:ref)&gt;1">***report|lineItem26Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[26]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[26]/hl7:status)=1">***report|lineItem26Status|<axsl:text/><axsl:value-of select="hl7:lineItem[26]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[27]/hl7:ref)&gt;1">***report|lineItem27Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[27]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[27]/hl7:status)=1">***report|lineItem27Status|<axsl:text/><axsl:value-of select="hl7:lineItem[27]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[28]/hl7:ref)&gt;1">***report|lineItem28Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[28]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[28]/hl7:status)=1">***report|lineItem28Status|<axsl:text/><axsl:value-of select="hl7:lineItem[28]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[29]/hl7:ref)&gt;1">***report|lineItem29Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[29]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[29]/hl7:status)=1">***report|lineItem29Status|<axsl:text/><axsl:value-of select="hl7:lineItem[29]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[30]/hl7:ref)&gt;1">***report|lineItem30Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[30]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[30]/hl7:status)=1">***report|lineItem30Status|<axsl:text/><axsl:value-of select="hl7:lineItem[30]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[31]/hl7:ref)&gt;1">***report|lineItem31Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[31]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[31]/hl7:status)=1">***report|lineItem31Status|<axsl:text/><axsl:value-of select="hl7:lineItem[31]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[32]/hl7:ref)&gt;1">***report|lineItem32Ref|<axsl:text/><axsl:value-of select="hl7:lineItem[32]/hl7:ref/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:lineItem[32]/hl7:status)=1">***report|lineItem32Status|<axsl:text/><axsl:value-of select="hl7:lineItem[32]/hl7:status/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template></axsl:stylesheet>
