<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M2"/><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/><axsl:apply-templates select="/" mode="M22"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN rootLevelCheck-->


	<!--RULE -->
<axsl:template match="*" priority="1000" mode="M2">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO|PDSRegistrationRequest.root***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest/hl7:subject/hl7:patientRole)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO|PDSRegistrationRequest.subject.patientRole***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M2"/></axsl:template><axsl:template match="text()" priority="-1" mode="M2"/><axsl:template match="@*|node()" priority="-2" mode="M2"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M2"/></axsl:template>

<!--PATTERN messageCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]" priority="1000" mode="M3"><axsl:variable name="isGenderPresent" select="count(hl7:subject/hl7:patientRole/hl7:patientPerson[1]/hl7:administrativeGenderCode)"/><axsl:variable name="isBirthTimePresent" select="count(hl7:subject/hl7:patientRole/hl7:patientPerson[1]/hl7:birthTime)"/><axsl:variable name="isAuthorPresent" select="count(hl7:author/hl7:registeringAuthority)"/><axsl:variable name="isPreviousNHSContact" select="count(hl7:subject/hl7:patientRole/hl7:subjectOf5/hl7:previousNhsContact)"/><axsl:variable name="isUsualNamePresent" select="count(hl7:subject/hl7:patientRole/hl7:patientPerson[1]/hl7:name[@use='L'])"/><axsl:variable name="isaddressPresent" select="count(hl7:subject/hl7:patientRole/hl7:addr)"/><axsl:variable name="regType" select="hl7:author/hl7:registeringAuthority/hl7:code/@code"/><axsl:variable name="primaryCareProvision" select="count(hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf/hl7:patientCareProvision/hl7:code[@code='1'])"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isGenderPresent=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO|gender***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isBirthTimePresent=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO|birthTime***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isAuthorPresent=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO|author***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isPreviousNHSContact=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO|previousNHSContact***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isUsualNamePresent=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO|patient.usualName***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isaddressPresent&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO|patient.address***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="$regType='x' and $primaryCareProvision=0">***warning|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN addressCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr" priority="1000" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:streetAddressLine)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.INCORRECT_NUMBER_OF_ADDRESS_LINES***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:streetAddressLine)&gt;5">***fault|ErrorBase1742.INCORRECT_NUMBER_OF_ADDRESS_LINES***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="(@use='TMP' and (count(hl7:desc)=1 or count(hl7:desc)=0)) or count(hl7:desc)=0"/><axsl:otherwise>***fault|ErrorBase1742.DESCRIPTION_PROVIDED_NO_TEMPORARY_ADDRESS***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:useablePeriod)=0 or count(hl7:useablePeriod)=1"/><axsl:otherwise>***fault|ErrorBase1742.MORE_THAN_ONE_USABLE_PERIOD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:useablePeriod/hl7:low)=0 or count(hl7:useablePeriod/hl7:high)=0 or hl7:useablePeriod/hl7:high/@value&gt;=hl7:useablePeriod/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN telecomCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:telecom" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNEXPECTED_CONTACT_TYPE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:useablePeriod)=0 or count(hl7:useablePeriod)=1"/><axsl:otherwise>***fault|ErrorBase1742.MORE_THAN_ONE_USABLE_PERIOD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:useablePeriod/hl7:low)=0 or count(hl7:useablePeriod/hl7:high)=0 or hl7:useablePeriod/hl7:high/@value &gt;= hl7:useablePeriod/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN nameCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:prefix)=0 or count(hl7:prefix)=1"/><axsl:otherwise>***fault|ErrorBase1742.NO_MORE_THAN_ONE_PREFIX***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:family)=0 or count(hl7:family)=1"/><axsl:otherwise>***fault|ErrorBase1742.NO_MORE_THAN_ONE_FAMILY_NAME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:suffix)=0 or count(hl7:suffix)=1"/><axsl:otherwise>***fault|ErrorBase1742.NO_MORE_THAN_ONE_SUFFIX***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="(count(hl7:given)+count(hl7:family))&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.INSUFFICIENT_NAME_DETAILS***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:given)&gt;5">***fault|ErrorBase1742.TOO_MANY_GIVEN_NAMES_5***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:validTime)=0 or count(hl7:validTime)=1"/><axsl:otherwise>***fault|ErrorBase1742.MORE_THAN_ONE_USABLE_PERIOD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:validTime/hl7:low)=0 or count(hl7:validTime/hl7:high)=0 or hl7:validTime/hl7:high/@value&gt;=hl7:validTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN pcProvisionCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvision" priority="1000" mode="M7"><axsl:variable name="provisionType" select="hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.37']/@code"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length($provisionType)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_PATIENT_CARE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:performer)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[patientCareProvision.performer]|patientCareProvision.performer***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:performer/hl7:assignedOrganisation/hl7:id[@root='2.16.840.1.113883.2.1.4.3'])=1"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_HCP_CODE_TYPE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime)=0 or ($provisionType='1' and count(hl7:effectiveTime)=1)"/><axsl:otherwise>***fault|ErrorBase1742.MORE_THAN_ONE_USABLE_PERIOD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/hl7:low)=0 or count(hl7:effectiveTime/hl7:high)=0 or hl7:effectiveTime/hl7:high/@value&gt;=hl7:effectiveTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN sharedSecretCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf4/hl7:sharedSecret[1]" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.35'])=1"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_CODE_FROM_SHARED_SECRET***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_VALUE_FROM_SHARED_SECRET***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN registeringAuthorityCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]" priority="1000" mode="M9"><axsl:variable name="nHAISRegistration" select="count(/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1[1]/hl7:nHAISRegistrationEvent)"/><axsl:variable name="isNHAIS" select="hl7:code/@code='y'"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isNHAIS or $nHAISRegistration=0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[registeringAuthority.nhaisRegistrationEvent]|registeringAuthority.nhaisRegistrationEvent***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="$isNHAIS and not(count(hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson)=1)">***fault|ErrorBase1742.ASSIGNED_REG_PERSON_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="(not($isNHAIS) and count(hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson)&gt;0)">***fault|ErrorBase1742.INVALID_ASSIGNED_REGISTERING_PERSON***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN authorCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]" priority="1000" mode="M10"><axsl:variable name="authorPersonID" select="hl7:author/hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:id/@extension"/><axsl:variable name="authorSystemID" select="hl7:author1/hl7:AgentSystemSDS/hl7:agentSystemSDS/hl7:id/@extension"/><axsl:variable name="deathStatus" select="hl7:subject/hl7:PdsRegistrationRequest/hl7:subject/hl7:patientRole/hl7:subjectOf7/hl7:deathNotification/hl7:value/@code"/><axsl:variable name="deceasedTime" select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]/@value"/><axsl:variable name="overalUpdateMode" select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]/@updateMode"/><axsl:variable name="hasRegisteringAuthority" select="count(hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1])&gt;0"/>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">***BEGIN-BLOCK|added|registeringAuthority***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regAuthorityType.code|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regAuthorityType.codeSystem|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regOrganisation.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regOrganisation.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@code='y'">+++regPerson.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@code='y'">+++regPerson.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++authorPersonID|<axsl:text/><axsl:value-of select="$authorPersonID"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++authorSystemID|<axsl:text/><axsl:value-of select="$authorSystemID"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++deathStatus|<axsl:text/><axsl:value-of select="$deathStatus"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++deceasedTime|<axsl:text/><axsl:value-of select="$deceasedTime"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++overalUpdateMode|create+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN addressTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr" priority="1000" mode="M11">

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
<axsl:if test="false()">+++address.desc|<axsl:text/><axsl:value-of select="hl7:desc"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.effective.high|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.effective.low|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN telecomTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:telecom" priority="1000" mode="M12">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN nameTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M13">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN pcProvisionTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvision" priority="1000" mode="M14">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|playedOtherProviderPatient***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.code|<axsl:text/><axsl:value-of select="hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.37']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.hcpCode|<axsl:text/><axsl:value-of select="hl7:performer/hl7:assignedOrganisation/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.hcpCodeSystem|<axsl:text/><axsl:value-of select="hl7:performer/hl7:assignedOrganisation/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.effective.high|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.effective.low|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN sharedSecretTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf4[@typeCode='SBJ']/hl7:sharedSecret[1]" priority="1000" mode="M15">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|sharedSecret***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++sharedSecret.code|<axsl:text/><axsl:value-of select="hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.35']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++sharedSecret.value|<axsl:text/><axsl:value-of select="hl7:value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN genderCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:administrativeGenderCode[1]" priority="1000" mode="M16">

		<!--REPORT -->
<axsl:if test="true()">***added|gender/gender.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN birthTimeCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:birthTime[1]" priority="1000" mode="M17">

		<!--REPORT -->
<axsl:if test="true()">***added|birthTime/birthTime.value|<axsl:text/><axsl:value-of select="substring(@value,1,12)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN languageOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:languageCommunication[1]" priority="1000" mode="M18">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|language***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++languageCode.code|<axsl:text/><axsl:value-of select="hl7:languageCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++proficiencyLevelCode.code|<axsl:text/><axsl:value-of select="hl7:proficiencyLevelCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++proficiencyLevelCode.codeSystem|<axsl:text/><axsl:value-of select="hl7:proficiencyLevelCode/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++preferenceInd.value|<axsl:text/><axsl:value-of select="hl7:preferenceInd/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN preferredWrittenCommunicationFormatOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf3[1]/hl7:preferredWrittenCommunicationFormat[1]" priority="1000" mode="M19">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|preferredWrittenCommunicationFormat***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.codeSystem|<axsl:text/><axsl:value-of select="hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M19"/></axsl:template>

<!--PATTERN preferredContactMethodOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf2[1]/hl7:preferredContactMethod[1]" priority="1000" mode="M20">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|preferredContactMethod***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.codeSystem|<axsl:text/><axsl:value-of select="hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++contactTimes.code|<axsl:text/><axsl:value-of select="hl7:pertinentInformation/hl7:pertinentPreferredContactTimes/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++contactTimes.codeSystem|<axsl:text/><axsl:value-of select="hl7:pertinentInformation/hl7:pertinentPreferredContactTimes/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++contactTimes.value|<axsl:text/><axsl:value-of select="hl7:pertinentInformation/hl7:pertinentPreferredContactTimes/hl7:value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M20"/></axsl:template>

<!--PATTERN previousNHSContact-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf5[1]/hl7:previousNhsContact[1]" priority="1000" mode="M21">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|previousNhsContact***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.codeSystem|<axsl:text/><axsl:value-of select="hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M21"/></axsl:template>

<!--PATTERN nHAISRegistrationEventOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1[1]/hl7:nHAISRegistrationEvent[1]" priority="1000" mode="M22">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|added|nHAISRegistrationEvent***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regType.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regType.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++custodian.extension|<axsl:text/><axsl:value-of select="hl7:custodian/hl7:assignedDevice/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++custodian.root|<axsl:text/><axsl:value-of select="hl7:custodian/hl7:assignedDevice/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++effective.low|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++effective.high|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M22"/></axsl:template><axsl:template match="text()" priority="-1" mode="M22"/><axsl:template match="@*|node()" priority="-2" mode="M22"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M22"/></axsl:template></axsl:stylesheet>
