<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"  version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
    <xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"/>    
    <xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:prescriptionSearchResponse/hl7:PRESCRIPTIONSEARCHRESPONSE_SM01">{
        "ID": "<xsl:value-of select="hl7:id/@root" />",
        "CreationTime": "<xsl:value-of select="hl7:creationTime/@value" />",
        "Response": {
    <xsl:for-each select="hl7:ControlActEvent">
        "reason": "<xsl:value-of select="hl7:reason/@typeCode"/>",
        "prescriptions": [
        <xsl:for-each select="hl7:subject/searchResults/prescription">{
            "prescriptionID": "<xsl:value-of select="id/@value" />",
            "messageID": "<xsl:value-of select="messageId/@value" />",
            "patientID": "<xsl:value-of select="patientId/@value" />",
            "prescriberOrg": "<xsl:value-of select="prescriberOrg/@code" />",
            "nominatedOrg": "<xsl:value-of select="nominatedOrg/@value" />",
            "dispenserOrg": "<xsl:value-of select="dispenserOrg/@value" />",
            "instanceNumbers": [
                <xsl:for-each select="instanceNumbers/instanceNumber">{
                    "instanceNumber": "<xsl:value-of select="@value" />"
                    }<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
                ],
            "prescriptionStatuses": [
                <xsl:for-each select="prescriptionStatuses/prescriptionStatus">{
                    "status": "<xsl:value-of select="@value" />"
                    }<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
                ],
            "prescribedDate": "<xsl:value-of select="prescribedDate/@value" />",
            "completedDate": "<xsl:value-of select="completedDate/@value" />",
            "prescriptionTreatmentType": "<xsl:value-of select="prescriptionTreatmentType/@value" />",
            "maxRepeats": "<xsl:value-of select="maxRepeats/@value" />"
            }<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ],
        "queryAck": "<xsl:value-of select="hl7:queryAck/hl7:queryResponseCode/@code"/>"
        }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
    }
    </xsl:template>
</xsl:stylesheet>