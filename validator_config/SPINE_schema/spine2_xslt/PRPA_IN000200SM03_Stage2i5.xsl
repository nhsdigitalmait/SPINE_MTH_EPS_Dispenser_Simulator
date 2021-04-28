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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN rootLevelCheck-->


	<!--RULE -->
<axsl:template match="*" priority="1000" mode="M3">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest/hl7:subject/hl7:patientRole)=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN messageCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]" priority="1000" mode="M4"><axsl:variable name="isGenderPresent" select="count(hl7:subject/hl7:patientRole/hl7:patientPerson[1]/hl7:administrativeGenderCode)"/><axsl:variable name="isBirthTimePresent" select="count(hl7:subject/hl7:patientRole/hl7:patientPerson[1]/hl7:birthTime)"/><axsl:variable name="isPreviousNHSContact" select="count(hl7:subject/hl7:patientRole/hl7:subjectOf5/hl7:previousNhsContact)"/><axsl:variable name="isUsualNamePresent" select="count(hl7:subject/hl7:patientRole/hl7:patientPerson[1]/hl7:name[@use='L'])"/><axsl:variable name="isaddressPresent" select="count(hl7:subject/hl7:patientRole/hl7:addr)"/><axsl:variable name="isAuthorPresent" select="count(hl7:author/hl7:registeringAuthority)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isGenderPresent=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isBirthTimePresent=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isPreviousNHSContact=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isUsualNamePresent=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$isAuthorPresent=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN addressCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr" priority="1000" mode="M5">

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
<axsl:choose><axsl:when test="count(hl7:useablePeriod/hl7:low)=0 or count(hl7:useablePeriod/hl7:high)=0 or hl7:useablePeriod/hl7:high/@value&gt;=hl7:useablePeriod/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN nameCheck-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M6">

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
<axsl:choose><axsl:when test="count(hl7:validTime/hl7:low)=0 or count(hl7:validTime/hl7:high)=0 or hl7:validTime/hl7:high/@value&gt;=hl7:validTime/hl7:low/@value"/><axsl:otherwise>***fault|ErrorBase1742.HIGH_TIME_NOT_GREATER_THAN_LOW_TIME***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN addressTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:addr" priority="1000" mode="M7">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN nameTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:name" priority="1000" mode="M8">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN pcProvisionTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:playedOtherProviderPatient/hl7:subjectOf[1]/hl7:patientCareProvision" priority="1000" mode="M9">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN genderCheckOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:administrativeGenderCode[1]" priority="1000" mode="M10">

		<!--REPORT -->
<axsl:if test="true()">***added|gender/gender.code|<axsl:text/><axsl:value-of select="@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN birthTimeCheckOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:birthTime[1]" priority="1000" mode="M11">

		<!--REPORT -->
<axsl:if test="true()">***added|birthTime/birthTime.value|<axsl:text/><axsl:value-of select="substring(@value,1,12)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN telecomTriggeredOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:telecom" priority="1000" mode="M12">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN previousNHSContact-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf5[1]/hl7:previousNhsContact[1]" priority="1000" mode="M13">

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
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN authorCheckOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]" priority="1000" mode="M14"><axsl:variable name="authorPersonID" select="hl7:author/hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:id/@extension"/><axsl:variable name="authorSystemID" select="hl7:author1/hl7:AgentSystemSDS/hl7:agentSystemSDS/hl7:id/@extension"/><axsl:variable name="hasRegisteringAuthority" select="count(hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1])&gt;0"/>

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
<axsl:if test="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@code='l'">+++regPerson.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@code='l'">+++regPerson.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++authorPersonID|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:assignedRegisteringOrganization/hl7:scopedAssignedPerson/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">+++authorSystemID|<axsl:text/><axsl:value-of select="$authorSystemID"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hasRegisteringAuthority">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN nhsNumberOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:id[1]" priority="1000" mode="M15">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|report|nhsNumber***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++nhsNumber.root|<axsl:text/><axsl:value-of select="@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++nhsNumber.extension|<axsl:text/><axsl:value-of select="@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN ignoreDuplicatesOutput-->


	<!--RULE -->
<axsl:template match="/SOAP:Envelope/SOAP:Body/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsRegistrationRequest[1]/hl7:pertinentInformation/hl7:pertinentIgnoreDuplicateRecordCriterion" priority="1000" mode="M16">

		<!--REPORT -->
<axsl:if test="count(hl7:value)=1">+++report|ignoreDuplicates|<axsl:text/><axsl:value-of select="hl7:value/@value"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template></axsl:stylesheet>
