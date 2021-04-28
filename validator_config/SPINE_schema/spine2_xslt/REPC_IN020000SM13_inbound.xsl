<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"	version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
	<xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"></xsl:template>
	<xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:REPC_IN020000SM13/hl7:ControlActEvent/hl7:subject">
{
	<xsl:for-each select="hl7:CreationResponseConfirm">
        "createdLRId": "<xsl:value-of select="hl7:id/@extension" />"
    </xsl:for-each>
    <xsl:if test="count(hl7:CreationResponseConfirm) + count(hl7:CreationPermissionToViewResponseConfirm) = 2">,</xsl:if>
    <xsl:for-each select="hl7:CreationPermissionToViewResponseConfirm">
        "createdPermissionToViewId": "<xsl:value-of select="hl7:id/@extension" />"
    </xsl:for-each>
	}
	</xsl:template>

</xsl:stylesheet>