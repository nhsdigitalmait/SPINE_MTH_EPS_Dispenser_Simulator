<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/><axsl:apply-templates select="/" mode="M22"/><axsl:apply-templates select="/" mode="M23"/><axsl:apply-templates select="/" mode="M24"/><axsl:apply-templates select="/" mode="M25"/><axsl:apply-templates select="/" mode="M26"/><axsl:apply-templates select="/" mode="M27"/><axsl:apply-templates select="/" mode="M28"/><axsl:apply-templates select="/" mode="M29"/><axsl:apply-templates select="/" mode="M30"/><axsl:apply-templates select="/" mode="M31"/><axsl:apply-templates select="/" mode="M32"/><axsl:apply-templates select="/" mode="M33"/><axsl:apply-templates select="/" mode="M34"/><axsl:apply-templates select="/" mode="M35"/><axsl:apply-templates select="/" mode="M36"/><axsl:apply-templates select="/" mode="M37"/><axsl:apply-templates select="/" mode="M38"/><axsl:apply-templates select="/" mode="M39"/><axsl:apply-templates select="/" mode="M40"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN rootLevelCheck-->


	<!--RULE -->
<axsl:template match="/" priority="1000" mode="M3">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootLevelCheck:PdsRegistrationEvent]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN registrationEventCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]" priority="1000" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:subject/hl7:patient) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[registrationEventCheck:patient]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:author/hl7:registeringAuthority) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[registrationEventCheck:registeringAuthority]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation/hl7:pertinentIgnoreDuplicateRecordCriterion) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[registrationEventCheck:pertinentInformation]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN registeringAuthorityCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:author[1]/hl7:registeringAuthority" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.20']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[registeringAuthorityCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id[@root='2.16.840.1.113883.2.1.4.3']/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[registeringAuthorityCheck:id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN notificationScnCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:notificationID/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[notificationScnCheck:notificationID]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:serialChangeNumber/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[notificationScnCheck:serialChangeNumber]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:notificationStatus/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[notificationScnCheck:notificationStatus]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN ignoreDuplicateRecordCriterionCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:pertinentInformation[1]/hl7:pertinentIgnoreDuplicateRecordCriterion" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[ignoreDuplicateRecordCriterionCheck:value]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN patientCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:addr[@use='H']) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck:homeaddr]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not(count(hl7:addr) &gt; 2)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck:addr]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientPerson) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck:patientPerson]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:babyOf/hl7:obstetricCareProvision) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck:babyOf]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:subjectOf1/hl7:birthWeight) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck:birthWeight]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:subjectOf2/hl7:clinicalInformation) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck:clinicalInformation]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not(count(hl7:subjectOf4/hl7:deathNotification) &gt; 1)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck:deathNotification]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN patientPersonCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson" priority="1000" mode="M9"><axsl:variable name="birthTimeLength" select="string-length(hl7:birthTime/@value)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:administrativeGenderCode/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientPersonCheck:administrativeGenderCode]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$birthTimeLength &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientPersonCheck:birthTime]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$birthTimeLength = 0 or $birthTimeLength &gt;= 12"/><axsl:otherwise>***fault|ErrorBase1742.INSERT_BIRTH_MANDATORY_DATA_MISSING[BirthTime size incorrect]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not(count(hl7:deceasedTime) &gt; 1)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientPersonCheck:deceasedTime]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:ethnicGroupCode[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.6']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientPersonCheck:ethnicGroupCode]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:multipleBirthOrderNumber/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientPersonCheck:multipleBirthOrderNumber]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN deathNotificationCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf4[1]/hl7:deathNotification" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.35']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[deathNotificationCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.5']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[deathNotificationCheck:value]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN deathNotificationCrossCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]" priority="1000" mode="M11"><axsl:variable name="deceasedTime" select="count(hl7:patientPerson/hl7:deceasedTime)"/><axsl:variable name="deathNotification" select="count(hl7:subjectOf4[1]/hl7:deathNotification)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$deceasedTime=$deathNotification"/><axsl:otherwise>***fault|ErrorBase1742.INCONSISTENT_DEATH_UPDATE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN birthWeightCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf1[1]/hl7:birthWeight" priority="1000" mode="M12">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.15']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[birthWeightCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[birthWeightCheck:value]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value/@value)=4"/><axsl:otherwise>***fault|ErrorBase1742.INVALID_BIRTH_WEIGHT[babyTracingCheck.birthWeight]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN clinicalInformationCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf2[1]/hl7:clinicalInformation" priority="1000" mode="M13">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:component1/hl7:suspectedCongenitalAbnormality) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalInformationCheck:suspectedCongenitalAbnormality]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:component2/hl7:stillbirthIndicator) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalInformationCheck:stillBirthIndicator]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:component3/hl7:numberOfFoetusInConfinement) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalInformationCheck:numberOfFoetusInConfinement]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:component4/hl7:gestationAge) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalInformationCheck:gestationAge]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN suspectedCongenitalAbnormalityCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality" priority="1000" mode="M14">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.15']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[suspectedCongenitalAbnormalityCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.171']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[suspectedCongenitalAbnormalityCheck:value]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN stillbirthIndicatorCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component2/hl7:stillbirthIndicator" priority="1000" mode="M15">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.15']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[stillbirthIndicatorCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.172']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[stillbirthIndicatorCheck:value]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN numberOfFoetusInConfinementCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component3/hl7:numberOfFoetusInConfinement" priority="1000" mode="M16">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.15']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[numberOfFoetusInConfinementCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[numberOfFoetusInConfinementCheck:value]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN gestationAgeCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component4/hl7:gestationAge" priority="1000" mode="M17">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.15']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[gestationAgeCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value/@value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[gestationAgeCheck:value]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN obstetricCareProvisionCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:babyOf/hl7:obstetricCareProvision" priority="1000" mode="M18">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[obstetricCareProvisionCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:author/hl7:notifier/hl7:assignedNotifierPerson) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[obstetricCareProvisionCheck:assignedNotifierPerson]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:location/hl7:participantIdentifiedDeliveryLocation) = 1 or count(hl7:location/hl7:participantDeliveryLocation) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[obstetricCareProvisionCheck:participant]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:primaryInformationRecipient/hl7:partnerChildHealth/hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[obstetricCareProvisionCheck:partnerChildHealth]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget/hl7:mother) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[obstetricCareProvisionCheck:mother]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not(count(hl7:tracker/hl7:responsibleChildHealth) &gt; 1)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[obstetricCareProvisionCheck:responsibleChildHealth]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN deliveryLocationCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:babyOf/hl7:obstetricCareProvision/hl7:location/hl7:participantDeliveryLocation" priority="1000" mode="M19">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.173']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[deliveryLocationCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:locatedPlaceOfBirth) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[deliveryLocationCheck:locatedPlaceOfBirth]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:locatedPlaceOfBirth/hl7:addr) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[deliveryLocationCheck:placeOfBirth:addr]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not(count(hl7:locatedPlaceOfBirth/hl7:name) &gt; 1)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[deliveryLocationCheck:placeOfBirth:name]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template>

<!--PATTERN identifiedDeliveryLocationCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:babyOf/hl7:obstetricCareProvision/hl7:location/hl7:participantIdentifiedDeliveryLocation" priority="1000" mode="M20">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.173']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[identifiedDeliveryLocationCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[identifiedDeliveryLocationCheck:id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:locatedPlaceOfBirth) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[identifiedDeliveryLocationCheck:locatedPlaceOfBirth]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:locatedPlaceOfBirth/hl7:addr) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[identifiedDeliveryLocationCheck:placeOfBirth:addr]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:locatedPlaceOfBirth/hl7:name) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[identifiedDeliveryLocationCheck:placeOfBirth:name]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template>

<!--PATTERN notifierPersonCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:babyOf/hl7:obstetricCareProvision/hl7:author/hl7:notifier/hl7:assignedNotifierPerson" priority="1000" mode="M21">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:name) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[notifierPersonCheck:name]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template>

<!--PATTERN primaryCareProvisionCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:babyOf/hl7:obstetricCareProvision/hl7:recordTarget/hl7:mother/hl7:subjectOf/hl7:primaryCareProvision" priority="1000" mode="M22">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.37']/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[primaryCareProvisionCheck:code]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not(count(hl7:effectiveTime) &gt; 1)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[primaryCareProvisionCheck:effectiveTime]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:performer/hl7:primaryCareProvider/hl7:id[@root='2.16.840.1.113883.2.1.4.3']/@extension)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[primaryCareProvisionCheck:primaryCareProvider]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M22"/></axsl:template><axsl:template match="text()" priority="-1" mode="M22"/><axsl:template match="@*|node()" priority="-2" mode="M22"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M22"/></axsl:template>

<!--PATTERN motherCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:babyOf/hl7:obstetricCareProvision/hl7:recordTarget/hl7:mother" priority="1000" mode="M23">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientMotherPerson) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[motherCheck:patientMotherPerson]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:subjectOf/hl7:primaryCareProvision) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[motherCheck:primaryCareProvision]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M23"/></axsl:template><axsl:template match="text()" priority="-1" mode="M23"/><axsl:template match="@*|node()" priority="-2" mode="M23"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M23"/></axsl:template>

<!--PATTERN motherPersonCheck-->
<axsl:variable name="motherPath" select="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:babyOf/hl7:obstetricCareProvision/hl7:recordTarget/hl7:mother"/><axsl:variable name="motherNhsNumberPath" select="$motherPath/hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension"/><axsl:variable name="motherNhsNumberIsPresent" select="string-length($motherNhsNumberPath) &gt; 0"/>

	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:babyOf/hl7:obstetricCareProvision/hl7:recordTarget/hl7:mother/hl7:patientMotherPerson" priority="1000" mode="M24">

		<!--ASSERT -->
<axsl:choose><axsl:when test="$motherNhsNumberIsPresent or (string-length(hl7:birthTime/@value) &gt; 0)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[motherPersonCheck:birthTime]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:name) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[motherPersonCheck:name]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$motherNhsNumberIsPresent or (string-length(hl7:name/hl7:family) &gt; 0)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[motherPersonCheck:name.family]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$motherNhsNumberIsPresent or (string-length(hl7:name/hl7:given) &gt; 0)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[motherPersonCheck:name.given]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M24"/></axsl:template><axsl:template match="text()" priority="-1" mode="M24"/><axsl:template match="@*|node()" priority="-2" mode="M24"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M24"/></axsl:template>

<!--PATTERN patientPersonNameCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson" priority="1000" mode="M25">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:name) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientPersonCheck:name]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:name/hl7:family) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientPersonCheck:name.family]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:name/hl7:given[1]) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientPersonCheck:name.given]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M25"/></axsl:template><axsl:template match="text()" priority="-1" mode="M25"/><axsl:template match="@*|node()" priority="-2" mode="M25"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M25"/></axsl:template>

<!--PATTERN registeringAuthorityOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]" priority="1000" mode="M26">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|registeringAuthority***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regAuthorityType.code|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regAuthorityType.codeSystem|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regOrganisation.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regOrganisation.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="authorPersonID" select="hl7:author[1]/hl7:AgentPersonSDS[1]/hl7:agentPersonSDS[1]/hl7:id[1]/@extension"/>

		<!--REPORT -->
<axsl:if test="$authorPersonID">+++authorPersonID|<axsl:text/><axsl:value-of select="$authorPersonID"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++authorSystemID|<axsl:text/><axsl:value-of select="hl7:author1[1]/hl7:AgentSystemSDS[1]/hl7:agentSystemSDS[1]/hl7:id[1]/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathStatus|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf4[1]/hl7:deathNotification[1]/hl7:value[1]/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deceasedTime|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++overalUpdateMode|create+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M26"/></axsl:template><axsl:template match="text()" priority="-1" mode="M26"/><axsl:template match="@*|node()" priority="-2" mode="M26"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M26"/></axsl:template>

<!--PATTERN addressOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:addr" priority="1000" mode="M27">

		<!--REPORT -->
<axsl:if test="hl7:addressKey='0'">***warning|ErrorBase1742Extended.INVALID_VALUE|0|address.addressKey***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|address***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.postalCode|<axsl:text/><axsl:value-of select="hl7:postalCode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:addressKey='0')">+++address.addressKey|<axsl:text/><axsl:value-of select="hl7:addressKey"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.addr.line1|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.addr.line2|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.addr.line3|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.addr.line4|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.addr.line5|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.desc|<axsl:text/><axsl:value-of select="hl7:desc"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.effective.high|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.effective.low|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M27"/></axsl:template><axsl:template match="text()" priority="-1" mode="M27"/><axsl:template match="@*|node()" priority="-2" mode="M27"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M27"/></axsl:template>

<!--PATTERN telecomOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:telecom" priority="1000" mode="M28">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|telecom***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++telecom.tel|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++telecom.effective.high|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++telecom.effective.low|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M28"/></axsl:template><axsl:template match="text()" priority="-1" mode="M28"/><axsl:template match="@*|node()" priority="-2" mode="M28"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M28"/></axsl:template>

<!--PATTERN nameOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M29">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|name***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.prefix|<axsl:text/><axsl:value-of select="hl7:prefix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.suffix|<axsl:text/><axsl:value-of select="hl7:suffix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.givenName.name1|<axsl:text/><axsl:value-of select="hl7:given[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.givenName.name2|<axsl:text/><axsl:value-of select="hl7:given[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.givenName.name3|<axsl:text/><axsl:value-of select="hl7:given[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.givenName.name4|<axsl:text/><axsl:value-of select="hl7:given[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.givenName.name5|<axsl:text/><axsl:value-of select="hl7:given[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.familyName|<axsl:text/><axsl:value-of select="hl7:family"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.effective.high|<axsl:text/><axsl:value-of select="hl7:validTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++name.effective.low|<axsl:text/><axsl:value-of select="hl7:validTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M29"/></axsl:template><axsl:template match="text()" priority="-1" mode="M29"/><axsl:template match="@*|node()" priority="-2" mode="M29"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M29"/></axsl:template>

<!--PATTERN genderOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson[1]/hl7:administrativeGenderCode[1]" priority="1000" mode="M30">

		<!--REPORT -->
<axsl:if test="true()">***added|gender/gender.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M30"/></axsl:template><axsl:template match="text()" priority="-1" mode="M30"/><axsl:template match="@*|node()" priority="-2" mode="M30"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M30"/></axsl:template>

<!--PATTERN birthTimeOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson[1]/hl7:birthTime[1]" priority="1000" mode="M31">

		<!--REPORT -->
<axsl:if test="true()">***added|birthTime/birthTime.value|<axsl:text/><axsl:value-of select="substring(@value,1,12)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M31"/></axsl:template><axsl:template match="text()" priority="-1" mode="M31"/><axsl:template match="@*|node()" priority="-2" mode="M31"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M31"/></axsl:template>

<!--PATTERN deceasedTimeOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]" priority="1000" mode="M32">

		<!--REPORT -->
<axsl:if test="true()">***added|deceasedTime/deceasedTime.value|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M32"/></axsl:template><axsl:template match="text()" priority="-1" mode="M32"/><axsl:template match="@*|node()" priority="-2" mode="M32"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M32"/></axsl:template>

<!--PATTERN deathNotificationOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:subjectOf4/hl7:deathNotification" priority="1000" mode="M33">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|deathNotification***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.code.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.35+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.value.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.5+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M33"/></axsl:template><axsl:template match="text()" priority="-1" mode="M33"/><axsl:template match="@*|node()" priority="-2" mode="M33"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M33"/></axsl:template>

<!--PATTERN birthOrderOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson[1]/hl7:multipleBirthOrderNumber" priority="1000" mode="M34">

		<!--REPORT -->
<axsl:if test="true()">***added|birthOrder/birthOrder.value|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M34"/></axsl:template><axsl:template match="text()" priority="-1" mode="M34"/><axsl:template match="@*|node()" priority="-2" mode="M34"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M34"/></axsl:template>

<!--PATTERN previousNhsContactOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]" priority="1000" mode="M35">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|previousNhsContact***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.code|17+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.35+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.code|0+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.38+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M35"/></axsl:template><axsl:template match="text()" priority="-1" mode="M35"/><axsl:template match="@*|node()" priority="-2" mode="M35"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M35"/></axsl:template>

<!--PATTERN ethnicGroupOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]/hl7:patientPerson[1]/hl7:ethnicGroupCode" priority="1000" mode="M36">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|ethnicGroup***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++ethnicGroup.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++ethnicGroup.codeSystem|<axsl:text/><axsl:value-of select="@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M36"/></axsl:template><axsl:template match="text()" priority="-1" mode="M36"/><axsl:template match="@*|node()" priority="-2" mode="M36"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M36"/></axsl:template>

<!--PATTERN birthInformationOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]" priority="1000" mode="M37">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|birthInformation***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthWeight.code|<axsl:text/><axsl:value-of select="hl7:subjectOf1[1]/hl7:birthWeight/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthWeight.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf1[1]/hl7:birthWeight/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthWeight.value|<axsl:text/><axsl:value-of select="hl7:subjectOf1[1]/hl7:birthWeight/hl7:value/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.code.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.code.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality/hl7:code/hl7:qualifier/@code)=1">+++suspectedCongenitalAbnormality.qualifier.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality/hl7:code/hl7:qualifier/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality/hl7:code/hl7:qualifier/@codeSystem)=1">+++suspectedCongenitalAbnormality.qualifier.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality/hl7:code/hl7:qualifier/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.value.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality/hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.value.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component1/hl7:suspectedCongenitalAbnormality/hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++stillbirthIndicator.code.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component2/hl7:stillbirthIndicator/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++stillbirthIndicator.code.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component2/hl7:stillbirthIndicator/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++stillbirthIndicator.value.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component2/hl7:stillbirthIndicator/hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++stillbirthIndicator.value.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component2/hl7:stillbirthIndicator/hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++numberOfFoetusInConfinement.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component3/hl7:numberOfFoetusInConfinement/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++numberOfFoetusInConfinement.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component3/hl7:numberOfFoetusInConfinement/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++numberOfFoetusInConfinement.value|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component3/hl7:numberOfFoetusInConfinement/hl7:value/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++gestationAge.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component4/hl7:gestationAge/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++gestationAge.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component4/hl7:gestationAge/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++gestationAge.value|<axsl:text/><axsl:value-of select="hl7:subjectOf2[1]/hl7:clinicalInformation/hl7:component4/hl7:gestationAge/hl7:value/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.deliveryLocation.type.code|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.deliveryLocation.type.codeSystem|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="locationParticipant" select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:participantIdentifiedDeliveryLocation[1]/hl7:id"/>

		<!--REPORT -->
<axsl:if test="count($locationParticipant) = 1">+++placeOfBirth.deliveryLocation.id.root|<axsl:text/><axsl:value-of select="$locationParticipant/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count($locationParticipant) = 1">+++placeOfBirth.deliveryLocation.id.extension|<axsl:text/><axsl:value-of select="$locationParticipant/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="locationName" select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:name"/>

		<!--REPORT -->
<axsl:if test="$locationName">+++placeOfBirth.name|<axsl:text/><axsl:value-of select="$locationName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.addr.country.code|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:country/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.addr.country.codeSystem|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:country/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.addr.country.displayName|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:country/hl7:code/@displayName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.addr.county|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:county"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.addr.city|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:city"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notifier.familyName|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:author[1]/hl7:notifier[1]/hl7:assignedNotifierPerson[1]/hl7:name[1]/hl7:family"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notifier.givenName1|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:author[1]/hl7:notifier[1]/hl7:assignedNotifierPerson[1]/hl7:name[1]/hl7:given[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notifier.givenName2|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:author[1]/hl7:notifier[1]/hl7:assignedNotifierPerson[1]/hl7:name[1]/hl7:given[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="responsibleChildHealthId" select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:tracker/hl7:responsibleChildHealth[1]/hl7:id"/>

		<!--REPORT -->
<axsl:if test="$responsibleChildHealthId">+++responsibleChildHealth.id.root|<axsl:text/><axsl:value-of select="$responsibleChildHealthId/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$responsibleChildHealthId">+++responsibleChildHealth.id.extension|<axsl:text/><axsl:value-of select="$responsibleChildHealthId/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++partnerChildHealth.id.root|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:primaryInformationRecipient/hl7:partnerChildHealth[1]/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++partnerChildHealth.id.extension|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:primaryInformationRecipient/hl7:partnerChildHealth[1]/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="motherNhsNumber" select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:id"/>

		<!--REPORT -->
<axsl:if test="count($motherNhsNumber) = 1">+++mother.nhsNumber.root|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count($motherNhsNumber) = 1">+++mother.nhsNumber.extension|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="motherBirthTime" select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:patientMotherPerson[1]/hl7:birthTime"/>

		<!--REPORT -->
<axsl:if test="count($motherBirthTime) = 1">+++mother.birthTime|<axsl:text/><axsl:value-of select="substring(hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:patientMotherPerson[1]/hl7:birthTime/@value,1,8)"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="motherName" select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:patientMotherPerson[1]/hl7:name[1]"/>

		<!--REPORT -->
<axsl:if test="count($motherName/hl7:family) = 1">+++mother.familyName|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:patientMotherPerson[1]/hl7:name[1]/hl7:family"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count($motherName/hl7:given) &gt; 0">+++mother.givenName1|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:patientMotherPerson[1]/hl7:name[1]/hl7:given[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count($motherName/hl7:given) &gt; 1">+++mother.givenName2|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:patientMotherPerson[1]/hl7:name[1]/hl7:given[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++primaryCareProvision.code|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:subjectOf[1]/hl7:primaryCareProvision[1]/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++primaryCareProvision.codeSystem|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:subjectOf[1]/hl7:primaryCareProvision[1]/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++primaryCareProvision.effectiveTime.low|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:subjectOf[1]/hl7:primaryCareProvision[1]/hl7:effectiveTime[1]/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++primaryCareProvision.effectiveTime.high|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:subjectOf[1]/hl7:primaryCareProvision[1]/hl7:effectiveTime[1]/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++primaryCareProvision.performer.root|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:subjectOf[1]/hl7:primaryCareProvision[1]/hl7:performer[1]/hl7:primaryCareProvider[1]/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++primaryCareProvision.performer.extension|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:recordTarget[1]/hl7:mother[1]/hl7:subjectOf[1]/hl7:primaryCareProvision[1]/hl7:performer[1]/hl7:primaryCareProvider[1]/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M37"/></axsl:template><axsl:template match="text()" priority="-1" mode="M37"/><axsl:template match="@*|node()" priority="-2" mode="M37"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M37"/></axsl:template>

<!--PATTERN birthPlaceOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:subject[1]/hl7:patient[1]" priority="1000" mode="M38">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|birthplace***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthplace.city|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:city"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthplace.country.codeSystem|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:country/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthplace.country.code|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:country/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthplace.county|<axsl:text/><axsl:value-of select="hl7:babyOf[1]/hl7:obstetricCareProvision[1]/hl7:location[1]/hl7:*[1]/hl7:locatedPlaceOfBirth[1]/hl7:addr/hl7:county"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M38"/></axsl:template><axsl:template match="text()" priority="-1" mode="M38"/><axsl:template match="@*|node()" priority="-2" mode="M38"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M38"/></axsl:template>

<!--PATTERN notificationScnOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]" priority="1000" mode="M39">

		<!--REPORT -->
<axsl:if test="true()">***report|notificationID|<axsl:text/><axsl:value-of select="hl7:notificationID/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|serialChangeNumber|<axsl:text/><axsl:value-of select="hl7:serialChangeNumber/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|notificationStatus|<axsl:text/><axsl:value-of select="hl7:notificationStatus/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M39"/></axsl:template><axsl:template match="text()" priority="-1" mode="M39"/><axsl:template match="@*|node()" priority="-2" mode="M39"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M39"/></axsl:template>

<!--PATTERN ignoreDuplicateRecordCriterionOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationEvent[1]/hl7:pertinentInformation[1]/hl7:pertinentIgnoreDuplicateRecordCriterion" priority="1000" mode="M40">

		<!--REPORT -->
<axsl:if test="true()">***report|ignoreDuplicateRecordCriterion|<axsl:text/><axsl:value-of select="hl7:value/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M40"/></axsl:template><axsl:template match="text()" priority="-1" mode="M40"/><axsl:template match="@*|node()" priority="-2" mode="M40"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M40"/></axsl:template></axsl:stylesheet>
