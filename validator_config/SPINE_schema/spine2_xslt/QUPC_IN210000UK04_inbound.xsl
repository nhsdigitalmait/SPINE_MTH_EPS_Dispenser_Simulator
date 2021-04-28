<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:psis="urn:npfit:psisqr" version="1.0">
	<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"/>
	<xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:eventQueryResponse/hl7:*/hl7:ControlActEvent/hl7:subject">{
    <xsl:for-each select="psis:queryResponseEvent">
        "<xsl:value-of select="psis:recordTarget/psis:patient/psis:id/@extension"/>": {
            "nhsNumber": "<xsl:value-of select="psis:recordTarget/psis:patient/psis:id/@extension"/>",
            "nhsNumberCodeSystem": "<xsl:value-of select="psis:recordTarget/psis:patient/psis:id/@root"/>",
            "event": [
            <xsl:for-each select="psis:event">{
                "eventID": "<xsl:value-of select="psis:eventID/@root"/>",
                "payloadID": "<xsl:value-of select="psis:payloadID/@root"/>",
                "persistenceDate": "<xsl:value-of select="psis:persistenceDate/@value"/>",
                "status": [
                    <xsl:for-each select="psis:eventStatus">{
                        "code": "<xsl:value-of select="@code"/>",
                        "codeSystem": "<xsl:value-of select="@codeSystem"/>",
                        "displayName": "<xsl:value-of select="@displayName"/>"
                        }<xsl:if test="position() != last()">,</xsl:if>
                    </xsl:for-each>
                ],
                "type": [
                    <xsl:for-each select="psis:eventType">{
                        "code": "<xsl:value-of select="@code"/>",
                        "codeSystem": "<xsl:value-of select="@codeSystem"/>",
                        "displayName": "<xsl:value-of select="@displayName"/>"
                        }<xsl:if test="position() != last()">,</xsl:if>
                    </xsl:for-each>
                ],
                "hl7Data": ""
            }</xsl:for-each>
            ]
        }
    </xsl:for-each>}
	</xsl:template>
</xsl:stylesheet>
