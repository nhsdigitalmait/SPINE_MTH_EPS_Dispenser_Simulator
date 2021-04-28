<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:psis="urn:npfit:psisqr" version="1.0">
	<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"/>
	<xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:QUPC_IN030000UK14/hl7:ControlActEvent/hl7:subject">
{"LRExists": "<xsl:value-of select="hl7:queryConfirmationResponse/hl7:lRExists/hl7:value/@value"/>"}
	</xsl:template>
</xsl:stylesheet>
