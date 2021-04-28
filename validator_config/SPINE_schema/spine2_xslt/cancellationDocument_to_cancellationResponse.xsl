<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
	<xsl:output indent="yes"/>

	<xsl:param name="cancellationResponseText">Text not provided</xsl:param>
	<xsl:param name="cancellationResponseCode">Code not provided</xsl:param>
	<xsl:param name="cancellationResponseCodeSystem">2.16.840.1.113883.2.1.3.2.4.17.19</xsl:param>

	<xsl:template match="/">
		<copiedContent>
            <xsl:copy-of select="/*/hl7:id"/>
			<xsl:copy-of select="/*/hl7:recordTarget"/>
			<xsl:copy-of select="/*/hl7:author"/>
			<xsl:copy-of select="/*/hl7:responsibleParty"/>
			<xsl:copy-of select="/*/hl7:pertinentInformation2"/>
			<xsl:copy-of select="/*/hl7:pertinentInformation1"/>
			<pertinentInformation3 typeCode="PERT" contextConductionInd="true">
				<seperatableInd value="false"/>
				<pertinentResponse classCode="OBS" moodCode="EVN">
					<code code="CRR" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
					<value>
						<xsl:attribute name="codeSystem">
							<xsl:value-of select="$cancellationResponseCodeSystem"/>
						</xsl:attribute>
						<xsl:attribute name="code">
							<xsl:value-of select="$cancellationResponseCode"/>
						</xsl:attribute>
						<xsl:attribute name="displayName">
							<xsl:value-of select="$cancellationResponseText"/>
						</xsl:attribute>
					</value>
				</pertinentResponse>
			</pertinentInformation3>
		</copiedContent>
	</xsl:template>
</xsl:stylesheet>
