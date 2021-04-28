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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/><axsl:apply-templates select="/" mode="M22"/><axsl:apply-templates select="/" mode="M23"/><axsl:apply-templates select="/" mode="M24"/><axsl:apply-templates select="/" mode="M25"/><axsl:apply-templates select="/" mode="M26"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:CancellationRequest)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:CancellationRequest root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN correctPatternRoots-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget/hl7:Patient)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:Patient root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation2/hl7:pertinentPrescriptionID)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:PrescriptionID not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation/hl7:pertinentCancellationReason)&gt;0"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|At least one cancellation reason must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation/hl7:pertinentCancellationReason)&gt;0">***report|cancellationCodeCount|<axsl:text/><axsl:value-of select="count(hl7:pertinentInformation/hl7:pertinentCancellationReason)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)&gt;1">***fault|ErrorBase1634.UNABLE_TO_PROCESS|Only a single line item may be cancelled***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)=1">***report|cancellationType|LineItem***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)=0">***report|cancellationType|Prescription***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN nhsNumberCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:recordTarget/hl7:Patient" priority="1000" mode="M11">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|NHSNumber missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root='2.16.840.1.113883.2.1.4.1'])=1">***report|nhsNumber|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN extractRootHL7ID-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/*" priority="1000" mode="M12">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single hl7:ID/@root must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|hl7EventID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN prescriptionIDCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation2/hl7:pertinentPrescriptionID" priority="1000" mode="M13">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|PrescriptionID missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">***report|prescriptionID|<axsl:text/><axsl:value-of select="hl7:value[@root='2.16.840.1.113883.2.1.3.2.4.18.8']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN cancellationTimeCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest" priority="1000" mode="M14">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime[@value])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Effective Time missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:effectiveTime[@value])=1">***report|cancellationTime|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN cancellationIDCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest" priority="1000" mode="M15">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|ID root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root])=1">***report|cancellationID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN cancellationReasonCheck1-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation[1]/hl7:pertinentCancellationReason" priority="1000" mode="M16">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Cancellation Reason Code 1 is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1">***report|cancellationCode1|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:text)=0"/><axsl:otherwise>***report|cancellationText1|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:text)=0">***report|cancellationText1|ReasonTextNotProvided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN cancellationReasonCheck2-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation[2]/hl7:pertinentCancellationReason" priority="1000" mode="M17">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Cancellation Reason Code 2 is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1">***report|cancellationCode2|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:text)=0"/><axsl:otherwise>***report|cancellationText2|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:text)=0">***report|cancellationText2|ReasonTextNotProvided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN cancellationReasonCheck3-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation[3]/hl7:pertinentCancellationReason" priority="1000" mode="M18">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Cancellation Reason Code 3 is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1">***report|cancellationCode3|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:text)=0"/><axsl:otherwise>***report|cancellationText3|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:text)=0">***report|cancellationText3|ReasonTextNotProvided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN cancellationReasonCheck4-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation[4]/hl7:pertinentCancellationReason" priority="1000" mode="M19">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Cancellation Reason Code 4 is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1">***report|cancellationCode4|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:text)=0"/><axsl:otherwise>***report|cancellationText4|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:text)=0">***report|cancellationText4|ReasonTextNotProvided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template>

<!--PATTERN cancellationReasonCheck5-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation[5]/hl7:pertinentCancellationReason" priority="1000" mode="M20">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Cancellation Reason Code 5 is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1">***report|cancellationCode5|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:text)=0"/><axsl:otherwise>***report|cancellationText5|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:text)=0">***report|cancellationText5|ReasonTextNotProvided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template>

<!--PATTERN cancellationReasonCheck6-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation[6]/hl7:pertinentCancellationReason" priority="1000" mode="M21">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Cancellation Reason Code 6 is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1">***report|cancellationCode6|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:text)=0"/><axsl:otherwise>***report|cancellationText6|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:text)=0">***report|cancellationText6|ReasonTextNotProvided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template>

<!--PATTERN cancellationReasonCheck7-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation[7]/hl7:pertinentCancellationReason" priority="1000" mode="M22">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Cancellation Reason Code 7 is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1">***report|cancellationCode7|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:text)=0"/><axsl:otherwise>***report|cancellationText7|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:text)=0">***report|cancellationText7|ReasonTextNotProvided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M22"/></axsl:template><axsl:template match="text()" priority="-1" mode="M22"/><axsl:template match="@*|node()" priority="-2" mode="M22"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M22"/></axsl:template>

<!--PATTERN cancellationReasonCheck8-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation[8]/hl7:pertinentCancellationReason" priority="1000" mode="M23">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Cancellation Reason Code 8 is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27'])=1">***report|cancellationCode8|<axsl:text/><axsl:value-of select="hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.27']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:text)=0"/><axsl:otherwise>***report|cancellationText8|<axsl:text/><axsl:value-of select="hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:text)=0">***report|cancellationText8|ReasonTextNotProvided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M23"/></axsl:template><axsl:template match="text()" priority="-1" mode="M23"/><axsl:template match="@*|node()" priority="-2" mode="M23"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M23"/></axsl:template>

<!--PATTERN lineItemCancellation-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:pertinentInformation1" priority="1000" mode="M24">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentLineItemRef/hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Line Item Reference is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentLineItemRef/hl7:id/@root)=1">***report|cancelLineItemRef|<axsl:text/><axsl:value-of select="hl7:pertinentLineItemRef/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M24"/></axsl:template><axsl:template match="text()" priority="-1" mode="M24"/><axsl:template match="@*|node()" priority="-2" mode="M24"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M24"/></axsl:template>

<!--PATTERN prescriptionCancellation-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest" priority="1000" mode="M25">

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1)=0">***report|cancelPrescriptionRef|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2/hl7:pertinentPrescriptionID/hl7:value/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M25"/></axsl:template><axsl:template match="text()" priority="-1" mode="M25"/><axsl:template match="@*|node()" priority="-2" mode="M25"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M25"/></axsl:template>

<!--PATTERN PatientInformationCheck-->


	<!--RULE -->
<axsl:template match="/hl7:PORX_IN030101UK32/hl7:ControlActEvent/hl7:subject/hl7:CancellationRequest/hl7:recordTarget/hl7:Patient" priority="1000" mode="M26">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:addr)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient address is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientPerson/hl7:name)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient name is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientPerson/hl7:administrativeGenderCode/@code)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient gender code is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientPerson/hl7:birthTime/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient birthtime is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M26"/></axsl:template><axsl:template match="text()" priority="-1" mode="M26"/><axsl:template match="@*|node()" priority="-2" mode="M26"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M26"/></axsl:template></axsl:stylesheet>
