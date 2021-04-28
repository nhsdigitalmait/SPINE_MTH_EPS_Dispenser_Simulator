<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:SOAP-ENV="http://www.w3.org/2001/12/soap-envelope" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
	<xsl:param name="batchSequenceNumber">Not Provided</xsl:param>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/SOAP-ENV:Envelope/SOAP-ENV:Header/nasp:batchHeader/nasp:batchSequenceNumber">
		<nasp:batchSequenceNumber>
			<xsl:value-of select="$batchSequenceNumber"/>
		</nasp:batchSequenceNumber>
	</xsl:template>
</xsl:stylesheet>
