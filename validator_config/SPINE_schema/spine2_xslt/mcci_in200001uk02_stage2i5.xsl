<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hl7="urn:hl7-org:v3" xmlns:npfit="urn:cfh-nhs-uk:npfit" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M3"/><axsl:apply-templates select="/" mode="M4"/><axsl:apply-templates select="/" mode="M5"/><axsl:apply-templates select="/" mode="M6"/><axsl:apply-templates select="/" mode="M7"/><axsl:apply-templates select="/" mode="M8"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN BatchItemChecks-->


	<!--RULE -->
<axsl:template match="/*[1]" priority="1000" mode="M3"><axsl:variable name="manifestItemCount" select="count(hl7:manifestItem)"/><axsl:variable name="totalInteractionCount" select="count(npfit:batchControlActEvent/npfit:batchControlActItem)"/><axsl:variable name="messageIdCount" select="count(npfit:batchControlActEvent/npfit:batchControlActItem[string-length(@messageId) &gt; 0])"/><axsl:variable name="retrieveInteractionCount" select="count(npfit:batchControlActEvent/npfit:batchControlActItem[@interaction='QUPA_IN040000UK32' or @interaction='QUPA_IN000008UK02'])"/><axsl:variable name="simpleTraceInteractionCount" select="count(npfit:batchControlActEvent/npfit:batchControlActItem[@interaction='QUPA_IN010000UK32' or @interaction='QUPA_IN000005UK01'])"/><axsl:variable name="supportedInteractionCount" select="$retrieveInteractionCount + $simpleTraceInteractionCount"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$manifestItemCount = $totalInteractionCount"/><axsl:otherwise>***fault|ErrorBase1732.BATCH_INCONSISTENT_WITH_MANIFEST***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$totalInteractionCount = $supportedInteractionCount"/><axsl:otherwise>***fault|ErrorBase1732.BATCH_CONTAINS_NON_BATCHABLE_INTERACTION***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$totalInteractionCount = $messageIdCount"/><axsl:otherwise>***fault|ErrorBase1732.MESSAGE_ID_EMPTY***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template><axsl:template match="text()" priority="-1" mode="M3"/><axsl:template match="@*|node()" priority="-2" mode="M3"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M3"/></axsl:template>

<!--PATTERN ReportBatchInfo-->


	<!--RULE -->
<axsl:template match="npfit:MCCI_IN200001UK02" priority="1000" mode="M4">

		<!--REPORT -->
<axsl:if test="true()">***report|batchSequenceNumber|<axsl:text/><axsl:value-of select="hl7:batchSequenceNo/hl7:value/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template><axsl:template match="text()" priority="-1" mode="M4"/><axsl:template match="@*|node()" priority="-2" mode="M4"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M4"/></axsl:template>

<!--PATTERN retrieveReport-->


	<!--RULE -->
<axsl:template match="npfit:MCCI_IN200001UK02/npfit:batchControlActEvent/npfit:batchControlActItem[@interaction='QUPA_IN040000UK32']/hl7:subject/hl7:query" priority="1000" mode="M5"><axsl:variable name="nhsNumberElement" select="hl7:person.id/hl7:value"/><axsl:variable name="hdIndicatorElement" select="hl7:historicDataIndicator/hl7:value"/>

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-LIST-ENTRY|report|retrieveRequests***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'messageId|', ancestor::node()[2]/@messageId, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'interaction|', ancestor::node()[2]/@interaction, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count($nhsNumberElement)=1"><axsl:text/><axsl:value-of select="concat('+++', 'nhsNumber|', $nhsNumberElement/@extension, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hdIndicatorElement"><axsl:text/><axsl:value-of select="concat('+++', 'hdIndicator|', $hdIndicatorElement/@code, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[1]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem1|', hl7:retrievalItem[1]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[2]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem2|', hl7:retrievalItem[2]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[3]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem3|', hl7:retrievalItem[3]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[4]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem4|', hl7:retrievalItem[4]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[5]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem5|', hl7:retrievalItem[5]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[6]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem6|', hl7:retrievalItem[6]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[7]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem7|', hl7:retrievalItem[7]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[8]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem8|', hl7:retrievalItem[8]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[9]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem9|', hl7:retrievalItem[9]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[10]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem10|', hl7:retrievalItem[10]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[11]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem11|', hl7:retrievalItem[11]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[12]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem12|', hl7:retrievalItem[12]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[13]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem13|', hl7:retrievalItem[13]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[14]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem14|', hl7:retrievalItem[14]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:retrievalItem)=0"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem1|person.scn', '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-LIST-ENTRY***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template><axsl:template match="text()" priority="-1" mode="M5"/><axsl:template match="@*|node()" priority="-2" mode="M5"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M5"/></axsl:template>

<!--PATTERN simpleTraceReport-->


	<!--RULE -->
<axsl:template match="npfit:MCCI_IN200001UK02/npfit:batchControlActEvent/npfit:batchControlActItem[@interaction='QUPA_IN010000UK32']/hl7:subject/hl7:query" priority="1000" mode="M6">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-LIST-ENTRY|report|simpleTraceRequests***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'messageId|', ancestor::node()[2]/@messageId, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'interaction|', ancestor::node()[2]/@interaction, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'administrativeGenderCode|', hl7:person.administrativeGenderCode/hl7:value/@code, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'birthTime|', hl7:person.birthTime/hl7:value/@value, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="nameElement" select="hl7:person.name/hl7:value"/>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'name.family|', $nameElement/hl7:family, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'givenNameCount|', count($nameElement/hl7:given), '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[1]"><axsl:text/><axsl:value-of select="concat('+++', 'name.given|', $nameElement/hl7:given[1], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[2]"><axsl:text/><axsl:value-of select="concat('+++', 'name.otherGiven1|', $nameElement/hl7:given[2], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[3]"><axsl:text/><axsl:value-of select="concat('+++', 'name.otherGiven2|', $nameElement/hl7:given[3], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[4]"><axsl:text/><axsl:value-of select="concat('+++', 'name.otherGiven3|', $nameElement/hl7:given[4], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[5]"><axsl:text/><axsl:value-of select="concat('+++', 'name.otherGiven4|', $nameElement/hl7:given[5], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:person.deceasedTime"><axsl:text/><axsl:value-of select="concat('+++', 'deceasedTime|', hl7:person.deceasedTime/hl7:value/@value, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:person.address/hl7:value/hl7:postalCode"><axsl:text/><axsl:value-of select="concat('+++', 'address.postalCode|', hl7:person.address/hl7:value/hl7:postalCode, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:person.address/hl7:value/hl7:addressKey"><axsl:text/><axsl:value-of select="concat('+++', 'address.addressKey|', hl7:person.address/hl7:value/hl7:addressKey, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-LIST-ENTRY***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template><axsl:template match="text()" priority="-1" mode="M6"/><axsl:template match="@*|node()" priority="-2" mode="M6"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/></axsl:template>

<!--PATTERN retrieveReport_mim63-->


	<!--RULE -->
<axsl:template match="npfit:MCCI_IN200001UK02/npfit:batchControlActEvent/npfit:batchControlActItem[@interaction='QUPA_IN000008UK02']/hl7:subject/hl7:query" priority="1000" mode="M7"><axsl:variable name="nhsNumberElement" select="hl7:person.id/hl7:value"/><axsl:variable name="hdIndicatorElement" select="hl7:historicDataIndicator/hl7:value"/>

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-LIST-ENTRY|report|retrieveRequests***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'messageId|', ancestor::node()[2]/@messageId, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'interaction|', ancestor::node()[2]/@interaction, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count($nhsNumberElement)=1"><axsl:text/><axsl:value-of select="concat('+++', 'nhsNumber|', $nhsNumberElement/@extension, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$hdIndicatorElement"><axsl:text/><axsl:value-of select="concat('+++', 'hdIndicator|', $hdIndicatorElement/@code, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[1]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem1|', hl7:retrievalItem[1]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[2]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem2|', hl7:retrievalItem[2]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[3]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem3|', hl7:retrievalItem[3]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[4]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem4|', hl7:retrievalItem[4]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[5]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem5|', hl7:retrievalItem[5]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[6]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem6|', hl7:retrievalItem[6]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[7]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem7|', hl7:retrievalItem[7]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[8]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem8|', hl7:retrievalItem[8]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[9]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem9|', hl7:retrievalItem[9]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[10]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem10|', hl7:retrievalItem[10]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[11]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem11|', hl7:retrievalItem[11]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[12]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem12|', hl7:retrievalItem[12]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[13]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem13|', hl7:retrievalItem[13]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:retrievalItem[14]"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem14|', hl7:retrievalItem[14]/hl7:semanticsText, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:retrievalItem)=0"><axsl:text/><axsl:value-of select="concat('+++', 'retrievalItem1|person.scn', '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-LIST-ENTRY***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template><axsl:template match="text()" priority="-1" mode="M7"/><axsl:template match="@*|node()" priority="-2" mode="M7"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/></axsl:template>

<!--PATTERN simpleTraceReport_mim63-->


	<!--RULE -->
<axsl:template match="npfit:MCCI_IN200001UK02/npfit:batchControlActEvent/npfit:batchControlActItem[@interaction='QUPA_IN000005UK01']/hl7:subject/hl7:query" priority="1000" mode="M8">

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-LIST-ENTRY|report|simpleTraceRequests***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'messageId|', ancestor::node()[2]/@messageId, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'interaction|', ancestor::node()[2]/@interaction, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'administrativeGenderCode|', hl7:person.administrativeGenderCode/hl7:value/@code, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'birthTime|', hl7:person.birthTime/hl7:value/@value, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="nameElement" select="hl7:person.name/hl7:value"/>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'name.family|', $nameElement/hl7:family, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()"><axsl:text/><axsl:value-of select="concat('+++', 'givenNameCount|', count($nameElement/hl7:given), '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[1]"><axsl:text/><axsl:value-of select="concat('+++', 'name.given|', $nameElement/hl7:given[1], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[2]"><axsl:text/><axsl:value-of select="concat('+++', 'name.otherGiven1|', $nameElement/hl7:given[2], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[3]"><axsl:text/><axsl:value-of select="concat('+++', 'name.otherGiven2|', $nameElement/hl7:given[3], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[4]"><axsl:text/><axsl:value-of select="concat('+++', 'name.otherGiven3|', $nameElement/hl7:given[4], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="$nameElement/hl7:given[5]"><axsl:text/><axsl:value-of select="concat('+++', 'name.otherGiven4|', $nameElement/hl7:given[5], '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:person.deceasedTime"><axsl:text/><axsl:value-of select="concat('+++', 'deceasedTime|', hl7:person.deceasedTime/hl7:value/@value, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:person.address/hl7:value/hl7:postalCode"><axsl:text/><axsl:value-of select="concat('+++', 'address.postalCode|', hl7:person.address/hl7:value/hl7:postalCode, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="hl7:person.address/hl7:value/hl7:addressKey"><axsl:text/><axsl:value-of select="concat('+++', 'address.addressKey|', hl7:person.address/hl7:value/hl7:addressKey, '+++')"/><axsl:text/><axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-LIST-ENTRY***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template><axsl:template match="text()" priority="-1" mode="M8"/><axsl:template match="@*|node()" priority="-2" mode="M8"><axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M8"/></axsl:template></axsl:stylesheet>
