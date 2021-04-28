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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M2"/><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/><axsl:apply-templates select="/" mode="M22"/><axsl:apply-templates select="/" mode="M23"/><axsl:apply-templates select="/" mode="M24"/><axsl:apply-templates select="/" mode="M25"/><axsl:apply-templates select="/" mode="M26"/><axsl:apply-templates select="/" mode="M27"/><axsl:apply-templates select="/" mode="M28"/><axsl:apply-templates select="/" mode="M29"/><axsl:apply-templates select="/" mode="M30"/><axsl:apply-templates select="/" mode="M31"/><axsl:apply-templates select="/" mode="M32"/><axsl:apply-templates select="/" mode="M33"/><axsl:apply-templates select="/" mode="M34"/><axsl:apply-templates select="/" mode="M35"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN relatedPersonCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole[@updateMode='removed']" priority="1001" mode="M2">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:addr) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.address]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.effectiveTime]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:positionNumber) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.positionNumber]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:telecom) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.telecom]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:player) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.player]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:part) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.part]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:part3) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.part3]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:subjectOf1) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.subjectOf1]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:subjectOf2) = 0"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_CANNOT_PROVIDE_DATE[scopedRelatedPersonRole.subjectOf2]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.1'])=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[scopedRelatedPersonRole.id]|scopedRelatedPersonRole.id***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M2"/></axsl:template>

	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole" priority="1000" mode="M2"><axsl:variable name="objectIDCount" select="count(hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.1'])"/><axsl:variable name="nhsNumberIDCount" select="count(hl7:player/hl7:playedRelatedPatient/hl7:id)"/><axsl:variable name="subjectOf3Count" select="count(hl7:subjectOf3[1])"/><axsl:variable name="partCount" select="count(hl7:part[1])"/><axsl:variable name="part3Count" select="count(hl7:part3[1])"/><axsl:variable name="addrCount" select="count(hl7:addr[1])"/><axsl:variable name="telecomCount" select="count(hl7:telecom)"/><axsl:variable name="nameCount" select="count(hl7:player/hl7:name[1])"/><axsl:variable name="subjectOf1Count" select="count(hl7:subjectOf1[1])"/><axsl:variable name="subjectOf2Count" select="count(hl7:subjectOf2[1])"/><axsl:variable name="nhsNumberOnlyFields" select="$addrCount + $telecomCount +  $nameCount +  $subjectOf1Count + $subjectOf2Count"/>

		<!--REPORT -->
<axsl:if test="not(@updateMode='added') and not($objectIDCount=1)">***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[scopedRelatedPersonRole.id]|scopedRelatedPersonRole.id***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not($nhsNumberIDCount&gt;1)"/><axsl:otherwise>***fault|ErrorBase1742.RELATED_PERSON_INCORRRECT_ID_FIELDS[scopedRelatedPersonRole.relatedPatient.id]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$nameCount=0 or hl7:player[1]/hl7:name[1]/@use='L'"/><axsl:otherwise>***fault|ErrorBase1742Extended.ONLY_USUAL_NAME_SUPPORTED[scopedRelatedPersonRole.player.name]|scopedRelatedPersonRole.player.name***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$addrCount=0 or hl7:addr[1]/@use='H'"/><axsl:otherwise>***fault|ErrorBase1742Extended.ONLY_HOME_ADDRESS_SUPPORTED[scopedRelatedPersonRole.address]|scopedRelatedPersonRole.address***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="not(@classCode='AGNT') and $subjectOf3Count&gt;0">***fault|ErrorBase1742Extended.ONLY_SUPPORTED_FOR_AGENTS[scopedRelatedPersonRole.subjectOf3]|scopedRelatedPersonRole.subjectOf3***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nhsNumberIDCount=1 and not ($nhsNumberOnlyFields=0) ">***fault|ErrorBase1742.RELATED_PERSON_DATA_INVALID_NHS_SUPPLIED***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/hl7:low)=0 or count(hl7:effectiveTime/hl7:high)=0 or hl7:effectiveTime/hl7:high/@value &gt;= hl7:effectiveTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="$telecomCount&gt;5">***fault|ErrorBase1742.TOO_MANY_TELECOM_ELEMENTS***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nhsNumberIDCount=0 and not($addrCount=1)">***fault|ErrorBase1742.RELATED_PERSON_NAME_ADDRESS_MISSING[scopedRelatedPersonRole.address]***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nhsNumberIDCount=0 and not($nameCount=1)">***fault|ErrorBase1742.RELATED_PERSON_NAME_ADDRESS_MISSING[scopedRelatedPersonRole.name]***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M2"/></axsl:template><axsl:template match="text()" priority="-1" mode="M2"/><axsl:template match="@*|node()" priority="-2" mode="M2"><axsl:apply-templates select="@*|*" mode="M2"/></axsl:template>

<!--PATTERN deathUpdateCrossCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]" priority="1000" mode="M3"><axsl:variable name="deceasedTime" select="count(hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000211UK01.PartDeceasedTime/hl7:partPerson/hl7:deceasedTime/@value)"/><axsl:variable name="deathNotification" select="count(hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf7[1]/hl7:deathNotification)"/><axsl:variable name="updateModedeceasedTime" select="hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000211UK01.PartDeceasedTime/@updateMode"/><axsl:variable name="updateModedeathNotification" select="hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf7[1]/hl7:deathNotification/@updateMode"/>

		<!--REPORT -->
<axsl:if test="$updateModedeceasedTime ='removed' or $updateModedeathNotification ='removed'">***fault|ErrorBase1742.SOURCE_CANNOT_REMOVE_DATE_OF_DEATH***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$deceasedTime=$deathNotification"/><axsl:otherwise>***fault|ErrorBase1742.INCONSISTENT_DEATH_UPDATE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not($deceasedTime=1 and $deathNotification=1) or $updateModedeceasedTime=$updateModedeathNotification"/><axsl:otherwise>***fault|ErrorBase1742.DEATH_UPDATE_MODE_INCONSISTENT***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$deathNotification=0 or count(hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf7[1]/hl7:deathNotification/hl7:responsibleParty/hl7:registeringAuthority)=1"/><axsl:otherwise>***fault|ErrorBase1742.AUTHOR_UNSPECIFIED_ON_DEATH***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="@*|*" mode="M3"/></axsl:template>

<!--PATTERN addressCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr[@updateMode='removed']" priority="1001" mode="M4">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UID_MUST_BE_PROVIDED***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M4"/></axsl:template>

	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr|/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole/hl7:addr" priority="1000" mode="M4">

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
<axsl:choose><axsl:when test="count(hl7:useablePeriod/hl7:low)=0 or count(hl7:useablePeriod/hl7:high)=0 or hl7:useablePeriod/hl7:high/@value &gt;= hl7:useablePeriod/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="@*|*" mode="M4"/></axsl:template>

<!--PATTERN telecomCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:telecom[@updateMode='removed']" priority="1001" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UID_MUST_BE_PROVIDED***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M5"/></axsl:template>

	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:telecom|/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole/hl7:telecom" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNEXPECTED_CONTACT_TYPE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:useablePeriod)=0 or count(hl7:useablePeriod)=1"/><axsl:otherwise>***fault|ErrorBase1742.MORE_THAN_ONE_USABLE_PERIOD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:useablePeriod/hl7:low)=0 or count(hl7:useablePeriod/hl7:high)=0 or hl7:useablePeriod/hl7:high/@value &gt;= hl7:useablePeriod/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="@*|*" mode="M5"/></axsl:template>

<!--PATTERN nameCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name[@updateMode='removed']" priority="1001" mode="M6">

		<!--REPORT -->
<axsl:if test="@use='L'">***fault|ErrorBase1742.UNABLE_TO_DELETE_USUAL_NAME***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(@use)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_CHARACTERS_IN_FIELD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UID_MUST_BE_PROVIDED***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name|/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole/hl7:player/hl7:name" priority="1000" mode="M6">

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
<axsl:choose><axsl:when test="count(hl7:validTime/hl7:low)=0 or count(hl7:validTime/hl7:high)=0 or hl7:validTime/hl7:high/@value &gt;= hl7:validTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="@*|*" mode="M6"/></axsl:template>

<!--PATTERN pcProvisionCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvision[1][@updateMode='removed']" priority="1001" mode="M7">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UID_MUST_BE_PROVIDED***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvision[1]" priority="1000" mode="M7"><axsl:variable name="provisionType" select="hl7:code/@code"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:code/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_PATIENT_CARE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:performer/hl7:assignedOrganization/hl7:id[@root='2.16.840.1.113883.2.1.4.3'])=1"/><axsl:otherwise>***fault|ErrorBase1742.UNSUPPORTED_HCP_CODE_TYPE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:performer)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[patientCareProvision.performer]|patientCareProvision.performer***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime)=0 or ($provisionType='1' and count(hl7:effectiveTime)=1)"/><axsl:otherwise>***fault|ErrorBase1742.MORE_THAN_ONE_USABLE_PERIOD***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/hl7:low)=0 or count(hl7:effectiveTime/hl7:high)=0 or hl7:effectiveTime/hl7:high/@value &gt;= hl7:effectiveTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="@*|*" mode="M7"/></axsl:template>

<!--PATTERN sharedSecretCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf5/hl7:sharedSecret[1][not(@updateMode='removed')]" priority="1000" mode="M8">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.35'])=1"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_CODE_FROM_SHARED_SECRET***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_VALUE_FROM_SHARED_SECRET***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="@*|*" mode="M8"/></axsl:template>

<!--PATTERN genderCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000209UK01.PartAdminGenderCode[@updateMode='removed']" priority="1000" mode="M9">

		<!--REPORT -->
<axsl:if test="true()">***fault|ErrorBase1742.GENDER_REMOVAL_NOT_PERMITTED***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="@*|*" mode="M9"/></axsl:template>

<!--PATTERN birthTimeCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000210UK01.PartBirthTime[1]" priority="1000" mode="M10">

		<!--REPORT -->
<axsl:if test="@updateMode='removed'">***fault|ErrorBase1742.BIRTHTIME_REMOVAL_NOT_PERMITTED***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="@*|*" mode="M10"/></axsl:template>

<!--PATTERN birthOrderCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:multipleBirthOrderNumber[1]" priority="1000" mode="M11">

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and count(@value)&gt;0">***fault|ErrorBase1742.MULTIPLE_BIRTH_ORDER_NUMBER_PROVIDED***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="@*|*" mode="M11"/></axsl:template>

<!--PATTERN languageCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:languageCommunication[1]|/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole/hl7:player/hl7:languageCommunication[1]" priority="1000" mode="M12"><axsl:variable name="languageCodeCount" select="count(hl7:languageCode)"/><axsl:variable name="proficiencyLevelCodeCount" select="count(hl7:proficiencyLevelCode)"/><axsl:variable name="preferenceIndCount" select="count(hl7:preferenceInd)"/>

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and ($languageCodeCount &gt;0 or $proficiencyLevelCodeCount &gt;0 or $preferenceIndCount &gt;0)">***fault|ErrorBase1742.LANGUAGE_CHANGED_ON_REMOVAL***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="@*|*" mode="M12"/></axsl:template>

<!--PATTERN preferredWrittenCommunicationFormatCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf4[1]/hl7:preferredWrittenCommunicationFormat[1]|/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole/hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat[1]" priority="1000" mode="M13">

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and count(hl7:value)&gt;0">***fault|ErrorBase1742.WRITTEN_COMM_FORMAT_CHANGED_ON_REMOVAL***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="@*|*" mode="M13"/></axsl:template>

<!--PATTERN healthspaceRegistrationCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf3[1]/hl7:healthspaceRegistration[1]" priority="1000" mode="M14">

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and count(hl7:value)&gt;0">***fault|ErrorBase1742.HEALTHSPACE_REG_CHANGED_ON_REMOVAL***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="@*|*" mode="M14"/></axsl:template>

<!--PATTERN preferredContactMethodCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf2[1]/hl7:preferredContactMethod[1]|/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole/hl7:subjectOf1[1]/hl7:preferredContactMethod" priority="1000" mode="M15">

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and count(hl7:value)&gt;0">***fault|ErrorBase1742.INVALID_PREFERRED_CONTACT_METHOD***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and count(hl7:pertinentInformation/hl7:pertinentPreferredContactTimes/hl7:value)&gt;0">***fault|ErrorBase1742.INVALID_PREFERRED_CONTACT_METHOD***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="not(@updateMode='removed') and count(hl7:pertinentInformation/hl7:pertinentPreferredContactTimes)&gt;0 and string-length(hl7:pertinentInformation/hl7:pertinentPreferredContactTimes/hl7:value)=0">***fault|ErrorBase1742.PREFERRED_CONTACT_TIME_EMPTY***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="@*|*" mode="M15"/></axsl:template>

<!--PATTERN consentCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1/hl7:consent" priority="1000" mode="M16">

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and count(hl7:value)&gt;0">***fault|ErrorBase1742.CONSENT_VALUE_CHANGED_ON_REMOVAL***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="(@updateMode='removed') and hl7:code/@code='4'">***fault|ErrorBase1742.CONSENT_VALUES_CANNOT_BE_REMOVED***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="(count(hl7:effectiveTime)&gt;0) and hl7:code/@code='6'">***fault|ErrorBase1742.INVALID_DATA_FOR_CALL_CENTRE_CALL_BACK***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="(count(hl7:pertinentInformation)&gt;0)">***fault|ErrorBase1742.INVALID_DATA_FOR_CALL_CENTRE_CALL_BACK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="@*|*" mode="M16"/></axsl:template>

<!--PATTERN birthplaceCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000208UK01.BirthPlace[1]" priority="1000" mode="M17"><axsl:variable name="cityCount" select="count(hl7:addr/hl7:city)"/><axsl:variable name="countyCount" select="count(hl7:addr/hl7:county)"/><axsl:variable name="countryCount" select="count(hl7:addr/hl7:country)"/><axsl:variable name="updateMode" select="hl7:addr/@updateMode"/><axsl:variable name="notificationTime" select="count(hl7:subjectOf)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$cityCount=0 or ($cityCount=1 and string-length(hl7:addr/hl7:city)&gt;0)"/><axsl:otherwise>***fault|ErrorBase1742.UNEXPECTED_DATA_IN_BIRTHPLACE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$countyCount=0 or ($countyCount=1 and string-length(hl7:addr/hl7:county)&gt;0)"/><axsl:otherwise>***fault|ErrorBase1742.UNEXPECTED_DATA_IN_BIRTHPLACE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$countryCount=0 or $countryCount=1"/><axsl:otherwise>***fault|ErrorBase1742.UNEXPECTED_DATA_IN_BIRTHPLACE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:variable name="totalElements" select="$cityCount+$countyCount+$countryCount"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$updateMode='removed' or $totalElements&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.CITY_COUNTY_COUNTRY_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="$updateMode='removed' and ($totalElements&gt;0 or $notificationTime&gt;0) ">***fault|ErrorBase1742.BIRTHPLACE_CHANGED_ON_REMOVAL***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="@*|*" mode="M17"/></axsl:template>

<!--PATTERN scopedRelatedPersonOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject/hl7:patientRole/hl7:patientPerson/hl7:scopedRelatedPersonRole" priority="1000" mode="M18">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|scopedRelatedPerson***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.1']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++relTypeCode.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++relTypeCode.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++effective.high|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++effective.low|<axsl:text/><axsl:value-of select="hl7:effectiveTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++position|<axsl:text/><axsl:value-of select="hl7:positionNumber/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++nhsNumber.code|<axsl:text/><axsl:value-of select="hl7:player/hl7:playedRelatedPatient/hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++nhsNumber.codeSystem|<axsl:text/><axsl:value-of select="hl7:player/hl7:playedRelatedPatient/hl7:id[@root='2.16.840.1.113883.2.1.4.1']//@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++correspondence.code|<axsl:text/><axsl:value-of select="hl7:part/hl7:partCorrespondence/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++correspondence.codeSystem|<axsl:text/><axsl:value-of select="hl7:part/hl7:partCorrespondence/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++nextOfKin.code|<axsl:text/><axsl:value-of select="hl7:part3/hl7:partNextOfKin/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++nextOfKin.codeSystem|<axsl:text/><axsl:value-of select="hl7:part3/hl7:partNextOfKin/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/use|<axsl:text/><axsl:value-of select="hl7:addr/@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.postalCode|<axsl:text/><axsl:value-of select="hl7:addr/hl7:postalCode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.addressKey|<axsl:text/><axsl:value-of select="hl7:addr/hl7:addressKey"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.addr.line1|<axsl:text/><axsl:value-of select="hl7:addr/hl7:streetAddressLine[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.addr.line2|<axsl:text/><axsl:value-of select="hl7:addr/hl7:streetAddressLine[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.addr.line3|<axsl:text/><axsl:value-of select="hl7:addr/hl7:streetAddressLine[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.addr.line4|<axsl:text/><axsl:value-of select="hl7:addr/hl7:streetAddressLine[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.addr.line5|<axsl:text/><axsl:value-of select="hl7:addr/hl7:streetAddressLine[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.effective.high|<axsl:text/><axsl:value-of select="hl7:addr/hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr)=1">+++address/address.effective.low|<axsl:text/><axsl:value-of select="hl7:addr/hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;0">+++telecom1/use|<axsl:text/><axsl:value-of select="hl7:telecom[1]/@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;0">+++telecom1/telecom.tel|<axsl:text/><axsl:value-of select="hl7:telecom[1]/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;0">+++telecom1/telecom.effective.high|<axsl:text/><axsl:value-of select="hl7:telecom[1]/hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;0">+++telecom1/telecom.effective.low|<axsl:text/><axsl:value-of select="hl7:telecom[1]/hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;1">+++telecom2/use|<axsl:text/><axsl:value-of select="hl7:telecom[2]/@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;1">+++telecom2/telecom.tel|<axsl:text/><axsl:value-of select="hl7:telecom[2]/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;1">+++telecom2/telecom.effective.high|<axsl:text/><axsl:value-of select="hl7:telecom[2]/hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;1">+++telecom2/telecom.effective.low|<axsl:text/><axsl:value-of select="hl7:telecom[2]/hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;2">+++telecom3/use|<axsl:text/><axsl:value-of select="hl7:telecom[3]/@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;2">+++telecom3/telecom.tel|<axsl:text/><axsl:value-of select="hl7:telecom[3]/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;2">+++telecom3/telecom.effective.high|<axsl:text/><axsl:value-of select="hl7:telecom[3]/hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;2">+++telecom3/telecom.effective.low|<axsl:text/><axsl:value-of select="hl7:telecom[3]/hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;3">+++telecom4/use|<axsl:text/><axsl:value-of select="hl7:telecom[4]/@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;3">+++telecom4/telecom.tel|<axsl:text/><axsl:value-of select="hl7:telecom[4]/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;3">+++telecom4/telecom.effective.high|<axsl:text/><axsl:value-of select="hl7:telecom[4]/hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;3">+++telecom4/telecom.effective.low|<axsl:text/><axsl:value-of select="hl7:telecom[4]/hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;4">+++telecom5/use|<axsl:text/><axsl:value-of select="hl7:telecom[5]/@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;4">+++telecom5/telecom.tel|<axsl:text/><axsl:value-of select="hl7:telecom[5]/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;4">+++telecom5/telecom.effective.high|<axsl:text/><axsl:value-of select="hl7:telecom[5]/hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:telecom)&gt;4">+++telecom5/telecom.effective.low|<axsl:text/><axsl:value-of select="hl7:telecom[5]/hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/use|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.prefix|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:prefix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.suffix|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:suffix"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.givenName.name1|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:given[1]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.givenName.name2|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:given[2]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.givenName.name3|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:given[3]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.givenName.name4|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:given[4]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.givenName.name5|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:given[5]"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.familyName|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:family"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.effective.high|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:validTime/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:name)=1">+++name/name.effective.low|<axsl:text/><axsl:value-of select="hl7:player/hl7:name/hl7:validTime/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:languageCommunication)=1">+++languageCommunication/languageCode.code|<axsl:text/><axsl:value-of select="hl7:player/hl7:languageCommunication/hl7:languageCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:languageCommunication)=1">+++languageCommunication/proficiencyLevelCode.code|<axsl:text/><axsl:value-of select="hl7:player/hl7:languageCommunication/hl7:proficiencyLevelCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:languageCommunication)=1">+++languageCommunication/proficiencyLevelCode.codeSystem|<axsl:text/><axsl:value-of select="hl7:player/hl7:languageCommunication/hl7:proficiencyLevelCode/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:player/hl7:languageCommunication)=1">+++languageCommunication/preferenceInd.value|<axsl:text/><axsl:value-of select="hl7:player/hl7:languageCommunication/hl7:preferenceInd/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf1/hl7:preferredContactMethod)=1">+++preferredContacts/code.code|<axsl:text/><axsl:value-of select="hl7:subjectOf1/hl7:preferredContactMethod/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf1/hl7:preferredContactMethod)=1">+++preferredContacts/code.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf1/hl7:preferredContactMethod/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf1/hl7:preferredContactMethod)=1">+++preferredContacts/value.code|<axsl:text/><axsl:value-of select="hl7:subjectOf1/hl7:preferredContactMethod/hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf1/hl7:preferredContactMethod)=1">+++preferredContacts/value.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf1/hl7:preferredContactMethod/hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf1/hl7:preferredContactMethod)=1">+++preferredContacts/contactTimes.code|<axsl:text/><axsl:value-of select="hl7:subjectOf1/hl7:preferredContactMethod/hl7:pertinentInformation/hl7:pertinentPreferredContactTimes/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf1/hl7:preferredContactMethod)=1">+++preferredContacts/contactTimes.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf1/hl7:preferredContactMethod/hl7:pertinentInformation/hl7:pertinentPreferredContactTimes/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf1/hl7:preferredContactMethod)=1">+++preferredContacts/contactTimes.value|<axsl:text/><axsl:value-of select="hl7:subjectOf1/hl7:preferredContactMethod/hl7:pertinentInformation/hl7:pertinentPreferredContactTimes/hl7:value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat)=1">+++preferredWrittenCommunicationFormat/code.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat)=1">+++preferredWrittenCommunicationFormat/code.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat)=1">+++preferredWrittenCommunicationFormat/value.code|<axsl:text/><axsl:value-of select="hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat/hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat)=1">+++preferredWrittenCommunicationFormat/value.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat/hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf3/hl7:callCentreCallBackConsent)=1">+++callcentreCallbackConsent/code.code|<axsl:text/><axsl:value-of select="hl7:subjectOf3/hl7:callCentreCallBackConsent/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf3/hl7:callCentreCallBackConsent)=1">+++callcentreCallbackConsent/code.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf3/hl7:callCentreCallBackConsent/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf3/hl7:callCentreCallBackConsent)=1">+++callcentreCallbackConsent/value.code|<axsl:text/><axsl:value-of select="hl7:subjectOf3/hl7:callCentreCallBackConsent/hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:subjectOf3/hl7:callCentreCallBackConsent)=1">+++callcentreCallbackConsent/value.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf3/hl7:callCentreCallBackConsent/hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++role|<axsl:text/><axsl:value-of select="@classCode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="@*|*" mode="M18"/></axsl:template>

<!--PATTERN addressTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr" priority="1000" mode="M19">

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
<axsl:if test="true()">+++address.desc|<axsl:text/><axsl:value-of select="hl7:desc"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="@*|*" mode="M19"/></axsl:template>

<!--PATTERN telecomTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:telecom" priority="1000" mode="M20">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|telecom***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.1']/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++use|<axsl:text/><axsl:value-of select="@use"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++telecom.tel|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++telecom.effective.high|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:high/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++telecom.effective.low|<axsl:text/><axsl:value-of select="hl7:useablePeriod/hl7:low/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="@*|*" mode="M20"/></axsl:template>

<!--PATTERN nameTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M21">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="@*|*" mode="M21"/></axsl:template>

<!--PATTERN pcProvisionTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvision" priority="1000" mode="M22">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M22"/></axsl:template><axsl:template match="text()" priority="-1" mode="M22"/><axsl:template match="@*|node()" priority="-2" mode="M22"><axsl:apply-templates select="@*|*" mode="M22"/></axsl:template>

<!--PATTERN sharedSecretTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf5[@typeCode='SBJ']/hl7:sharedSecret[1]" priority="1000" mode="M23">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|sharedSecret***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++sharedSecret.code|<axsl:text/><axsl:value-of select="hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.35']/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++sharedSecret.value|<axsl:text/><axsl:value-of select="hl7:value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M23"/></axsl:template><axsl:template match="text()" priority="-1" mode="M23"/><axsl:template match="@*|node()" priority="-2" mode="M23"><axsl:apply-templates select="@*|*" mode="M23"/></axsl:template>

<!--PATTERN genderCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000209UK01.PartAdminGenderCode[1]" priority="1000" mode="M24">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|gender***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++gender.code|<axsl:text/><axsl:value-of select="hl7:partPerson/hl7:administrativeGenderCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.code|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.value|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:value/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M24"/></axsl:template><axsl:template match="text()" priority="-1" mode="M24"/><axsl:template match="@*|node()" priority="-2" mode="M24"><axsl:apply-templates select="@*|*" mode="M24"/></axsl:template>

<!--PATTERN birthTimeCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000210UK01.PartBirthTime[1]" priority="1000" mode="M25">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|birthTime***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthTime.value|<axsl:text/><axsl:value-of select="hl7:partPerson/hl7:birthTime/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.code|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.value|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:value/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M25"/></axsl:template><axsl:template match="text()" priority="-1" mode="M25"/><axsl:template match="@*|node()" priority="-2" mode="M25"><axsl:apply-templates select="@*|*" mode="M25"/></axsl:template>

<!--PATTERN birthOrderOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:multipleBirthOrderNumber[1]" priority="1000" mode="M26">

		<!--REPORT -->
<axsl:if test="true()">***<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|birthOrder/birthOrder.value|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M26"/></axsl:template><axsl:template match="text()" priority="-1" mode="M26"/><axsl:template match="@*|node()" priority="-2" mode="M26"><axsl:apply-templates select="@*|*" mode="M26"/></axsl:template>

<!--PATTERN deceasedTimeCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000211UK01.PartDeceasedTime[1]" priority="1000" mode="M27">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|deceasedTime***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deceasedTime.value|<axsl:text/><axsl:value-of select="hl7:partPerson/hl7:deceasedTime/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.code|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.value|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:value/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M27"/></axsl:template><axsl:template match="text()" priority="-1" mode="M27"/><axsl:template match="@*|node()" priority="-2" mode="M27"><axsl:apply-templates select="@*|*" mode="M27"/></axsl:template>

<!--PATTERN deathNotificationCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf7[1]/hl7:deathNotification[1]" priority="1000" mode="M28">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M28"/></axsl:template><axsl:template match="text()" priority="-1" mode="M28"/><axsl:template match="@*|node()" priority="-2" mode="M28"><axsl:apply-templates select="@*|*" mode="M28"/></axsl:template>

<!--PATTERN authorCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]" priority="1000" mode="M29"><axsl:variable name="authorPersonIDExt" select="hl7:subject/hl7:PdsUpdateRequest/hl7:subject/hl7:patientRole/hl7:subjectOf7/hl7:deathNotification/hl7:responsibleParty/hl7:registeringAuthority/hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id/@extension"/><axsl:variable name="authorSystemIDExt" select="hl7:subject/hl7:PdsUpdateRequest/hl7:subject/hl7:patientRole/hl7:subjectOf7/hl7:deathNotification/hl7:responsibleParty/hl7:registeringAuthority/hl7:id/@extension"/><axsl:variable name="deathStatus" select="hl7:subject/hl7:PdsUpdateRequest/hl7:subject/hl7:patientRole/hl7:subjectOf7/hl7:deathNotification/hl7:value/@code"/><axsl:variable name="hasDeathStatus" select="string-length($deathStatus)&gt;0"/><axsl:variable name="deceasedTime" select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000211UK01.PartDeceasedTime[1]/hl7:partPerson/hl7:deceasedTime/@value"/><axsl:variable name="overalUpdateMode" select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000211UK01.PartDeceasedTime[1]/@updateMode"/><axsl:variable name="assignedPerson" select="count(hl7:subject/hl7:PdsUpdateRequest/hl7:subject/hl7:patientRole/hl7:subjectOf7/hl7:deathNotification/hl7:responsibleParty/hl7:registeringAuthority/hl7:assignedRegisteringOrganization)"/><axsl:variable name="regType" select="hl7:subject/hl7:PdsUpdateRequest/hl7:subject/hl7:patientRole/hl7:subjectOf7/hl7:deathNotification/hl7:responsibleParty/hl7:registeringAuthority/hl7:code/@code"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="not($hasDeathStatus) or string-length($authorSystemIDExt)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[registeringAuthority.id]|registeringAuthority.id***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$assignedPerson=0 or string-length($authorPersonIDExt)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING_SUPP_INFO[scopedAssignedPerson.id]|scopedAssignedPerson.id***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">***BEGIN-BLOCK|forceAlter|deathRegisteringAuthority***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++regAuthorityType.code|<axsl:text/><axsl:value-of select="$regType"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++regAuthorityType.codeSystem|<axsl:text/><axsl:value-of select="hl7:subject/hl7:PdsUpdateRequest/hl7:subject/hl7:patientRole/hl7:subjectOf7/hl7:deathNotification/hl7:responsibleParty/hl7:registeringAuthority/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++authorPersonID|<axsl:text/><axsl:value-of select="$authorPersonIDExt"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++authorSystemID|<axsl:text/><axsl:value-of select="$authorSystemIDExt"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++regPerson.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringPerson/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++regPerson.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringPerson/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++regOrganisation.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:representedRegisteringOrganization/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++regOrganisation.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:representedRegisteringOrganization/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++deathStatus|<axsl:text/><axsl:value-of select="$deathStatus"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++deceasedTime|<axsl:text/><axsl:value-of select="$deceasedTime"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">+++overalUpdateMode|<axsl:text/><axsl:value-of select="$overalUpdateMode"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus and $regType ='y'">+++regPerson.root|2.16.840.1.113883.2.1.3.2.4.5+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus and $regType ='y'">+++regPerson.extension|NotProvided+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus and $regType ='y'">+++regOrganisation.root|2.16.840.1.113883.2.1.3.2.4.6+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus and $regType ='y'">+++regOrganisation.extension|NotProvided+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus and $regType !='y'">+++regPerson.root|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus and $regType !='y'">+++regPerson.extension|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus and $regType !='y'">+++regOrganisation.root|2.16.840.1.113883.2.1.4.3+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus and $regType !='y'">+++regOrganisation.extension|NotProvided+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasDeathStatus">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M29"/></axsl:template><axsl:template match="text()" priority="-1" mode="M29"/><axsl:template match="@*|node()" priority="-2" mode="M29"><axsl:apply-templates select="@*|*" mode="M29"/></axsl:template>

<!--PATTERN languageOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:languageCommunication[1]" priority="1000" mode="M30">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|language***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++languageCode.code|<axsl:text/><axsl:value-of select="hl7:languageCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++proficiencyLevelCode.code|<axsl:text/><axsl:value-of select="hl7:proficiencyLevelCode/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++proficiencyLevelCode.codeSystem|<axsl:text/><axsl:value-of select="hl7:proficiencyLevelCode/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++preferenceInd.value|<axsl:text/><axsl:value-of select="hl7:preferenceInd/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M30"/></axsl:template><axsl:template match="text()" priority="-1" mode="M30"/><axsl:template match="@*|node()" priority="-2" mode="M30"><axsl:apply-templates select="@*|*" mode="M30"/></axsl:template>

<!--PATTERN preferredWrittenCommunicationFormatOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf4[1]/hl7:preferredWrittenCommunicationFormat[1]" priority="1000" mode="M31">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|preferredWrittenCommunicationFormat***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.codeSystem|<axsl:text/><axsl:value-of select="hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M31"/></axsl:template><axsl:template match="text()" priority="-1" mode="M31"/><axsl:template match="@*|node()" priority="-2" mode="M31"><axsl:apply-templates select="@*|*" mode="M31"/></axsl:template>

<!--PATTERN healthspaceRegistrationOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf3[1]/hl7:healthspaceRegistration[1]" priority="1000" mode="M32">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|healthspaceRegistration***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.codeSystem|<axsl:text/><axsl:value-of select="hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M32"/></axsl:template><axsl:template match="text()" priority="-1" mode="M32"/><axsl:template match="@*|node()" priority="-2" mode="M32"><axsl:apply-templates select="@*|*" mode="M32"/></axsl:template>

<!--PATTERN preferredContactMethodOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf2[1]/hl7:preferredContactMethod[1]" priority="1000" mode="M33">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|preferredContactMethod***<axsl:value-of select="string('&#10;')"/></axsl:if>

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M33"/></axsl:template><axsl:template match="text()" priority="-1" mode="M33"/><axsl:template match="@*|node()" priority="-2" mode="M33"><axsl:apply-templates select="@*|*" mode="M33"/></axsl:template>

<!--PATTERN consentCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf1/hl7:consent" priority="1000" mode="M34">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="@updateMode"/><axsl:text/>|consent***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++code.codeSystem|<axsl:text/><axsl:value-of select="hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++value.codeSystem|<axsl:text/><axsl:value-of select="hl7:value/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++supplementaryComments.code|<axsl:text/><axsl:value-of select="hl7:pertinentInformation/hl7:pertinentSupplementaryComments/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++supplementaryComments.codeSystem|<axsl:text/><axsl:value-of select="hl7:pertinentInformation/hl7:pertinentSupplementaryComments/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++supplementaryComments.value|<axsl:text/><axsl:value-of select="hl7:pertinentInformation/hl7:pertinentSupplementaryComments/hl7:value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++effectiveTime.value|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M34"/></axsl:template><axsl:template match="text()" priority="-1" mode="M34"/><axsl:template match="@*|node()" priority="-2" mode="M34"><axsl:apply-templates select="@*|*" mode="M34"/></axsl:template>

<!--PATTERN birthplaceOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:COCT_MT000208UK01.BirthPlace[1]" priority="1000" mode="M35">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|<axsl:text/><axsl:value-of select="hl7:addr/@updateMode"/><axsl:text/>|birthplace***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthplace.city|<axsl:text/><axsl:value-of select="hl7:addr/hl7:city"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr/hl7:country)=1">+++birthplace.country.codeSystem|<axsl:text/><axsl:value-of select="hl7:addr/hl7:country/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:addr/hl7:country)=1">+++birthplace.country.code|<axsl:text/><axsl:value-of select="hl7:addr/hl7:country/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++birthplace.county|<axsl:text/><axsl:value-of select="hl7:addr/hl7:county"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.codeSystem|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:code/@codeSystem"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.code|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++notification.value|<axsl:text/><axsl:value-of select="hl7:subjectOf/hl7:notificationTime/hl7:value/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*" mode="M35"/></axsl:template><axsl:template match="text()" priority="-1" mode="M35"/><axsl:template match="@*|node()" priority="-2" mode="M35"><axsl:apply-templates select="@*|*" mode="M35"/></axsl:template></axsl:stylesheet>
