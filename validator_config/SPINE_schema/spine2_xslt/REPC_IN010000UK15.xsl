<?xml version="1.0" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:DigSig="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:hl7ebxml="urn:hl7-org:transport/ebXML/DSTUv1.0" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/><axsl:apply-templates select="/" mode="M22"/><axsl:apply-templates select="/" mode="M23"/><axsl:apply-templates select="/" mode="M24"/><axsl:apply-templates select="/" mode="M25"/><axsl:apply-templates select="/" mode="M26"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN checkAuthorPerson-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Body[1]/*[1]/hl7:ControlActEvent[1]/hl7:author" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:AgentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.CONTROL_ACT_AUTHOR_INVALID[checkAuthorPerson.invalidAgentRoleID]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.65']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.CONTROL_ACT_AUTHOR_INVALID[checkAuthorPerson.invalidAgentPersonID]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:AgentPersonSDS/hl7:part/hl7:partSDSRole/hl7:id[@root='1.2.826.0.1285.0.2.1.104']/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1732.CONTROL_ACT_AUTHOR_INVALID[checkAuthorPerson.invalidPartSDSRoleID]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN reportAuthorPerson-->


	<!--RULE -->
<axsl:template match="SOAP:Envelope[1]/SOAP:Body[1]/*[1]/hl7:ControlActEvent[1]/hl7:author" priority="1000" mode="M10">

		<!--REPORT -->
<axsl:if test="true()">***report|agentPersonSDSRole|<axsl:text/><axsl:value-of select="hl7:AgentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.67']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|agentPersonSDSPerson|<axsl:text/><axsl:value-of select="hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.65']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|agentPersonSDSTargetRole|<axsl:text/><axsl:value-of select="hl7:AgentPersonSDS/hl7:part/hl7:partSDSRole/hl7:id[@root='1.2.826.0.1285.0.2.1.104']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN BodyChecks-->


	<!--RULE -->
<axsl:template match="/*" priority="1000" mode="M11"><axsl:variable name="MessageGUID" select="hl7:id/@root"/><axsl:variable name="InteractionID" select="hl7:interactionId/@extension"/><axsl:variable name="SenderAsid" select="hl7:communicationFunctionSnd/hl7:device/hl7:id/@extension"/>

		<!--REPORT -->
<axsl:if test="string-length($MessageGUID)&gt;36">***fault|ErrorBase1712.UUID_TOO_LONG***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length($InteractionID)&gt;17">***fault|ErrorBase1712.INTERACTION_ID_TOO_LONG***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length($SenderAsid)&gt;12">***fault|ErrorBase1712.ACCREDITED_SYSTEM_ID_TOO_LONG|<axsl:text/><axsl:value-of select="$SenderAsid"/><axsl:text/>|12***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id)=1 and string-length(hl7:id/@root)&gt;0"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|id or id root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:creationTime)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST_WITH_SUPP_INFO|creationTime missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:creationTime/@value)=12 or string-length(hl7:creationTime/@value)=14 or string-length(hl7:creationTime/@value)=19"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST_WITH_SUPP_INFO|creationTime not YYYYMMDDHHMMSS[+|-ZZzz]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:versionCode)=1 and string-length(hl7:versionCode/@code)&gt;0"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|versionCode missing or blank***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionRcv/hl7:device/hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|communicationFunctionRcv ID root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:communicationFunctionSnd/hl7:device/hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST|communicationFunctionSnd ID root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|messageID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:creationTime/@value)=14 or string-length(hl7:creationTime/@value)=19">***report|hl7eventTime|<axsl:text/><axsl:value-of select="hl7:creationTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length(hl7:creationTime/@value)=12">***report|hl7eventTime|<axsl:text/><axsl:value-of select="hl7:creationTime/@value"/><axsl:text/>00***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|toASID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionRcv/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|fromASID|<axsl:text/><axsl:value-of select="hl7:communicationFunctionSnd/hl7:device/hl7:id[@root='1.2.826.0.1285.0.2.0.107']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN LRCreateBodyCheck-->


	<!--RULE -->
<axsl:template match="/*" priority="1000" mode="M12">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ControlActEvent/hl7:subject/hl7:CreateRequest)=1"/><axsl:otherwise>***fault|ErrorBase1733.INVALID_REQUEST[missingCreateRequest]|CreateRequest Root missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN CreateRequest-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest" priority="1000" mode="M13">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reasonCode)=1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing reasonCode***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime) &lt; 2"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST|missing effectiveTime***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:effectiveTime/@value) = 14 or count(hl7:effectiveTime) = 0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_DATE_WITH_SUPP_INFO[effective time is of incorrect length]|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>|YYYYMMDDHHMMSS***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:subject) = 1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing subject***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget) = 1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing recordTarget***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:author) = 1"/><axsl:otherwise>***fault|ErrorBase1712.MANDATORY_DATA_MISSING|missing author***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation) &lt; 2"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST|missing pertinentInformation***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reason) &lt; 2"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST|missing reason***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN CreateRequest-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest" priority="1000" mode="M14">

		<!--REPORT -->
<axsl:if test="true()">***report|effectiveTime|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|lrTypeCode|<axsl:text/><axsl:value-of select="hl7:reasonCode/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|lrTypeCodeSystem|<axsl:text/><axsl:value-of select="hl7:reasonCode/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN AuthorElementCheck-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN010000UK15/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:author" priority="1000" mode="M15"><axsl:variable name="authorUserCount" select="count(hl7:AgentPerson)"/><axsl:variable name="authorUserRPRootCount" select="count(hl7:AgentPerson/hl7:id[@root])"/><axsl:variable name="authorSystemCount" select="count(hl7:AgentDeviceSDS)"/><axsl:variable name="authorUserIdCount" select="count(hl7:AgentPerson/hl7:agentPersonSDS/hl7:id)"/><axsl:variable name="authorUserRPIdCount" select="count(hl7:AgentPerson/hl7:id)"/><axsl:variable name="authorSystemDeviceIdCount" select="count(hl7:AgentDeviceSDS/hl7:agentDeviceSDS/hl7:id)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$authorUserCount + $authorSystemCount = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_SYSTEM_MISSING|validation error - an author of type user or system must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$authorUserRPRootCount + $authorSystemCount = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_URPID_MISSING|validation error - author User role profile must be provided if no author system***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$authorUserIdCount + $authorSystemCount = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_ID_MISSING|validation error - an author user id must be provided if no author system given***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$authorUserRPIdCount + $authorSystemCount = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_URPID_MISSING|validation error - an author user role profile id must be provided if no author system given***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN SubjectElementCheck-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN010000UK15/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:subject" priority="1000" mode="M16"><axsl:variable name="subjectUserCount" select="count(hl7:AgentPersonSDS)"/><axsl:variable name="subjectWorkgroupCount" select="count(hl7:AgentOrgSDS)"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$subjectUserCount + $subjectWorkgroupCount = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_ELEMENT[eitherUserOrWorkgroup]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN LrTypeCheck-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN010000UK15/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest" priority="1000" mode="M17">

		<!--REPORT -->
<axsl:if test="string-length(hl7:reasonCode/@code)=0">***fault|ErrorBase1712.LR_TYPE_EMPTY[missingLrType]***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:reasonCode[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.11']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.REASONCODE_OID[invalidReasonCodeCodeSystem]|<axsl:text/><axsl:value-of select="hl7:reasonCode/@codeSystem"/><axsl:text/>|2.16.840.1.113883.2.1.3.2.4.16.11***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:reasonCode/@code) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.LR_TYPE_EMPTY[LR Type is empty]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:reasonCode/@code)=2"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_LRTYPE[invalid LR Type]|<axsl:text/><axsl:value-of select="hl7:reasonCode/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|lrTypeCode|<axsl:text/><axsl:value-of select="hl7:reasonCode/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|lrTypeCodeSystem|<axsl:text/><axsl:value-of select="hl7:reasonCode/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN SubjectUserCheck-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN010000UK15/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:subject/hl7:AgentPersonSDS" priority="1000" mode="M18">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_URPID_MISSING[subjectUserRoleProfileIdMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@extension) = 1"/><axsl:otherwise>***fault|ErrorBase1712.URPID_EMPTY[subjectUserRoleProfileIdExtensionMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.URPID_EMPTY[subjectUserRoleProfileIdEmpty]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&lt;=12"/><axsl:otherwise>***fault|ErrorBase1712.URPID_TOO_LONG[subjectUserRoleProfileIdTooLong]|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>|12***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentPersonSDS/hl7:id)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_USER_ID_MISSING[subjectUserIdMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentPersonSDS/hl7:id/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_USER_ID_MISSING[subjectUserIdExtensionMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentPersonSDS/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.JOB_ROLE_ID_NULL[subjectUserRoleIdEmpty]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentPersonSDS/hl7:id/@extension)&lt;=12"/><axsl:otherwise>***fault|ErrorBase1712.USER_ID_TOO_LONG[subjectUserRoleIdTooLong]|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id/@extension"/><axsl:text/>|12***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|person.roleProfileId.codeSystem|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|person.roleProfileId.code|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|person.sdsPersonId.codeSystem|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|person.sdsPersonId.code|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN patient checks-->


	<!--RULE -->
<axsl:template match="//hl7:REPC_IN010000UK15/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:recordTarget" priority="1000" mode="M19"><axsl:variable name="patientIDCount" select="count(hl7:patient)"/><axsl:variable name="patientID" select="hl7:patient/hl7:id/@extension"/><axsl:variable name="patientIdOID" select="hl7:patient/hl7:id/@root"/><axsl:variable name="patientIdOIDCount" select="count(hl7:patient/hl7:id[@root='2.16.840.1.113883.2.1.4.1'])"/>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$patientIDCount = 1"/><axsl:otherwise>***fault|ErrorBase1712.PATIENT_ID_EMPTY[recordTargetPatientMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length($patientID)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.PATIENT_ID_EMPTY[recordTargetPatientEmpty]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length($patientID)&lt;=10"/><axsl:otherwise>***fault|ErrorBase1712.PATIENT_ID_TOO_LONG[recordTargetPatientTooLong]|<axsl:text/><axsl:value-of select="$patientID"/><axsl:text/>|10***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="$patientIdOIDCount=1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_OID|PatientOID|<axsl:text/><axsl:value-of select="$patientIdOID"/><axsl:text/>|2.16.840.1.113883.2.1.4.1***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumberCodeSystem|<axsl:text/><axsl:value-of select="hl7:patient/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|nhsNumberCode|<axsl:text/><axsl:value-of select="hl7:patient/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template>

<!--PATTERN workgroupsCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:subject/hl7:AgentOrgSDS" priority="1000" mode="M20">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentOrganizationSDS)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_WORKGROUP_ID_MISSING[agentOrganizationSDSMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentOrganizationSDS/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_WORKGROUP_ID_MISSING[agentOrganizationSDSExtensionMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:code) = count(hl7:code/@code)"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_ELEMENT[subject code must contain code attribute]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id) = count(hl7:id/@root)"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_ELEMENT[subject id must contain attribute root]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id) = count(hl7:id/@extension)"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_ELEMENT[subject id must contain attribute extension]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentOrganizationSDS/hl7:id) = count(hl7:agentOrganizationSDS/hl7:id/@root)"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_SUBJECT_ELEMENT[subject agentOrganization id must contain root attribute]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:variable name="subjectWorkgroupCount" select="count(hl7:agentOrganizationSDS/hl7:id)"/><axsl:variable name="subjectWorkgroupId" select="hl7:agentOrganizationSDS/hl7:id/@extension"/>

		<!--REPORT -->
<axsl:if test="$subjectWorkgroupCount=0">***fault|ErrorBase1712.WORKGROUP_ID_EMPTY***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length($subjectWorkgroupId)=0">***fault|ErrorBase1712.WORKGROUP_ID_EMPTY***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="string-length($subjectWorkgroupId)&gt;12">***fault|ErrorBase1712.WORKGROUP_ID_TOO_LONG|<axsl:text/><axsl:value-of select="$subjectWorkgroupId"/><axsl:text/>|12***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id) = count(hl7:id[@root='1.2.826.0.1285.0.2.0.67'])"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[subject id root must be correct]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id) = 0 or string-length(hl7:id/@extension) = 12"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[subject id extension must contain 12 characters]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentOrganizationSDS) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[subject agentOrganization must be provided]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.1.10']) + count(hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.109']) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[subject agentOrganizationSDS id root attribute must be correct]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template>

<!--PATTERN workgroupsReport-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:subject/hl7:AgentOrgSDS" priority="1000" mode="M21">

		<!--REPORT -->
<axsl:if test="count(hl7:code/@code) = 1">***report|workgroup.organisation.code|<axsl:text/><axsl:value-of select="hl7:AgentOrgSDS/hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:variable name="subjectWorkgroupCount" select="count(hl7:agentOrganizationSDS/hl7:id)"/><axsl:variable name="subjectWorkgroupId" select="hl7:agentOrganizationSDS/hl7:id/@extension"/>

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-LIST-ENTRY|report|lrWorkgroup***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++id|+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++workgroup.id.codeSystem|<axsl:text/><axsl:value-of select="hl7:agentOrganizationSDS/hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++workgroup.id.code|<axsl:text/><axsl:value-of select="hl7:agentOrganizationSDS/hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-LIST-ENTRY***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template>

<!--PATTERN CreateRequest.author.AgentPerson.elements-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:author/hl7:AgentPerson" priority="1000" mode="M22">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id)=1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_URPID_MISSING[authorRoleProfileIDMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_URPID_EMPTY[authorRoleProfileIDExtensionMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_URPID_EMPTY[authorRoleProfileIDEmpty]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:id/@extension)&lt;=12"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_URPID_TOO_LONG[authorRoleProfileIDTooLong]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentPersonSDS/hl7:id)=1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_ID_MISSING[authorIDMissing]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentPersonSDS/hl7:id/@extension)&gt;0"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_ID_EMPTY[authorIDEmpty]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentPersonSDS/hl7:id/@extension)&lt;=12"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_USER_ID_TOO_LONG[authorIDTooLong]***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|author.person.SDSPerson.codeSystem|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author.person.SDSPerson.code|<axsl:text/><axsl:value-of select="hl7:agentPersonSDS/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author.person.roleProfile.codeSystem|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author.person.roleProfile.code|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:representedOrganization) &lt; 2"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M22"/></axsl:template><axsl:template match="text()" priority="-1" mode="M22"/><axsl:template match="@*|node()" priority="-2" mode="M22"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M22"/></axsl:template>

<!--PATTERN CreateRequest.author.AgentPerson.representedOrganization elements-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:author/hl7:AgentPerson/hl7:representedOrganization" priority="1000" mode="M23">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='1.2.826.0.1285.0.2.0.109']) = count(hl7:id)"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[invalidWorkgroupCodeSystem]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@extension) = count(hl7:id)"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[missingWorkgroupID]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***BEGIN-LIST-ENTRY|report|workgroupcodeContainer***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++author.person.workgroupId.codeSystem|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">+++author.person.workgroupId.code|<axsl:text/><axsl:value-of select="hl7:id/@extension"/><axsl:text/>+++<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***END-LIST-ENTRY***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M23"/></axsl:template><axsl:template match="text()" priority="-1" mode="M23"/><axsl:template match="@*|node()" priority="-2" mode="M23"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M23"/></axsl:template>

<!--PATTERN CreateRequest.author.AgentDeviceSDS elements-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:author/hl7:AgentDeviceSDS" priority="1000" mode="M24">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentDeviceSDS/hl7:id[@root='1.2.826.0.1285.0.2.0.107']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_AUTHOR_SYSTEM_DEVID_MISSING[agentDeviceCodeSystemInvalid]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:agentDeviceSDS/hl7:id/@extension) = 1"/><axsl:otherwise>***fault|ErrorBase1712.SYSTEM_ID_EMPTY[authorDeviceIDMissing]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentDeviceSDS/hl7:id/@extension) &lt;= 12"/><axsl:otherwise>***fault|ErrorBase1712.SYSTEM_ID_TOO_LONG[authorDeviceIDTooLong]|<axsl:text/><axsl:value-of select="hl7:agentDeviceSDS/hl7:id/@extension"/><axsl:text/>|12***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="string-length(hl7:agentDeviceSDS/hl7:id/@extension) &gt; 0"/><axsl:otherwise>***fault|ErrorBase1712.SYSTEM_ID_EMPTY[authorDeviceIDEmpty]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|author.system.codeSystem|<axsl:text/><axsl:value-of select="hl7:agentDeviceSDS/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|author.system.code|<axsl:text/><axsl:value-of select="hl7:agentDeviceSDS/hl7:id/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M24"/></axsl:template><axsl:template match="text()" priority="-1" mode="M24"/><axsl:template match="@*|node()" priority="-2" mode="M24"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M24"/></axsl:template>

<!--PATTERN CreateRequest.pertinentInformation.pertinentLRReason attributes-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:pertinentInformation" priority="1000" mode="M25">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentLRReason/hl7:text) &lt; 2"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[lr reason text appears too many times]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentLRReason/hl7:reasonCode) &lt; 2"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[lr reason code appears too many times]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentLRReason/hl7:reasonCode) = 0 or count(hl7:pertinentLRReason/hl7:reasonCode/@code) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[mandatory elements missing]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentLRReason/hl7:reasonCode) = 0 or count(hl7:pertinentLRReason/hl7:reasonCode[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.7']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[reason code is mandatory]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentLRReason) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[lr reason must be provided]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|pertinentInformation.pertinentLRReason.text|<axsl:text/><axsl:value-of select="hl7:pertinentLRReason/hl7:text"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|pertinentInformation.pertinentLRReason.reasonCode|<axsl:text/><axsl:value-of select="hl7:pertinentLRReason/hl7:reasonCode/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|pertinentInformation.pertinentLRReason.reasonCodeSystem|<axsl:text/><axsl:value-of select="hl7:pertinentLRReason/hl7:reasonCode/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M25"/></axsl:template><axsl:template match="text()" priority="-1" mode="M25"/><axsl:template match="@*|node()" priority="-2" mode="M25"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M25"/></axsl:template>

<!--PATTERN CreateRequest.reason attributes-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:CreateRequest/hl7:reason" priority="1000" mode="M26">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:justifyingAlertRequest/hl7:code/@code) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[reasonAlertCodeMissing]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:justifyingAlertRequest/hl7:code[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.8']) = 1"/><axsl:otherwise>***fault|ErrorBase1712.INVALID_REQUEST[reasonAlertCodeSystemIncorrect]|validation error***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|accessReason.codeSystem|<axsl:text/><axsl:value-of select="hl7:justifyingAlertRequest/hl7:code/@codeSystem"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="true()">***report|accessReason.code|<axsl:text/><axsl:value-of select="hl7:justifyingAlertRequest/hl7:code/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M26"/></axsl:template><axsl:template match="text()" priority="-1" mode="M26"/><axsl:template match="@*|node()" priority="-2" mode="M26"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M26"/></axsl:template></axsl:stylesheet>
