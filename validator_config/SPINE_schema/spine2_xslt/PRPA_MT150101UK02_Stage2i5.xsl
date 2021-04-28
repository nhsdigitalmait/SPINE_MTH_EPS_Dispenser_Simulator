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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M2"/><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN deathUpdateCrossCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]" priority="1000" mode="M2"><axsl:variable name="deceasedTime" select="count(hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson/hl7:deceasedTime)"/><axsl:variable name="deathNotification" select="count(hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf/hl7:deathNotification)"/><axsl:variable name="author" select="count(hl7:author)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$deceasedTime=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$deathNotification=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$author=1"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M2"/></axsl:template><axsl:template match="text()" priority="-1" mode="M2"/><axsl:template match="@*|node()" priority="-2" mode="M2"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M2"/></axsl:template>

<!--PATTERN deceasedTimeCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[@nullFlavor='NA']" priority="1000" mode="M3">

		<!--REPORT -->
<axsl:if test="true()">***fault|ErrorBase1742.SOURCE_CANNOT_REMOVE_DATE_OF_DEATH***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN deathNotificationCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf[1]/hl7:deathNotification/hl7:value[@nullFlavor='NA']" priority="1000" mode="M4">

		<!--REPORT -->
<axsl:if test="true()">***fault|ErrorBase1742.SOURCE_CANNOT_REMOVE_DATE_OF_DEATH***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN registeringAuthorityCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]" priority="1000" mode="M5">

		<!--ASSERT -->
<axsl:choose><axsl:when test="hl7:code/@code='1'"/><axsl:otherwise>***fault|ErrorBase1742.INVALID_REGISTERING_AUTHORITY_TYPE***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:assignedRegisteringPerson)=0"/><axsl:otherwise>***fault|ErrorBase1742.INVALID_ASSIGNED_REGISTERING_PERSON***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:variable name="OrgRoot" select="hl7:representedRegisteringOrganization/hl7:id/@root"/><axsl:variable name="OrgExt" select="hl7:representedRegisteringOrganization/hl7:id/@extension"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length($OrgRoot)&gt;0 and string-length($OrgExt)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN deceasedTimeCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]" priority="1000" mode="M6">

		<!--REPORT -->
<axsl:if test="true()">***forceAlter|deceasedTime/deceasedTime.value|<axsl:text/><axsl:value-of select="@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN deathNotificationCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]/hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:subjectOf/hl7:deathNotification" priority="1000" mode="M7">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|forceAlter|deathNotification***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.code.code|<axsl:text/><axsl:value-of select="hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.code.codeSystem|2.16.840.1.113883.2.1.3.2.4.17.35+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.value.code|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathNotification.value.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.5+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN authorCheckOutput-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent[1]" priority="1000" mode="M8"><axsl:variable name="authorPersonID" select="hl7:author/hl7:assignedEntity/hl7:id/@extension"/><axsl:variable name="authorSystemID" select="hl7:author/hl7:assignedEntity/hl7:representedOrganization/hl7:id/@extension"/>

		<!--REPORT -->
<axsl:if test="string-length($authorPersonID)=0 or string-length($authorSystemID)=0">***fault|ErrorBase1742.MANDATORY_FIELD_MISSING***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="deathStatus" select="hl7:subject/hl7:PdsUpdateRequest/hl7:subject/hl7:patientRole/hl7:subjectOf/hl7:deathNotification/hl7:value/@code"/><axsl:variable name="deceasedTime" select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:subject[1]/hl7:patientRole[1]/hl7:patientPerson[1]/hl7:deceasedTime[1]/@value"/>

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-BLOCK|forceAlter|deathRegisteringAuthority***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regAuthorityType.code|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:code/@code"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regAuthorityType.codeSystem|2.16.840.1.113883.2.1.3.2.4.16.20+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regOrganisation.root|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:representedRegisteringOrganization/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++regOrganisation.extension|<axsl:text/><axsl:value-of select="hl7:subject[1]/hl7:PdsUpdateRequest[1]/hl7:author[1]/hl7:registeringAuthority[1]/hl7:representedRegisteringOrganization/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++authorPersonID|<axsl:text/><axsl:value-of select="$authorPersonID"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++authorSystemID|<axsl:text/><axsl:value-of select="$authorSystemID"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deathStatus|<axsl:text/><axsl:value-of select="$deathStatus"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++deceasedTime|<axsl:text/><axsl:value-of select="$deceasedTime"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++overalUpdateMode|added+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++p1r1Flag|True+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-BLOCK***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template></axsl:stylesheet>
