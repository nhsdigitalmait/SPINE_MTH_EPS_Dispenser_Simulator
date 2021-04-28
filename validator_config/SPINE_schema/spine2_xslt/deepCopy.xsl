<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
	<xsl:output method="xml" version="1.0" encoding="utf-8" indent="no" />

	<xsl:template match="/*[1]/hl7:ControlActEvent[1]/hl7:subject[1]/*[1]">
        <xsl:copy-of select="."/>
    </xsl:template>
	
	<xsl:template match="node()|@*">
        <xsl:apply-templates/>
    </xsl:template>
	
</xsl:stylesheet>