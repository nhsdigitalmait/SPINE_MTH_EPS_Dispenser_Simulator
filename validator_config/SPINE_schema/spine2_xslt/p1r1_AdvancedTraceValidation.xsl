<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M1"/><axsl:apply-templates select="/" mode="M2"/><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/><axsl:apply-templates select="/" mode="M9"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN basicLayout-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActProcess" priority="1000" mode="M1">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pdsAdvancedTraceQuery/hl7:person.administrativeGenderCode/hl7:value)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_MANDATORY_SEARCH_FIELD_AT|missing genderCode***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.administrativeGenderCode/hl7:value)&gt;1">***fault|ErrorBase1742.DUPLICATE_SEARCH_FIELDS_PROVIDED|multiple genderCode provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.birthTime/hl7:value/*)&gt;2">***fault|ErrorBase1742.ILLEGAL_DATE_FORMAT|multiple birthTime provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.birthTime/hl7:value/@value)&gt;1">***fault|ErrorBase1742.ILLEGAL_DATE_FORMAT|multiple birthTime provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.birthTime/hl7:value/hl7:center)=1 and count(hl7:pdsAdvancedTraceQuery/hl7:person.birthTime/hl7:value/*)&gt;1">***fault|ErrorBase1742.ILLEGAL_DATE_FORMAT***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.birthTime/hl7:value/@value)=1 and count(hl7:pdsAdvancedTraceQuery/hl7:person.birthTime/hl7:value)&gt;1">***fault|ErrorBase1742.ILLEGAL_DATE_FORMAT***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.deceasedTime/hl7:value/*)&gt;2">***fault|ErrorBase1742.ILLEGAL_DATE_FORMAT|multiple deceasedTime provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.deceasedTime/hl7:value/@value)&gt;1">***fault|ErrorBase1742.ILLEGAL_DATE_FORMAT|multiple deceasedTime provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.deceasedTime/hl7:value/hl7:center)=1 and count(hl7:pdsAdvancedTraceQuery/hl7:person.deceasedTime/hl7:value/*)&gt;1">***fault|ErrorBase1742.ILLEGAL_DATE_FORMAT|multiple deceasedTime provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.deceasedTime/hl7:value/@value)=1 and count(hl7:pdsAdvancedTraceQuery/hl7:person.deceasedTime/hl7:value)&gt;1">***fault|ErrorBase1742.ILLEGAL_DATE_FORMAT|multiple deceasedTime provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pdsAdvancedTraceQuery/hl7:person.name/hl7:value/*)&gt;0"/><axsl:otherwise>***fault|ErrorBase1742.MISSING_MANDATORY_SEARCH_FIELD_AT|missing person name***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.name/hl7:value)&gt;1">***fault|ErrorBase1742.DUPLICATE_SEARCH_FIELDS_PROVIDED|multiple person name provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pdsAdvancedTraceQuery/hl7:person.name/hl7:value/hl7:family)&gt;1">***fault|ErrorBase1742.DUPLICATE_SEARCH_FIELDS_PROVIDED|multiple person surname provided***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M1"/></axsl:template><axsl:template match="text()" priority="-1" mode="M1"/><axsl:template match="@*|node()" priority="-2" mode="M1"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M1"/></axsl:template>

<!--PATTERN administrativeGenderCodeCheck-->


	<!--RULE -->
<axsl:template match="/*/*/hl7:pdsAdvancedTraceQuery/hl7:person.administrativeGenderCode" priority="1000" mode="M2">

		<!--ASSERT -->
<axsl:choose><axsl:when test="hl7:value/@code='0' or hl7:value/@code='1' or hl7:value/@code='2' or hl7:value/@code='9'"/><axsl:otherwise>***fault|ErrorBase1742.INVALID_SEARCH_DATA|invalid administrativeGenderCode value provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|administrativeGenderCode|<axsl:text/><axsl:value-of select="hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M2"/></axsl:template><axsl:template match="text()" priority="-1" mode="M2"/><axsl:template match="@*|node()" priority="-2" mode="M2"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M2"/></axsl:template>

<!--PATTERN birthTimeCheck-->


	<!--RULE -->
<axsl:template match="/*/*/hl7:pdsAdvancedTraceQuery/hl7:person.birthTime" priority="1000" mode="M3">

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:center/@value)=1">***report|birthTime_center|<axsl:text/><axsl:value-of select="hl7:value/hl7:center/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/@value)=1">***report|birthTime_center|<axsl:text/><axsl:value-of select="hl7:value/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|birthTime_low|<axsl:text/><axsl:value-of select="hl7:value/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|birthTime_high|<axsl:text/><axsl:value-of select="hl7:value/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/@nullFlavor)=1">***report|birthTime_low|19000101***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN deceasedTimeCheck-->


	<!--RULE -->
<axsl:template match="/*/*/hl7:pdsAdvancedTraceQuery/hl7:person.deceasedTime" priority="1000" mode="M4">

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:center/@value)=1">***report|deceasedTime_center|<axsl:text/><axsl:value-of select="hl7:value/hl7:center/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/@value)=1">***report|deceasedTime_center|<axsl:text/><axsl:value-of select="hl7:value/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|deceasedTime_low|<axsl:text/><axsl:value-of select="hl7:value/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|deceasedTime_high|<axsl:text/><axsl:value-of select="hl7:value/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/@nullFlavor)=1">***report|deceasedTime_low|19000101***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN nhsNumberCheck-->


	<!--RULE -->
<axsl:template match="/*/*/hl7:pdsAdvancedTraceQuery/hl7:person.id" priority="1000" mode="M5">

		<!--REPORT -->
<axsl:if test="count(hl7:value)&gt;1">***fault|ErrorBase1742.INVALID_SEARCH_DATA|multiple nhsNumber provided***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.4.1'])=1">***report|nhsNumber|<axsl:text/><axsl:value-of select="hl7:value[@root='2.16.840.1.113883.2.1.4.1']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN nameReport-->


	<!--RULE -->
<axsl:template match="/*/*/hl7:pdsAdvancedTraceQuery/hl7:person.name" priority="1000" mode="M6">

		<!--REPORT -->
<axsl:if test="hl7:value/hl7:family">***report|name.family|<axsl:text/><axsl:value-of select="hl7:value/hl7:family"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|givenNameCount|<axsl:text/><axsl:value-of select="count(hl7:value/hl7:given)"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/hl7:given[1]">***report|name.given|<axsl:text/><axsl:value-of select="hl7:value/hl7:given[1]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/hl7:given[2]">***report|name.otherGiven1|<axsl:text/><axsl:value-of select="hl7:value/hl7:given[2]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/hl7:given[3]">***report|name.otherGiven2|<axsl:text/><axsl:value-of select="hl7:value/hl7:given[3]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/hl7:given[4]">***report|name.otherGiven3|<axsl:text/><axsl:value-of select="hl7:value/hl7:given[4]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:value/hl7:given[5]">***report|name.otherGiven4|<axsl:text/><axsl:value-of select="hl7:value/hl7:given[5]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN addressReport-->


	<!--RULE -->
<axsl:template match="/*/*/hl7:pdsAdvancedTraceQuery/hl7:person.address" priority="1000" mode="M7">

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:streetAddressLine)=1">***report|address.streetAddressLine1|<axsl:text/><axsl:value-of select="hl7:value/hl7:streetAddressLine[1]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:streetAddressLine)=2">***report|address.streetAddressLine2|<axsl:text/><axsl:value-of select="hl7:value/hl7:streetAddressLine[2]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:streetAddressLine)=3">***report|address.streetAddressLine3|<axsl:text/><axsl:value-of select="hl7:value/hl7:streetAddressLine[3]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:streetAddressLine)=4">***report|address.streetAddressLine4|<axsl:text/><axsl:value-of select="hl7:value/hl7:streetAddressLine[4]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:streetAddressLine)=5">***report|address.streetAddressLine5|<axsl:text/><axsl:value-of select="hl7:value/hl7:streetAddressLine[5]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:value/hl7:postalCode)=1">***report|address.postalCode|<axsl:text/><axsl:value-of select="hl7:value/hl7:postalCode"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN primaryCareCheck-->


	<!--RULE -->
<axsl:template match="/*/*/hl7:pdsAdvancedTraceQuery/hl7:primaryCare.id" priority="1000" mode="M8">

		<!--REPORT -->
<axsl:if test="count(hl7:value[@root='2.16.840.1.113883.2.1.4.2'])=1 or count(hl7:value[@root='2.16.840.1.113883.2.1.4.3'])=1">***report|primaryCareId|<axsl:text/><axsl:value-of select="hl7:value/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M8"/></axsl:template>

<!--PATTERN nhaisPostingReport-->


	<!--RULE -->
<axsl:template match="/*/*/hl7:pdsAdvancedTraceQuery/hl7:nhais.posting" priority="1000" mode="M9">

		<!--REPORT -->
<axsl:if test="hl7:value[1]">***report|nhais.posting|<axsl:text/><axsl:value-of select="hl7:value[1]"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template></axsl:stylesheet>
