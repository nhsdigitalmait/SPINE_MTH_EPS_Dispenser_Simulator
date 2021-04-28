<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/"  version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
    <xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"></xsl:template>
    <xsl:template match="/SOAP:Envelope/SOAP:Body/*">
{
<xsl:if test="hl7:*/hl7:id/@root !=''">
"messageID": "<xsl:value-of select="hl7:*/hl7:id/@root" />",
"messageRef": "<xsl:value-of select="hl7:*/hl7:acknowledgement/hl7:messageRef/hl7:id/@name" />"
    <xsl:for-each select="hl7:*/hl7:ControlActEvent/hl7:reason">
        ,"reason": {
        <xsl:for-each select="hl7:justifyingDetectedIssueEvent">
            "justifyingDetectedIssueEvent": {
            "code": "<xsl:value-of select="hl7:code/@code" />",
            "codeSystem": "<xsl:value-of select="hl7:code/@codeSystem" />",
            "description": "<xsl:value-of select="hl7:code/@displayName" />"}
        </xsl:for-each>
        }
    </xsl:for-each>
,"interactionID": "<xsl:value-of select="hl7:*/hl7:interactionId/@extension" />"   
</xsl:if>
<xsl:if test="hl7:id/@root !=''">
"messageID": "<xsl:value-of select="hl7:id/@root" />",
"interactionID": "<xsl:value-of select="hl7:interactionId/@extension" />",
"messageRef": "<xsl:value-of select="hl7:acknowledgement/hl7:messageRef/hl7:id/@root" />",
"reasonList": [
<xsl:for-each select="hl7:ControlActEvent/hl7:reason">
    {
		<xsl:for-each select="hl7:justifyingDetectedIssueEvent">
			"justifyingDetectedIssueEvent": {
			"code": "<xsl:value-of select="hl7:code/@code" />",
			"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem" />",
			"description": "<xsl:value-of select="hl7:code/@displayName" />"}
		</xsl:for-each>
    }<xsl:if test="position() != last()">,</xsl:if>
</xsl:for-each>
]
</xsl:if>
}
    </xsl:template>
    
        <xsl:template match="/SOAP:Envelope/SOAP:Body/SOAP:Fault">
        {"faultcode": "<xsl:value-of select="faultcode" />",
        "faultstring": "<xsl:value-of select="faultstring" />",
        "reason": {<xsl:for-each select="detail/nasp:errorList">
			"justifyingDetectedIssueEvent": {
				"code": "<xsl:value-of select="nasp:error/nasp:errorCode" />",
				"severity": "<xsl:value-of select="nasp:error/nasp:severity" />",
				"location": "<xsl:value-of select="nasp:error/nasp:location" />",
				"description": "<xsl:value-of select="nasp:error/nasp:description" />",
				"codeContext": "<xsl:value-of select="nasp:error/nasp:codeContext" />"
				}
			</xsl:for-each>
		}
	}
    </xsl:template>
    <xsl:template match="/*[not(name()='SOAP:Envelope' or name()='SOAP-ENV:Envelope')]" />
</xsl:stylesheet>