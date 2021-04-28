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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M2"/><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN consentCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1/hl7:consent" priority="1000" mode="M2">

		<!--ASSERT -->
<axsl:choose><axsl:when test="hl7:code/@code='6'"/><axsl:otherwise>***fault|ErrorBase1742.INVALID_CONSENT_VALUE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M2"/></axsl:template><axsl:template match="text()" priority="-1" mode="M2"/><axsl:template match="@*|node()" priority="-2" mode="M2"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M2"/></axsl:template>

<!--PATTERN telecomCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:telecom" priority="1000" mode="M3"><axsl:variable name="isRemoved" select="@nullFlavor='NA'"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isRemoved or string-length(@value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNEXPECTED_CONTACT_TYPE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN nameCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M4"><axsl:variable name="isRemoved" select="@nullFlavor='NA'"/><axsl:variable name="use" select="@use"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$use='L' or $use='A' or $use='PREFERRED'"/><axsl:otherwise>***fault|ErrorBase1742.UNEXPECTED_P1R1_DATA***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="$isRemoved and $use='L'">***fault|ErrorBase1742.UNABLE_TO_DELETE_USUAL_NAME***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isRemoved or count(hl7:prefix)=0 or count(hl7:prefix)=1"/><axsl:otherwise>***fault|ErrorBase1742.NO_MORE_THAN_ONE_PREFIX***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isRemoved or count(hl7:family)=0 or count(hl7:family)=1"/><axsl:otherwise>***fault|ErrorBase1742.NO_MORE_THAN_ONE_FAMILY_NAME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isRemoved or count(hl7:suffix)=0 or count(hl7:suffix)=1"/><axsl:otherwise>***fault|ErrorBase1742.NO_MORE_THAN_ONE_SUFFIX***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isRemoved or count(hl7:given)=0 or count(hl7:given)=1 or count(hl7:given)=2"/><axsl:otherwise>***fault|ErrorBase1742.TOO_MANY_GIVEN_NAMES_2***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isRemoved or (count(hl7:given)+count(hl7:family))&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.INSUFFICIENT_NAME_DETAILS***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN genderCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:administrativeGenderCode[1][@nullFlavor='NA']" priority="1000" mode="M5">

		<!--REPORT -->
<axsl:if test="true()">***fault|ErrorBase1742.GENDER_REMOVAL_NOT_PERMITTED***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN birthTimeCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:birthTime[1][@nullFlavor='NA']" priority="1000" mode="M6">

		<!--REPORT -->
<axsl:if test="true()">***fault|ErrorBase1742.BIRTHTIME_REMOVAL_NOT_PERMITTED***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN addressCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr" priority="1000" mode="M7"><axsl:variable name="isRemoved" select="@nullFlavor='NA'"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="@use='H'"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isRemoved or count(hl7:streetAddressLine)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.INCORRECT_NUMBER_OF_ADDRESS_LINES***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:streetAddressLine)&gt;5">***fault|ErrorBase1742.INCORRECT_NUMBER_OF_ADDRESS_LINES***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN pcProvisionCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvision[1]" priority="1000" mode="M8"><axsl:variable name="provisionType" select="hl7:code/@code"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_PATIENT_CARE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:responsibleParty/hl7:healthCareProvider/hl7:id[@root='2.16.840.1.113883.2.1.4.3'])=1 or count(hl7:responsibleParty/hl7:healthCareProvider/hl7:id[@root='2.16.840.1.113883.2.1.4.2'])=1"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_HCP_CODE_TYPE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:responsibleParty/hl7:healthCareProvider)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[patientCareProvision.performer]|patientCareProvision.performer***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime)=0 or ($provisionType='1' and count(hl7:effectiveTime)=1)"/><axsl:otherwise>***fault|ErrorBase1742.MORE_THAN_ONE_USABLE_PERIOD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/hl7:low)=0 or count(hl7:effectiveTime/hl7:high)=0 or hl7:effectiveTime/hl7:high/@value &gt;= hl7:effectiveTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN consentOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1/hl7:consent" priority="1000" mode="M9">

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">***BEGIN-BLOCK|removed|consent***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">+++code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">+++value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">+++supplementaryComments.code|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">+++supplementaryComments.codeSystem|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">+++supplementaryComments.value|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">+++effectiveTime.value|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">+++id|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/@nullFlavor='NA'">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">***BEGIN-BLOCK|forceAlter|consent***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">+++code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">+++value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">+++supplementaryComments.code|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">+++supplementaryComments.codeSystem|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">+++supplementaryComments.value|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">+++effectiveTime.value|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">+++id|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:value/@nullFlavor='NA')">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN telecomTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:telecom" priority="1000" mode="M10">

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">***BEGIN-BLOCK|removed|telecom***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">***BEGIN-BLOCK|forceAlter|telecom***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++telecom.tel|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++telecom.effective.high|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++telecom.effective.low|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN languageOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:languageCommunication[1]" priority="1000" mode="M11">

		<!--REPORT -->
<axsl:if test="hl7:languageCode/@nullFlavor='NA'">***BEGIN-BLOCK|removed|language***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:languageCode/@nullFlavor='NA'">+++languageCode.code|<axsl:text/><axsl:value-of select="hl7:languageCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:languageCode/@nullFlavor='NA'">+++preferenceInd.value|<axsl:text/><axsl:value-of select="hl7:preferenceInd/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:languageCode/@nullFlavor='NA'">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:languageCode/@nullFlavor='NA')">***BEGIN-BLOCK|forceAlter|language***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:languageCode/@nullFlavor='NA')">+++languageCode.code|<axsl:text/><axsl:value-of select="hl7:languageCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:languageCode/@nullFlavor='NA')">+++preferenceInd.value|<axsl:text/><axsl:value-of select="hl7:preferenceInd/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(hl7:languageCode/@nullFlavor='NA')">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN genderCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:administrativeGenderCode[1]" priority="1000" mode="M12">

		<!--REPORT -->
<axsl:if test="true()">***forceAlter|gender/gender.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN birthTimeCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:birthTime[1]" priority="1000" mode="M13">

		<!--REPORT -->
<axsl:if test="true()">***forceAlter|birthTime/birthTime.value|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN addressTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr" priority="1000" mode="M14">

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">***BEGIN-BLOCK|removed|address***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">+++address.effective.high|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">+++address.effective.low|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:addressKey='0'">***warning|ErrorBase1742Extended.INVALID_VALUE|0|address.addressKey***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">***BEGIN-BLOCK|forceAlter|address***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++address.postalCode|<axsl:text/><axsl:value-of select="hl7:postalCode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA') and not(hl7:addressKey='0')">+++address.addressKey|<axsl:text/><axsl:value-of select="hl7:addressKey"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++address.addr.line1|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++address.addr.line2|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++address.addr.line3|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++address.addr.line4|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++address.addr.line5|<axsl:text/><axsl:value-of select="hl7:streetAddressLine[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++address.effective.high|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++address.effective.low|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN nameTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M15">

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">***BEGIN-BLOCK|removed|name***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="@nullFlavor='NA'">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">***BEGIN-BLOCK|forceAlter|name***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.prefix|<axsl:text/><axsl:value-of select="hl7:prefix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.suffix|<axsl:text/><axsl:value-of select="hl7:suffix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.givenName.name1|<axsl:text/><axsl:value-of select="hl7:given[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.givenName.name2|<axsl:text/><axsl:value-of select="hl7:given[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.givenName.name3|<axsl:text/><axsl:value-of select="hl7:given[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.givenName.name4|<axsl:text/><axsl:value-of select="hl7:given[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.givenName.name5|<axsl:text/><axsl:value-of select="hl7:given[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.familyName|<axsl:text/><axsl:value-of select="hl7:family"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.effective.high|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++name.effective.low|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@nullFlavor='NA')">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN pcProvisionTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvision" priority="1000" mode="M16">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|altered|playedOtherProviderPatient***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.1']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:code/@codeSystem)=1">+++patientCareProvision.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.hcpCode|<axsl:text/><axsl:value-of select="hl7:responsibleParty/hl7:healthCareProvider/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.hcpCodeSystem|<axsl:text/><axsl:value-of select="hl7:responsibleParty/hl7:healthCareProvider/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.effective.high|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++patientCareProvision.effective.low|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN disabilityCode-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:disabilityCode" priority="1000" mode="M17"><axsl:variable name="visualCodes" select="@code='11' or @code='12'"/><axsl:variable name="hearingCodes" select="@code='21' or @code='22' or @code='23'"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$visualCodes or $hearingCodes"/><axsl:otherwise>***fault|ErrorBase1742.UNEXPECTED_P1R1_DATA***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:variable name="isRemoved" select="@nullFlavor='NA'"/>

		<!--REPORT -->
<axsl:if test="$visualCodes and not($isRemoved)">***BEGIN-BLOCK|forceAlter|preferredWrittenCommunicationFormat***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and not($isRemoved)">+++code.code|13+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and not($isRemoved)">+++code.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.35+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and not($isRemoved)">+++value.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and not($isRemoved)">+++value.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.17+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and not($isRemoved)">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and $isRemoved">***BEGIN-BLOCK|removed|preferredWrittenCommunicationFormat***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and $isRemoved">+++code.code|13+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and $isRemoved">+++code.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.35+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and $isRemoved">+++value.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and $isRemoved">+++value.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.17+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$visualCodes and $isRemoved">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">***BEGIN-BLOCK|forceAlter|preferredContactMethod***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">+++code.code|9+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">+++code.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.35+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">+++value.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">+++value.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.16+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">+++contactTimes.code|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">+++contactTimes.codeSystem|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">+++contactTimes.value|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and not($isRemoved)">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">***BEGIN-BLOCK|removed|preferredContactMethod***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">+++code.code|9+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">+++code.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.35+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">+++value.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">+++value.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.16+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">+++contactTimes.code|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">+++contactTimes.codeSystem|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">+++contactTimes.value|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hearingCodes and $isRemoved">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M17"/></axsl:template></axsl:stylesheet>
