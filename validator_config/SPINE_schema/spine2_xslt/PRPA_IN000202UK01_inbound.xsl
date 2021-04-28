<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"  version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
    <xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"></xsl:template>
    <xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:PRPA_IN000202UK01">
{
"messageID": "<xsl:value-of select="hl7:id/@root" />",
"interactionID": "<xsl:value-of select="hl7:interactionId/@extension" />",
"messageRef": "<xsl:value-of select="hl7:acknowledgement/hl7:messageRef/hl7:id/@root" />",
"status": "success", 
    <xsl:for-each select="hl7:ControlActEvent/hl7:subject/hl7:PdsSuccessfulUpdateResponse/hl7:pertinentInformation">
            <xsl:for-each select="hl7:pertinentSerialChangeNumber">
                "SerialChangeNumber": "<xsl:value-of select="hl7:value/@value" />"
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
        <xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
}
    </xsl:template>
    
    <!-- Catch Soap exceptions and return an empty string. 
    This will cause the inboundErrors transform to be applied by the shellgateway. -->
    <xsl:template match="/SOAP:Envelope/SOAP:Body/SOAP:Fault"></xsl:template>
</xsl:stylesheet>