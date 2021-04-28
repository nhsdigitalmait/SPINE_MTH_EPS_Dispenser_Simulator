<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:psis="urn:npfit:psisqr">
	<xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="no" />

	<xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:eventQueryResponse/hl7:QUPC_IN210000UK04/hl7:ControlActEvent/hl7:subject/psis:queryResponseEvent/psis:event/psis:hl7Data">
        <xsl:copy-of select="."/>
    </xsl:template>
	
	<xsl:template match="node()|@*">
        <xsl:apply-templates/>
    </xsl:template>
	
</xsl:stylesheet>