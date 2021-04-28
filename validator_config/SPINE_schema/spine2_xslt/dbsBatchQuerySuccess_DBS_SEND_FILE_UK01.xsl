<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="responseAction">Not Known</xsl:param>

	<xsl:template match="/">
    <xsl:element name="{$responseAction}" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
        <xsl:copy-of select="."/>
    </xsl:element>
	</xsl:template>
</xsl:stylesheet>
