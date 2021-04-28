<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"  version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
    <xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"/>    
    <xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:prescriptionDocumentResponse/hl7:GET_PRESCRIPTION_DOCUMENT_RESPONSE_INUK01">{
        "ID": "<xsl:value-of select="hl7:id/@root" />",
        "CreationTime": "<xsl:value-of select="hl7:creationTime/@value" />",
        "Response": {
    <xsl:for-each select="hl7:ControlActEvent">
        "reason": "<xsl:value-of select="hl7:reason/@typeCode"/>",
        <xsl:for-each select="hl7:subject/document">
            "prescriptionID": "<xsl:value-of select="prescriptionID/@value" />",            
            "documentKey": "<xsl:value-of select="documentKey/@value" />",
            "documentType": "<xsl:value-of select="documentType/@value" />",
            "content": "<xsl:value-of select="content/@value" />",
            "type": "<xsl:value-of select="type/@value" />",
            <xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        "queryAck": "<xsl:value-of select="hl7:queryAck/hl7:queryResponseCode/@code"/>"
        }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
    }
    </xsl:template>
    <!-- Make sure that if a SOAP Fault is returned nothing is passed back so that the 
    processing will drop into the inbound error transform -->
    <xsl:template match="/SOAP:Envelope/SOAP:Body/SOAP:Fault"></xsl:template>
</xsl:stylesheet>