<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:soap="http://www.w3.org/2001/12/soap-envelope" xmlns:nasp1="http://spine.nhs.uk/spine-servicev1.0" xmlns:nasp2="http://national.carerecords.nhs.uk/schema/" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/><axsl:apply-templates select="/" mode="M22"/><axsl:apply-templates select="/" mode="M23"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN rootCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload" priority="1000" mode="M3">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:babyTracing)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.babyTracing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:partnerChildHealth)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.partnerChildHealth]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:clinical)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.clinical]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:deliveryPlace)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.deliveryPlace]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:mothersDetails)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.mothersDetails]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:notifyingPerson)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.notifyingPerson]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:patient)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.patient]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:patientCareProvision)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.patientCareProvision]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:variable name="patientCareProvisionOrgIdCount" select="count(nasp2:patientCareProvision/nasp2:id/nasp2:extension)"/><axsl:variable name="patientCareProvisionOrgNameCount" select="count(nasp2:patientCareProvision/nasp2:practiceName)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$patientCareProvisionOrgIdCount + $patientCareProvisionOrgNameCount &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.patientCareProvision]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:variable name="patientCareProvSeniorPartnerIdCount" select="count(nasp2:patientCareProvision/nasp2:seniorPartnerCode/nasp2:extension)"/><axsl:variable name="patientCareProvSeniorPartnerNameCount" select="count(nasp2:patientCareProvision/nasp2:seniorPartnerName)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$patientCareProvSeniorPartnerIdCount + $patientCareProvSeniorPartnerNameCount &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.patientCareProvisionSeniorPartner]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:personAddress)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.personAddress]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:personName)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.personName]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:registeringAuthority)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[rootCheck.registeringAuthority]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN babyTracingCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:babyTracing" priority="1000" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:birthOrder)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[babyTracingCheck.birthOrder]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:birthWeight)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[babyTracingCheck.birthWeight]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:birthWeight)=4"/><axsl:otherwise>***fault|ErrorBase1742.INVALID_BIRTH_WEIGHT[babyTracingCheck.birthWeight]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN partnerChildHealthCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:partnerChildHealth" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:childHealthOrganisationCode/nasp2:root)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[partnerChildHealthCheck.childHealthOrganisationCode.root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:childHealthOrganisationCode/nasp2:extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[partnerChildHealthCheck.childHealthOrganisationCode.extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN clinicalCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:clinical" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:ethnicCategory)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalCheck.ethnicCategory]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:gestationAge)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalCheck.gestationAge]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:noOfBirthsInConfinement)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalCheck.noOfBirthsInConfinement]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:stillBornIndicator)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalCheck.stillBornIndicator]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:suspectedCongenitalAbnormality)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[clinicalCheck.suspectedCongenitalAbnormality]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN deliveryPlaceCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:deliveryPlace" priority="1000" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:deliveryPlaceType)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[deliveryPlaceCheck.deliveryPlaceType]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN mothersDetailsCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:mothersDetails" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:mothersFamilyName)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[motherCheck.mothersFamilyName]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:mothersGivenNames)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[motherCheck.mothersGivenNames]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN notifyingPersonCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:notifyingPerson" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:notifyingPersonFamilyName)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[notifyingPersonCheck.notifyingPersonFamilyName]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(nasp2:notifyingPersonGivenNames)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[notifyingPersonCheck.notifyingPersonGivenNames]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN patientCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:patient" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:administrativeGenderCode)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck.administrativeGenderCode]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:birthTime/nasp2:value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck.birthTime]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:id/nasp2:root)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck.root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:id/nasp2:extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[patientCheck.extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN registeringAuthorityCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:registeringAuthority" priority="1000" mode="M11">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:organisationId)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[registeringAuthorityCheck.organisationId]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(nasp2:type)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING[registeringAuthorityCheck.type]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN nhsNumberOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:patient/nasp2:id" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|report|nhsNumber***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++nhsNumber.root|<axsl:text/><axsl:value-of select="nasp2:root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++nhsNumber.extension|<axsl:text/><axsl:value-of select="nasp2:extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN registeringAuthorityOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload" priority="1000" mode="M13">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|registeringAuthority***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regAuthorityType.code|<axsl:text/><axsl:value-of select="nasp2:registeringAuthority/nasp2:type"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regAuthorityType.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.20+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regOrganisation.root|2.16.840.1.113883.2.1.4.3+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regOrganisation.extension|<axsl:text/><axsl:value-of select="nasp2:registeringAuthority/nasp2:organisationId"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++authorSystemID|<axsl:text/><axsl:value-of select="../../../soap:Header/nasp1:requestHeader/nasp1:orgAddressContext/nasp1:fromAC/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathStatus|<axsl:text/><axsl:value-of select="nasp2:deathNotification/nasp2:status"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deceasedTime|<axsl:text/><axsl:value-of select="nasp2:patient/nasp2:deceasedTime/nasp2:value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++overalUpdateMode|create+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN addressOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:personAddress" priority="1000" mode="M14">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|address***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++use|<axsl:text/><axsl:value-of select="nasp2:use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:postalCode)&gt;0">+++address.postalCode|<axsl:text/><axsl:value-of select="nasp2:postalCode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:addressKey)&gt;0">+++address.addressKey|<axsl:text/><axsl:value-of select="nasp2:addressKey"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:addressLine[1])&gt;0">+++address.addr.line1|<axsl:text/><axsl:value-of select="nasp2:addressLine[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:addressLine[2])&gt;0">+++address.addr.line2|<axsl:text/><axsl:value-of select="nasp2:addressLine[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:addressLine[3])&gt;0">+++address.addr.line3|<axsl:text/><axsl:value-of select="nasp2:addressLine[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:addressLine[4])&gt;0">+++address.addr.line4|<axsl:text/><axsl:value-of select="nasp2:addressLine[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:addressLine[5])&gt;0">+++address.addr.line5|<axsl:text/><axsl:value-of select="nasp2:addressLine[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:description)&gt;0">+++address.desc|<axsl:text/><axsl:value-of select="nasp2:description"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN nameOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:personName" priority="1000" mode="M15">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|name***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++use|<axsl:text/><axsl:value-of select="nasp2:use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:prefix)&gt;0">+++name.prefix|<axsl:text/><axsl:value-of select="nasp2:prefix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:suffix)&gt;0">+++name.suffix|<axsl:text/><axsl:value-of select="nasp2:suffix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:given[1])&gt;0">+++name.givenName.name1|<axsl:text/><axsl:value-of select="nasp2:given[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:given[2])&gt;0">+++name.givenName.name2|<axsl:text/><axsl:value-of select="nasp2:given[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:family)&gt;0">+++name.familyName|<axsl:text/><axsl:value-of select="nasp2:family"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN genderOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:patient/nasp2:administrativeGenderCode" priority="1000" mode="M16">

		<!--REPORT -->
<axsl:if test="true()">***added|gender/gender.code|<axsl:text/><axsl:value-of select="text()"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN birthTimeOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:patient/nasp2:birthTime" priority="1000" mode="M17">

		<!--REPORT -->
<axsl:if test="true()">***added|birthTime/birthTime.value|<axsl:text/><axsl:value-of select="substring(nasp2:value,1,12)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN deathDetailsCheck-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload" priority="1000" mode="M18"><axsl:variable name="deathStatusCount" select="count(nasp2:deathNotification/nasp2:status)"/><axsl:variable name="deathTimeCount" select="count(nasp2:patient/nasp2:deceasedTime/nasp2:value)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$deathStatusCount = $deathTimeCount"/><axsl:otherwise>***fault|ErrorBase1742.NN4B_INSERT_BIRTH_DEATH_STATUS_INCONSISTENT[deathDetailsCheck]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN deceasedTimeOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:patient/nasp2:deceasedTime" priority="1000" mode="M19">

		<!--REPORT -->
<axsl:if test="true()">***added|deceasedTime/deceasedTime.value|<axsl:text/><axsl:value-of select="nasp2:value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template>

<!--PATTERN deathNotificationOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:deathNotification" priority="1000" mode="M20">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|deathNotification***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.code.code|3+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.code.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.35+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.value.code|<axsl:text/><axsl:value-of select="nasp2:status"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.value.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.5+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template>

<!--PATTERN birthOrderOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:babyTracing/nasp2:birthOrder" priority="1000" mode="M21">

		<!--REPORT -->
<axsl:if test="true()">***added|birthOrder/birthOrder.value|<axsl:text/><axsl:value-of select="text()"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template>

<!--PATTERN ethnicGroupOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload/nasp2:clinical/nasp2:ethnicCategory" priority="1000" mode="M22">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|ethnicGroup***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++ethnicGroup.code|<axsl:text/><axsl:value-of select="text()"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++ethnicGroup.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.6+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M22"/></axsl:template><axsl:template match="text()" priority="-1" mode="M22"/><axsl:template match="@*|node()" priority="-2" mode="M22"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M22"/></axsl:template>

<!--PATTERN birthInformationOutput-->


	<!--RULE -->
<axsl:template match="/soap:Envelope/soap:Body/nasp1:servicePayload/nasp2:insertBirthRequestPayload" priority="1000" mode="M23">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|birthInformation***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthWeight.code|364589006+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthWeight.codeSystem|2.16.840.1.113883.2.1.3.2.4.15+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthWeight.value|<axsl:text/><axsl:value-of select="nasp2:babyTracing/nasp2:birthWeight"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.code.code|66091009+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.code.codeSystem|2.16.840.1.113883.2.1.3.2.4.15+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.qualifier.code|415684004+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.qualifier.codeSystem|2.16.840.1.113883.2.1.3.2.4.15+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.value.code|<axsl:text/><axsl:value-of select="nasp2:clinical/nasp2:suspectedCongenitalAbnormality"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++suspectedCongenitalAbnormality.value.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.171+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++stillbirthIndicator.code.code|237364002+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++stillbirthIndicator.code.codeSystem|2.16.840.1.113883.2.1.3.2.4.15+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++stillbirthIndicator.value.code|<axsl:text/><axsl:value-of select="nasp2:clinical/nasp2:stillBornIndicator"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++stillbirthIndicator.value.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.172+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++numberOfFoetusInConfinement.code|246435002+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++numberOfFoetusInConfinement.codeSystem|2.16.840.1.113883.2.1.3.2.4.15+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++numberOfFoetusInConfinement.value|<axsl:text/><axsl:value-of select="nasp2:clinical/nasp2:noOfBirthsInConfinement"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++gestationAge.code|268477000+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++gestationAge.codeSystem|2.16.840.1.113883.2.1.3.2.4.15+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++gestationAge.value|<axsl:text/><axsl:value-of select="nasp2:clinical/nasp2:gestationAge"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.deliveryLocation.type.code|<axsl:text/><axsl:value-of select="nasp2:deliveryPlace/nasp2:deliveryPlaceType"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++placeOfBirth.deliveryLocation.type.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.173+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:deliveryPlace/nasp2:deliveryPlaceCode)&gt;0">+++placeOfBirth.deliveryLocation.id.root|1.2.826.0.1285.0.1.10+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:deliveryPlace/nasp2:deliveryPlaceCode)&gt;0">+++placeOfBirth.deliveryLocation.id.extension|<axsl:text/><axsl:value-of select="nasp2:deliveryPlace/nasp2:deliveryPlaceCode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:deliveryPlace/nasp2:deliveryPlaceName)&gt;0">+++placeOfBirth.name|<axsl:text/><axsl:value-of select="nasp2:deliveryPlace/nasp2:deliveryPlaceName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notifier.familyName|<axsl:text/><axsl:value-of select="nasp2:notifyingPerson/nasp2:notifyingPersonFamilyName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notifier.givenName1|<axsl:text/><axsl:value-of select="nasp2:notifyingPerson/nasp2:notifyingPersonGivenNames[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:notifyingPerson/nasp2:notifyingPersonGivenNames[2])&gt;0">+++notifier.givenName2|<axsl:text/><axsl:value-of select="nasp2:notifyingPerson/nasp2:notifyingPersonGivenNames[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++partnerChildHealth.id.root|<axsl:text/><axsl:value-of select="nasp2:partnerChildHealth/nasp2:childHealthOrganisationCode/nasp2:root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++partnerChildHealth.id.extension|<axsl:text/><axsl:value-of select="nasp2:partnerChildHealth/nasp2:childHealthOrganisationCode/nasp2:extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++partnerChildHealth.isLegacy|<axsl:text/><axsl:value-of select="nasp2:partnerChildHealth/nasp2:partnerChildHealthIsLegacy"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++mother.nhsNumber.root|<axsl:text/><axsl:value-of select="nasp2:babyTracing/nasp2:mothersNHSNumber/nasp2:root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++mother.nhsNumber.extension|<axsl:text/><axsl:value-of select="nasp2:babyTracing/nasp2:mothersNHSNumber/nasp2:extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++mother.birthTime|<axsl:text/><axsl:value-of select="substring(nasp2:babyTracing/nasp2:mothersDOB/nasp2:value,1,8)"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++mother.familyName|<axsl:text/><axsl:value-of select="nasp2:mothersDetails/nasp2:mothersFamilyName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++mother.givenName1|<axsl:text/><axsl:value-of select="nasp2:mothersDetails/nasp2:mothersGivenNames[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:mothersDetails/nasp2:mothersGivenNames[2])&gt;0">+++mother.givenName2|<axsl:text/><axsl:value-of select="nasp2:mothersDetails/nasp2:mothersGivenNames[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:code)&gt;0">+++primaryCareProvision.code|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:code)&gt;0">+++primaryCareProvision.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.37+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:id/nasp2:root)&gt;0">+++primaryCareProvision.performer.root|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:id/nasp2:root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:id/nasp2:extension)&gt;0">+++primaryCareProvision.performer.extension|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:id/nasp2:extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:practiceAddress[1])&gt;0">+++primaryCareProvision.practiceAddress1|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:practiceAddress[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:practiceAddress[2])&gt;0">+++primaryCareProvision.practiceAddress2|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:practiceAddress[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:practiceAddress[3])&gt;0">+++primaryCareProvision.practiceAddress3|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:practiceAddress[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:practiceAddress[4])&gt;0">+++primaryCareProvision.practiceAddress4|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:practiceAddress[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:practiceAddress[5])&gt;0">+++primaryCareProvision.practiceAddress5|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:practiceAddress[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:practicePostCode)&gt;0">+++primaryCareProvision.practicePostCode|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:practicePostCode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:practiceName)&gt;0">+++primaryCareProvision.practiceName|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:practiceName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:seniorPartnerCode/nasp2:root)&gt;0">+++primaryCareProvision.seniorPartnerCode.root|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:seniorPartnerCode/nasp2:root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:seniorPartnerCode/nasp2:extension)&gt;0">+++primaryCareProvision.seniorPartnerCode.extension|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:seniorPartnerCode/nasp2:extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(nasp2:patientCareProvision/nasp2:seniorPartnerName)&gt;0">+++primaryCareProvision.seniorPartnerName|<axsl:text/><axsl:value-of select="nasp2:patientCareProvision/nasp2:seniorPartnerName"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M23"/></axsl:template><axsl:template match="text()" priority="-1" mode="M23"/><axsl:template match="@*|node()" priority="-2" mode="M23"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M23"/></axsl:template></axsl:stylesheet>
