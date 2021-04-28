<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:ppdbatch="http://spine.nhs.uk/spine-service-ppd">
	<xsl:template match="/">
		<xsl:for-each select="//ppdbatch:batchItem">
			|<xsl:value-of select="ppdbatch:messagePayload/hl7:ReimbursmentClaim/hl7:component1/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:id[2]/@extension"/>_<xsl:value-of select="ppdbatch:ppdAdditionalProperties/ppdbatch:entry[@id='urn:spine:types:prescriptionInstanceNo']"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>