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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M2"/><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/><axsl:apply-templates select="/" mode="M22"/><axsl:apply-templates select="/" mode="M23"/><axsl:apply-templates select="/" mode="M24"/><axsl:apply-templates select="/" mode="M25"/><axsl:apply-templates select="/" mode="M26"/><axsl:apply-templates select="/" mode="M27"/><axsl:apply-templates select="/" mode="M28"/><axsl:apply-templates select="/" mode="M29"/><axsl:apply-templates select="/" mode="M30"/><axsl:apply-templates select="/" mode="M31"/><axsl:apply-templates select="/" mode="M32"/><axsl:apply-templates select="/" mode="M33"/><axsl:apply-templates select="/" mode="M34"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN deathPriCareConsistencyCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]" priority="1000" mode="M2"><axsl:variable name="addOrUpdatePatientCare" select="count(hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvisionEvent[not(@updateMode='removed')]/hl7:code[@code='1'])&gt;0"/>

		<!--REPORT -->
<axsl:if test="$addOrUpdatePatientCare and count(hl7:subjectOf1/hl7:deathNotification[not(@updateMode='removed')])&gt;0">***fault|ErrorBase1742.GP_PROVDER_RULE86***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$addOrUpdatePatientCare and count(hl7:subjectOf3/hl7:nHAISRemovalRegistrationEvent[not(@updateMode='removed')])&gt;0">***fault|ErrorBase1742.GP_PROVDER_RULE86***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M2"/></axsl:template><axsl:template match="text()" priority="-1" mode="M2"/><axsl:template match="@*|node()" priority="-2" mode="M2"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M2"/></axsl:template>

<!--PATTERN reasonRemovalPrimaryCareCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]" priority="1000" mode="M3"><axsl:variable name="isRFRRemoved" select="count(hl7:subjectOf3[1]/hl7:nHAISRemovalRegistrationEvent[@updateMode='removed'])"/><axsl:variable name="isGPAdded" select="count(hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvisionEvent[1][@updateMode='added']/hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.37'][@code='1'])"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isRFRRemoved = 0 or $isGPAdded = 1"/><axsl:otherwise>***fault|ErrorBase1742.REG_REMOVAL_AND_PCP_MUTUALLY_EXCLUSIVE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN nHAISRegistrationEventCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf2[1]/hl7:nHAISRegistrationEvent[1]" priority="1000" mode="M4"><axsl:variable name="regType" select="count(hl7:code)"/><axsl:variable name="custodian" select="count(hl7:custodian)"/><axsl:variable name="effectiveTime" select="string-length(hl7:effectiveTime/hl7:low/@value)+string-length(hl7:effectiveTime/hl7:high/@value)"/><axsl:variable name="updateMode" select="@updateMode"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$regType=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$updateMode='removed' or ($custodian=1 and $effectiveTime&gt;0)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="$updateMode='removed' and ($custodian&gt;0 or $effectiveTime&gt;0)">***fault|ErrorBase1742.UNEXPECTED_DATA_IN_NHAIS_REG_EVENT***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN nHAISRemovalRegistrationEventCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf3[1]/hl7:nHAISRemovalRegistrationEvent[1]" priority="1000" mode="M5"><axsl:variable name="reasonCode" select="count(hl7:reasonCode)"/><axsl:variable name="regType" select="count(hl7:code)"/><axsl:variable name="effectiveTime" select="string-length(hl7:effectiveTime/hl7:low/@value)+string-length(hl7:effectiveTime/hl7:high/@value)"/><axsl:variable name="effectiveLowCount" select="count(hl7:effectiveTime/hl7:low)"/><axsl:variable name="updateMode" select="@updateMode"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$regType=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$updateMode='removed' or ($reasonCode=1 and $effectiveTime&gt;0)"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="$updateMode='removed' and ($reasonCode&gt;0 or $effectiveLowCount&gt;0)">***fault|ErrorBase1742.UNEXPECTED_DATA_IN_NHAIS_REMOVAL_REG_EVENT***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN addressCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr[@updateMode='removed']" priority="1001" mode="M6">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UID_MUST_BE_PROVIDED***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template>

	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr|/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole/hl7:addr" priority="1000" mode="M6">

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
<axsl:choose><axsl:when test="count(hl7:useablePeriod/hl7:low)=0 or count(hl7:useablePeriod/hl7:high)=0 or hl7:useablePeriod/hl7:high/@value &gt;= hl7:useablePeriod/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN nameCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name[@updateMode='removed']" priority="1001" mode="M7">

		<!--REPORT -->
<axsl:if test="@use='L'">***fault|ErrorBase1742.UNABLE_TO_DELETE_USUAL_NAME***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UID_MUST_BE_PROVIDED***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template>

	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name|/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole/hl7:player/hl7:name" priority="1000" mode="M7">

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
<axsl:choose><axsl:when test="count(hl7:validTime/hl7:low)=0 or count(hl7:validTime/hl7:high)=0 or hl7:validTime/hl7:high/@value &gt;= hl7:validTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN pcProvisionCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvisionEvent[1][@updateMode='removed']" priority="1001" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UID_MUST_BE_PROVIDED***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template>

	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvisionEvent[1]" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="hl7:code/@code='1'"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_PATIENT_CARE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="string-length(hl7:performer/hl7:assignedOrganization/hl7:id/@extension) &gt; 10">***fault|ErrorBase1742.INVALID_GPREG***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:performer/hl7:assignedOrganization/hl7:id[@root='2.16.840.1.113883.2.1.4.3'])=1"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_HCP_CODE_TYPE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime)=0 or count(hl7:effectiveTime)=1"/><axsl:otherwise>***fault|ErrorBase1742.MORE_THAN_ONE_USABLE_PERIOD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/hl7:low)=0 or count(hl7:effectiveTime/hl7:high)=0 or hl7:effectiveTime/hl7:high/@value &gt;= hl7:effectiveTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN genderCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:administrativeGenderCode[1][@updateMode='removed']" priority="1000" mode="M9">

		<!--REPORT -->
<axsl:if test="true()">***fault|ErrorBase1742.GENDER_REMOVAL_NOT_PERMITTED***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN birthTimeCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:birthTime[1][@updateMode='removed']" priority="1000" mode="M10">

		<!--REPORT -->
<axsl:if test="true()">***fault|ErrorBase1742.BIRTHTIME_REMOVAL_NOT_PERMITTED***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN deathUpdateCrossCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]" priority="1000" mode="M11"><axsl:variable name="deceasedTime" select="count(hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime)"/><axsl:variable name="deathNotification" select="count(hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1[1]/hl7:deathNotification[1])"/><axsl:variable name="author" select="count(hl7:author)"/><axsl:variable name="updateModedeceasedTime" select="hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]/@updateMode"/><axsl:variable name="updateModedeathNotification" select="hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1[1]/hl7:deathNotification[1]/@updateMode"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$deceasedTime=$deathNotification"/><axsl:otherwise>***fault|ErrorBase1742.INCONSISTENT_DEATH_UPDATE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not($deceasedTime=1 and $deathNotification=1) or $updateModedeceasedTime=$updateModedeathNotification"/><axsl:otherwise>***fault|ErrorBase1742.DEATH_UPDATE_MODE_INCONSISTENT***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="($updateModedeceasedTime='removed') and ($author&gt;0)">***fault|ErrorBase1742.AUTHOR_CHANGED_ON_REMOVAL***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="($deceasedTime&gt;0) and not($updateModedeceasedTime='removed') and not ($author&gt;0)">***fault|ErrorBase1742.AUTHOR_UNSPECIFIED_ON_DEATH***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not($deceasedTime&gt;0) and $author&gt;0">***fault|ErrorBase1742.INVALID_AUTHOR_SPECIFICATION***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN deceasedTimeCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and count(@value)&gt;0">***fault|ErrorBase1742.DECEASED_TIME_CHANGED_ON_REMOVAL***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN deathNotificationCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1[1]/hl7:deathNotification[1]" priority="1000" mode="M13">

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and count(hl7:value)&gt;0">***fault|ErrorBase1742.DEATH_NOTIFICATION_CHANGED_ON_REMOVAL***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN registeringAuthorityCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]" priority="1000" mode="M14">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[registeringAuthority.assignedRegisteringOrganization.scopedAssignedPerson.id]|registeringAuthority.assignedRegisteringOrganization.scopedAssignedPerson.id***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN registeredRolePartCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]" priority="1000" mode="M15">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:partRegisteredPerson) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[registeredRolePartCheck.partRegisteredPerson]|partRegisteredPerson***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN registeredPersonCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]/hl7:partRegisteredPerson[1]/hl7:name" priority="1000" mode="M16">

		<!--ASSERT -->
<axsl:choose><axsl:when test="@use='PREVIOUS'"/><axsl:otherwise>***fault|ErrorBase1742Extended.INVALID_NAME_USE_TYPE[registeredPersonCheck.name]|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN militaryMembershipCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]/hl7:partRegisteredPerson[1]/hl7:militaryMembership" priority="1000" mode="M17">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime) = 1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[militaryMembershipCheck.effectiveTime]|militaryMembership/effectiveTime***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN birthplaceCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]/hl7:partRegisteredPerson[1]/hl7:birthplace" priority="1000" mode="M18">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:addr) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[birthplaceCheck.addr]|birthplace/addr***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN ukResidenceCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]/hl7:partRegisteredPerson[1]/hl7:playedRegisteredPatient/hl7:subjectOf1[1]/hl7:uKResidence" priority="1000" mode="M19">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[ukResidenceCheck.code]|code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[ukResidenceCheck.value]|value***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M19"/></axsl:template>

<!--PATTERN nhaisRegistrationEncounterCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]/hl7:partRegisteredPerson[1]/hl7:playedRegisteredPatient/hl7:subjectOf2[1]/hl7:nHAISRegistrationEncounter" priority="1000" mode="M20">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[nhaisRegistrationEncounterCheck.code]|code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:reasonCode/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[nhaisRegistrationEncounterCheck.reasonCode]|reasonCode***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M20"/></axsl:template>

<!--PATTERN initialNhaisRegistrationEventCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]/hl7:partRegisteredPerson[1]/hl7:playedRegisteredPatient/hl7:subjectOf3[1]/hl7:initialNHAISRegistrationEvent" priority="1000" mode="M21">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[initialNhaisRegistrationEventCheck.code]|code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime)=1"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[initialNhaisRegistrationEventCheck.effectiveTime]|effectiveTime***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M21"/></axsl:template>

<!--PATTERN previousNhaisRegistrationEventCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]/hl7:partRegisteredPerson[1]/hl7:playedRegisteredPatient/hl7:replacementOf[1]/hl7:oldVersion[1]/hl7:subjectOf1[1]/hl7:nHAISRegistrationEvent" priority="1000" mode="M22">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[previousNhaisRegistrationEventCheck.code]|code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:custodian/hl7:assignedDevice/hl7:assignedDevice/hl7:name) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[previousNhaisRegistrationEventCheck.assignedDevice]|assignedDevice***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M22"/></axsl:template><axsl:template match="text()" priority="-1" mode="M22"/><axsl:template match="@*|node()" priority="-2" mode="M22"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M22"/></axsl:template>

<!--PATTERN previousPatientCareProvisionCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]/hl7:partRegisteredPerson[1]/hl7:playedRegisteredPatient/hl7:replacementOf[1]/hl7:oldVersion[1]/hl7:subjectOf2[1]/hl7:patientCareProvisionEvent" priority="1000" mode="M23">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[previousPatientCareProvisionCheck.code]|code***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1742Extended.MANDATORY_FIELD_MISSING_SUPP_INFO[previousPatientCareProvisionCheck.name]|name***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M23"/></axsl:template><axsl:template match="text()" priority="-1" mode="M23"/><axsl:template match="@*|node()" priority="-2" mode="M23"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M23"/></axsl:template>

<!--PATTERN registeredRolePartOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000200UK02.RegisteredRolePart[1]" priority="1000" mode="M24">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|registeredPerson***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++previousName|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:name"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++militaryMembership.effective.low|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:militaryMembership/hl7:effectiveTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++militaryMembership.effective.high|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:militaryMembership/hl7:effectiveTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthplace|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:birthplace/hl7:addr"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++previousAddress|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:addr"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++ukResidence.code|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf1/hl7:uKResidence/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++ukResidence.codeSystem|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf1/hl7:uKResidence/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++ukResidence.low|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf1/hl7:uKResidence/hl7:value/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++ukResidence.high|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf1/hl7:uKResidence/hl7:value/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++registrationEncounter.code.code|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf2/hl7:nHAISRegistrationEncounter/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++registrationEncounter.code.codeSystem|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf2/hl7:nHAISRegistrationEncounter/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++registrationEncounter.reasonCode.code|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf2/hl7:nHAISRegistrationEncounter/hl7:reasonCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++registrationEncounter.reasonCode.codeSystem|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf2/hl7:nHAISRegistrationEncounter/hl7:reasonCode/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++initialNhaisRegistrationEvent.code|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf3/hl7:initialNHAISRegistrationEvent/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++initialNhaisRegistrationEvent.codeSystem|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf3/hl7:initialNHAISRegistrationEvent/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++initialNhaisRegistrationEvent.effective|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:subjectOf3/hl7:initialNHAISRegistrationEvent/hl7:effectiveTime/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++previousNhaisRegistration.code|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:replacementOf/hl7:oldVersion/hl7:subjectOf1/hl7:nHAISRegistrationEvent/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++previousNhaisRegistration.codeSystem|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:replacementOf/hl7:oldVersion/hl7:subjectOf1/hl7:nHAISRegistrationEvent/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++previousNhaisRegistration.system|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:replacementOf/hl7:oldVersion/hl7:subjectOf1/hl7:nHAISRegistrationEvent/hl7:custodian/hl7:assignedDevice/hl7:assignedDevice/hl7:name"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++previousPatientCareProvision.code|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:replacementOf/hl7:oldVersion/hl7:subjectOf2/hl7:patientCareProvisionEvent/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++previousPatientCareProvision.codeSystem|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:replacementOf/hl7:oldVersion/hl7:subjectOf2/hl7:patientCareProvisionEvent/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++previousPatientCareProvision.assignedPerson|<axsl:text/><axsl:value-of select="hl7:partRegisteredPerson/hl7:playedRegisteredPatient/hl7:replacementOf/hl7:oldVersion/hl7:subjectOf2/hl7:patientCareProvisionEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M24"/></axsl:template><axsl:template match="text()" priority="-1" mode="M24"/><axsl:template match="@*|node()" priority="-2" mode="M24"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M24"/></axsl:template>

<!--PATTERN addressTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr" priority="1000" mode="M25">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|address***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.1']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.postalCode|<axsl:text/><axsl:value-of select="hl7:postalCode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.addressKey|<axsl:text/><axsl:value-of select="hl7:addressKey"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

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
<axsl:if test="true()">+++address.effective.high|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++address.effective.low|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M25"/></axsl:template><axsl:template match="text()" priority="-1" mode="M25"/><axsl:template match="@*|node()" priority="-2" mode="M25"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M25"/></axsl:template>

<!--PATTERN nameTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M26">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|name***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.1']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M26"/></axsl:template><axsl:template match="text()" priority="-1" mode="M26"/><axsl:template match="@*|node()" priority="-2" mode="M26"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M26"/></axsl:template>

<!--PATTERN pcProvisionTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvisionEvent" priority="1000" mode="M27">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|playedOtherProviderPatient***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.1']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:code/@codeSystem)=1">+++patientCareProvision.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.hcpCode|<axsl:text/><axsl:value-of select="hl7:performer/hl7:assignedOrganization/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.hcpCodeSystem|<axsl:text/><axsl:value-of select="hl7:performer/hl7:assignedOrganization/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.effective.high|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.effective.low|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M27"/></axsl:template><axsl:template match="text()" priority="-1" mode="M27"/><axsl:template match="@*|node()" priority="-2" mode="M27"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M27"/></axsl:template>

<!--PATTERN genderCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:administrativeGenderCode[1]" priority="1000" mode="M28">

		<!--REPORT -->
<axsl:if test="true()">***<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|gender/gender.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M28"/></axsl:template><axsl:template match="text()" priority="-1" mode="M28"/><axsl:template match="@*|node()" priority="-2" mode="M28"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M28"/></axsl:template>

<!--PATTERN birthTimeCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:birthTime[1]" priority="1000" mode="M29">

		<!--REPORT -->
<axsl:if test="true()">***<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|birthTime/birthTime.value|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M29"/></axsl:template><axsl:template match="text()" priority="-1" mode="M29"/><axsl:template match="@*|node()" priority="-2" mode="M29"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M29"/></axsl:template>

<!--PATTERN deceasedTimeCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]" priority="1000" mode="M30">

		<!--REPORT -->
<axsl:if test="true()">***<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|deceasedTime/deceasedTime.value|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M30"/></axsl:template><axsl:template match="text()" priority="-1" mode="M30"/><axsl:template match="@*|node()" priority="-2" mode="M30"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M30"/></axsl:template>

<!--PATTERN deathNotificationCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1[1]/hl7:deathNotification[1]" priority="1000" mode="M31">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|deathNotification***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.code.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.value.codeSystem|<axsl:text/><axsl:value-of select="hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M31"/></axsl:template><axsl:template match="text()" priority="-1" mode="M31"/><axsl:template match="@*|node()" priority="-2" mode="M31"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M31"/></axsl:template>

<!--PATTERN authorCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]" priority="1000" mode="M32"><axsl:variable name="authorPersonID" select="hl7:author/hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:id/@extension"/><axsl:variable name="authorSystemID" select="hl7:author1/hl7:AgentSystemSDS/hl7:agentSystemSDS/hl7:id/@extension"/><axsl:variable name="deathStatus" select="hl7:subject/hl7:PdsNhaisUpdateRequest/hl7:subject/hl7:patientRole/hl7:subjectOf1/hl7:deathNotification/hl7:value/@code"/><axsl:variable name="deceasedTime" select="hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]/@value"/><axsl:variable name="overalUpdateMode" select="hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]/@updateMode"/><axsl:variable name="hasRegisteringAuthority" select="count(hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1])&gt;0"/>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">***BEGIN-BLOCK|forceAlter|deathRegisteringAuthority***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regAuthorityType.code|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regAuthorityType.codeSystem|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regPerson.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regPerson.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regOrganisation.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++regOrganisation.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++authorPersonID|<axsl:text/><axsl:value-of select="$authorPersonID"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++authorSystemID|<axsl:text/><axsl:value-of select="$authorSystemID"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++deathStatus|<axsl:text/><axsl:value-of select="$deathStatus"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++deceasedTime|<axsl:text/><axsl:value-of select="$deceasedTime"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++overalUpdateMode|<axsl:text/><axsl:value-of select="$overalUpdateMode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M32"/></axsl:template><axsl:template match="text()" priority="-1" mode="M32"/><axsl:template match="@*|node()" priority="-2" mode="M32"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M32"/></axsl:template>

<!--PATTERN nHAISRegistrationEventOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf2[1]/hl7:nHAISRegistrationEvent[1]" priority="1000" mode="M33">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|nHAISRegistrationEvent***<axsl:value-of select="string('&#10;')"/></axsl:if>

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M33"/></axsl:template><axsl:template match="text()" priority="-1" mode="M33"/><axsl:template match="@*|node()" priority="-2" mode="M33"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M33"/></axsl:template>

<!--PATTERN nHAISRemovalRegistrationEventOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsNhaisUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf3[1]/hl7:nHAISRemovalRegistrationEvent[1]" priority="1000" mode="M34">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|registrationRemoval***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regType.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regType.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++reasonCode.code|<axsl:text/><axsl:value-of select="hl7:reasonCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++reasonCode.codeSystem|<axsl:text/><axsl:value-of select="hl7:reasonCode/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++effective.low|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++effective.high|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M34"/></axsl:template><axsl:template match="text()" priority="-1" mode="M34"/><axsl:template match="@*|node()" priority="-2" mode="M34"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M34"/></axsl:template></axsl:stylesheet>
