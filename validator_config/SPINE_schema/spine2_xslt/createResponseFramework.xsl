<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes"/>
	
	<xsl:param name="responseGUID">example-guid</xsl:param>
	<xsl:param name="responseService">pdsquery</xsl:param>
	<xsl:param name="responseAction">QUPA_IN040000UK14</xsl:param>
	<xsl:param name="responseName">retrievalQueryResponse</xsl:param>
    <xsl:param name="versionCode">V3NPfIT3.0</xsl:param>
	<xsl:param name="requestGUID">example-request-GUID</xsl:param>
	<xsl:param name="creationTime">19700101000000</xsl:param>
    <xsl:param name="wsaTo"></xsl:param>
    <xsl:param name="wsaFrom">https://<xsl:value-of select="$responseService"/>.national.ncrs.nhs.uk/syncservice</xsl:param>
    <xsl:param name="wsaRequestGUID">example-request-GUID</xsl:param>
	
	<xsl:template match="/">
		<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing">
			<SOAP:Header>
				<wsa:MessageID>uuid:<xsl:value-of select="$responseGUID"/></wsa:MessageID>
				<wsa:Action>urn:nhs:names:services:<xsl:value-of select="$responseService"/>/<xsl:value-of select="$responseAction"/></wsa:Action>
                <wsa:To><xsl:value-of select="$wsaTo"/></wsa:To>
				<wsa:From>
					<wsa:Address><xsl:value-of select="$wsaFrom"/></wsa:Address>
				</wsa:From>
				<wsa:RelatesTo><xsl:value-of select="$wsaRequestGUID"/></wsa:RelatesTo>
			</SOAP:Header>
			<SOAP:Body>
	    	<xsl:copy-of select="."/>
			</SOAP:Body>
		</SOAP:Envelope>
	</xsl:template>
</xsl:stylesheet>