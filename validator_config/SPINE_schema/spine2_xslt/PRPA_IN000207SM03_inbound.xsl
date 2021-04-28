<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/"  version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
    <xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"></xsl:template>    
    <xsl:template match="/SOAP:Envelope/SOAP:Body/*">
{
    <xsl:if test="hl7:id/@root !=''">
    "messageID": "<xsl:value-of select="hl7:id/@root" />",
    "messageRef": "<xsl:value-of select="hl7:acknowledgement/hl7:messageRef/hl7:id/@root" />",
    "errors": [
    <xsl:for-each select="hl7:ControlActEvent/hl7:reason">
        <xsl:for-each select="hl7:justifyingDetectedIssueEvent">
            {
            "code": "<xsl:value-of select="hl7:code/@code" />",
            "codeSystem": "<xsl:value-of select="hl7:code/@codeSystem" />",
            "description": "<xsl:value-of select="hl7:code/@displayName" />"
            } <xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        <xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
    ],
    "interactionID": "<xsl:value-of select="hl7:interactionId/@extension" />",
    </xsl:if>
    "results": [
    <xsl:for-each select="hl7:ControlActEvent/hl7:subject/hl7:PdsRegistrationResponse/hl7:subject">
        {
            "nhsNumber": "<xsl:value-of select="hl7:patientRole/hl7:id/@extension"/>"
        <xsl:if test="hl7:patientRole/hl7:babyOf/@typeCode !=''">
            ,"motherNhsNumber": "<xsl:value-of select="hl7:patientRole/hl7:babyOf/hl7:obstetricCareProvision/hl7:recordTarget/hl7:patient/hl7:id/@extension" />",
            "mothersBirthTime": "<xsl:value-of select="hl7:patientRole/hl7:babyOf/hl7:obstetricCareProvision/hl7:recordTarget/hl7:patient/hl7:patientMother/hl7:birthTime/@value" />",
            "mothersGivenName": "<xsl:value-of select="hl7:patientRole/hl7:babyOf/hl7:obstetricCareProvision/hl7:recordTarget/hl7:patient/hl7:patientMother/hl7:name/hl7:given" />",
            "mothersFamilyName": "<xsl:value-of select="hl7:patientRole/hl7:babyOf/hl7:obstetricCareProvision/hl7:recordTarget/hl7:patient/hl7:patientMother/hl7:name/hl7:family" />"
        </xsl:if>
        <xsl:if test="hl7:patientRole/hl7:patientPerson/@classCode !=''">
            ,"genderCode": "<xsl:value-of select="hl7:patientRole/hl7:patientPerson/hl7:administrativeGenderCode/@code" />",
            "birthTime": "<xsl:value-of select="hl7:patientRole/hl7:patientPerson/hl7:birthTime/@value" />",
            "prefix": "<xsl:value-of select="hl7:patientRole/hl7:patientPerson/hl7:COCT_MT000203UK02.PartOfWhole/hl7:partPerson/hl7:name/hl7:prefix" />",
            "givenName": "<xsl:value-of select="hl7:patientRole/hl7:patientPerson/hl7:COCT_MT000203UK02.PartOfWhole/hl7:partPerson/hl7:name/hl7:given" />",
            "familyName": "<xsl:value-of select="hl7:patientRole/hl7:patientPerson/hl7:COCT_MT000203UK02.PartOfWhole/hl7:partPerson/hl7:name/hl7:family" />"
        </xsl:if>
        <xsl:if test="hl7:patientRole/hl7:patientPerson/hl7:multipleBirthOrderNumber" >
            ,"birthOrder": "<xsl:value-of select="hl7:patientRole/hl7:patientPerson/hl7:multipleBirthOrderNumber/@value" />"
        </xsl:if>
        <xsl:if test="hl7:patientRole/hl7:subjectOf/@typeCode !=''">
            ,"birthWeight": "<xsl:value-of select="hl7:patientRole/hl7:subjectOf/hl7:birthWeight/hl7:value/@value" />"
        </xsl:if>
        }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
    ]
}
    </xsl:template>
</xsl:stylesheet>