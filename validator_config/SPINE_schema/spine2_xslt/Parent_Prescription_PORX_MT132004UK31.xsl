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
<axsl:template match="/"><axsl:apply-templates select="/" mode="M9"/><axsl:apply-templates select="/" mode="M10"/><axsl:apply-templates select="/" mode="M11"/><axsl:apply-templates select="/" mode="M12"/><axsl:apply-templates select="/" mode="M13"/><axsl:apply-templates select="/" mode="M14"/><axsl:apply-templates select="/" mode="M15"/><axsl:apply-templates select="/" mode="M16"/><axsl:apply-templates select="/" mode="M17"/><axsl:apply-templates select="/" mode="M18"/><axsl:apply-templates select="/" mode="M19"/><axsl:apply-templates select="/" mode="M20"/><axsl:apply-templates select="/" mode="M21"/></axsl:template>

<!--SCHEMATRON PATTERNS-->


<!--PATTERN correctRoot-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject" priority="1000" mode="M9">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:ParentPrescription)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:ParentPrescription root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template><axsl:template match="text()" priority="-1" mode="M9"/><axsl:template match="@*|node()" priority="-2" mode="M9"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M9"/></axsl:template>

<!--PATTERN correctPatternRoots-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription" priority="1000" mode="M10">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:recordTarget/hl7:Patient)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:Patient root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1/hl7:pertinentPrescription)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:pertinentPrescription root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:author/hl7:AgentPerson)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:agentPerson root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:author/hl7:AgentPerson/hl7:representedOrganization)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|hl7:representedOrganization root not found***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template><axsl:template match="text()" priority="-1" mode="M10"/><axsl:template match="@*|node()" priority="-2" mode="M10"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M10"/></axsl:template>

<!--PATTERN extractRootHL7ID-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/*" priority="1000" mode="M11">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id/@root)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|A single hl7:ID/@root must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="true()">***report|hl7EventID|<axsl:text/><axsl:value-of select="hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template><axsl:template match="text()" priority="-1" mode="M11"/><axsl:template match="@*|node()" priority="-2" mode="M11"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M11"/></axsl:template>

<!--PATTERN prescriberOrganizationCheck-->


	<!--RULE -->
<axsl:template match="//hl7:author/hl7:AgentPerson/hl7:representedOrganization" priority="1000" mode="M12">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:healthCareProviderLicense/hl7:Organization/hl7:id[@root='1.2.826.0.1285.0.2.1.35' or @root='1.2.826.0.1285.0.1.10']/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Health Care Provider Licensed Organization (PCT) ID is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:healthCareProviderLicense/hl7:Organization/hl7:id[@root='1.2.826.0.1285.0.2.1.35' or @root='1.2.826.0.1285.0.1.10']/@extension)=1">***report|hcplOrgCode|<axsl:text/><axsl:value-of select="hl7:healthCareProviderLicense/hl7:Organization/hl7:id[@root='1.2.826.0.1285.0.2.1.35' or @root='1.2.826.0.1285.0.1.10']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template><axsl:template match="text()" priority="-1" mode="M12"/><axsl:template match="@*|node()" priority="-2" mode="M12"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M12"/></axsl:template>

<!--PATTERN nhsNumberCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription/hl7:recordTarget/hl7:Patient" priority="1000" mode="M13">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|NHSNumber missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root='2.16.840.1.113883.2.1.4.1'])=1">***report|nhsNumber|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.4.1']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template><axsl:template match="text()" priority="-1" mode="M13"/><axsl:template match="@*|node()" priority="-2" mode="M13"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M13"/></axsl:template>

<!--PATTERN SignatureCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription" priority="1000" mode="M14">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:author/hl7:signatureText/DigSig:Signature)=1"/><axsl:otherwise>***fault|ErrorBase1722.DIGITAL_SIGNATURE_NOT_FOUND***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:author/hl7:time/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Signed time must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:author/hl7:time/@value)=1">***report|signedTime|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:author/hl7:time/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template><axsl:template match="text()" priority="-1" mode="M14"/><axsl:template match="@*|node()" priority="-2" mode="M14"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M14"/></axsl:template>

<!--PATTERN PrescriptionType-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription" priority="1000" mode="M15">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:pertinentInformation5/hl7:pertinentPrescriptionTreatmentType/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.36']/@code)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|pertinentPrescriptionTreatmentType missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation5/hl7:pertinentPrescriptionTreatmentType/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.16.36']/@code)=1">***report|prescriptionTreatmentType|<axsl:text/><axsl:value-of select="hl7:pertinentInformation5/hl7:pertinentPrescriptionTreatmentType/hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation4/hl7:pertinentPrescriptionType/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.25']/@code)=1">***report|prescriptionType|<axsl:text/><axsl:value-of select="hl7:pertinentInformation4/hl7:pertinentPrescriptionType/hl7:value/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:repeatNumber/hl7:high/@value)=1">***report|prescriptionRepeatHigh|<axsl:text/><axsl:value-of select="hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:repeatNumber/hl7:low/@value)=1">***report|prescriptionRepeatLow|<axsl:text/><axsl:value-of select="hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template><axsl:template match="text()" priority="-1" mode="M15"/><axsl:template match="@*|node()" priority="-2" mode="M15"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M15"/></axsl:template>

<!--PATTERN PrescriptionTimeStamp-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription" priority="1000" mode="M16">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:effectiveTime/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Prescription Timestamp must be provided***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:effectiveTime/@value)=1">***report|prescriptionTime|<axsl:text/><axsl:value-of select="hl7:effectiveTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template><axsl:template match="text()" priority="-1" mode="M16"/><axsl:template match="@*|node()" priority="-2" mode="M16"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M16"/></axsl:template>

<!--PATTERN prescriptionIDCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription" priority="1000" mode="M17">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|PrescriptionID missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.8'])=1">***report|prescriptionID|<axsl:text/><axsl:value-of select="hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.18.8']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template><axsl:template match="text()" priority="-1" mode="M17"/><axsl:template match="@*|node()" priority="-2" mode="M17"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M17"/></axsl:template>

<!--PATTERN PatientInformationCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription/hl7:recordTarget/hl7:Patient" priority="1000" mode="M18">

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:addr)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient address is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientPerson/hl7:name)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient name is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientPerson/hl7:administrativeGenderCode/@code)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient gender code is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientPerson/hl7:birthTime/@value)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Patient birthtime is missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose>

		<!--REPORT -->
<axsl:if test="count(hl7:patientPerson/hl7:birthTime/@value)=1">***report|birthTime|<axsl:text/><axsl:value-of select="hl7:patientPerson/hl7:birthTime/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--ASSERT -->
<axsl:choose><axsl:when test="count(hl7:patientPerson/hl7:playedProviderPatient/hl7:subjectOf/hl7:patientCareProvision/hl7:responsibleParty/hl7:healthCareProvider/hl7:id/@extension)=1"/><axsl:otherwise>***fault|ErrorBase1634.UNABLE_TO_PROCESS|Health Care Provider (RegisteredGP) ID missing***<axsl:value-of select="string('&#10;')"/></axsl:otherwise></axsl:choose><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template><axsl:template match="text()" priority="-1" mode="M18"/><axsl:template match="@*|node()" priority="-2" mode="M18"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M18"/></axsl:template>

<!--PATTERN NominationCheck-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription" priority="1000" mode="M19">

		<!--REPORT -->
<axsl:if test="count(hl7:performer)&gt;0 and hl7:pertinentInformation1/hl7:pertinentDispensingSitePreference/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.21']/@code='0004'">***fault|ErrorBase1634.UNABLE_TO_PROCESS|Nomination Site Code must not be provided when DispensiongSitePreference code 0004 is set***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:performer/hl7:AgentOrgSDS/hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension)=0 and hl7:pertinentInformation1/hl7:pertinentDispensingSitePreference/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.21']/@code='P1'">***fault|ErrorBase1634.UNABLE_TO_PROCESS|Nomination Site Code must be provided when DispensiongSitePreference code P1 is set***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:performer/hl7:AgentOrgSDS/hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension)=0 and hl7:pertinentInformation1/hl7:pertinentDispensingSitePreference/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.21']/@code='P2'">***fault|ErrorBase1634.UNABLE_TO_PROCESS|Nomination Site Code must be provided when DispensiongSitePreference code P2 is set***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:performer/hl7:AgentOrgSDS/hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension)=0 and hl7:pertinentInformation1/hl7:pertinentDispensingSitePreference/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.21']/@code='P3'">***fault|ErrorBase1634.UNABLE_TO_PROCESS|Nomination Site Code must be provided when DispensiongSitePreference code P3 is set***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:performer/hl7:AgentOrgSDS/hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.1.10'])=1">***report|nominatedPerformer|<axsl:text/><axsl:value-of select="hl7:performer/hl7:AgentOrgSDS/hl7:agentOrganizationSDS/hl7:id[@root='1.2.826.0.1285.0.1.10']/@extension"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation1/hl7:pertinentDispensingSitePreference/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.21'])=1">***report|nominatedPerformerType|<axsl:text/><axsl:value-of select="hl7:pertinentInformation1/hl7:pertinentDispensingSitePreference/hl7:value[@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.21']/@code"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template><axsl:template match="text()" priority="-1" mode="M19"/><axsl:template match="@*|node()" priority="-2" mode="M19"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M19"/></axsl:template>

<!--PATTERN RepeatDispenselineItemValidation-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription" priority="1000" mode="M20">

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem1RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem1RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem1ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem2RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem2RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem2ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem3RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem3RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem3ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem4RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem4RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem4ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem5RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem5RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem5ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem6RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem6RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem6ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem7RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem7RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem7ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem8RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem8RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem8ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem9RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem9RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem9ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem10RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem10RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem10ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem11RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem11RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem11ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem12RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem12RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem12ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem13RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem13RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem13ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem14RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem14RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem14ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem15RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem15RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem15ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem16RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem16RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem16ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem17RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem17RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem17ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem18RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem18RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem18ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem19RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem19RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem19ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem20RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem20RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem20ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem21RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem21RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem21ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem22RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem22RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem22ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem23RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem23RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem23ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem24RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem24RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem24ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem25RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem25RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem25ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem26RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem26RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem26ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem27RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem27RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem27ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem28RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem28RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem28ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem29RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem29RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem29ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem30RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem30RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem30ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem31RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem31RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem31ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem32RepeatHigh|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem32RepeatLow|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:id/@root)=1">***report|lineItem32ID|<axsl:text/><axsl:value-of select="hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:id/@root"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template><axsl:template match="text()" priority="-1" mode="M20"/><axsl:template match="@*|node()" priority="-2" mode="M20"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M20"/></axsl:template>

<!--PATTERN DaysSupply-->


	<!--RULE -->
<axsl:template match="/*/hl7:ControlActEvent/hl7:subject/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription" priority="1000" mode="M21">

		<!--REPORT -->
<axsl:if test="count(hl7:component1/hl7:daysSupply/hl7:effectiveTime/hl7:low/@value)=1">***report|daysSupplyValidLow|<axsl:text/><axsl:value-of select="hl7:component1/hl7:daysSupply/hl7:effectiveTime/hl7:low/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:component1/hl7:daysSupply/hl7:effectiveTime/hl7:high/@value)=1">***report|daysSupplyValidHigh|<axsl:text/><axsl:value-of select="hl7:component1/hl7:daysSupply/hl7:effectiveTime/hl7:high/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if>

		<!--REPORT -->
<axsl:if test="count(hl7:component1/hl7:daysSupply/hl7:expectedUseTime)=1">***report|daysSupply|<axsl:text/><axsl:value-of select="hl7:component1/hl7:daysSupply/hl7:expectedUseTime/hl7:width/@value"/><axsl:text/>***<axsl:value-of select="string('&#10;')"/></axsl:if><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template><axsl:template match="text()" priority="-1" mode="M21"/><axsl:template match="@*|node()" priority="-2" mode="M21"><axsl:apply-templates select="*|comment()|processing-instruction()" mode="M21"/></axsl:template></axsl:stylesheet>
