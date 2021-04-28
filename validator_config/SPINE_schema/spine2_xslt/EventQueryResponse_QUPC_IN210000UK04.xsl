<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
	<xsl:output indent="yes"/>
	<xsl:param name="nhsNumberCode">NotProvided</xsl:param>
	<xsl:param name="nhsNumberCodeSystem">NotProvided</xsl:param>
	<xsl:param name="eventID">NotProvided</xsl:param>
	<xsl:param name="payloadIDCode">NotProvided</xsl:param>
	<xsl:param name="payloadIDCodeSystem">NotProvided</xsl:param>
	<xsl:param name="persistenceDate">NotProvided</xsl:param>
	<xsl:param name="eventStatusCode">NotProvided</xsl:param>
	<xsl:param name="eventStatusCodeSystem">NotProvided</xsl:param>
	<xsl:param name="eventStatusDisplayName">NotProvided</xsl:param>
	<xsl:param name="eventTypeCode">NotProvided</xsl:param>
	<xsl:param name="eventTypeCodeSystem">NotProvided</xsl:param>
	<xsl:param name="eventTypeDisplayName">NotProvided</xsl:param>

	<xsl:template match="/">

		<psis:queryResponseEvent xmlns:soap="http://www.w3.org/2001/12/soap-envelope" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:other="urn:some:other:namespace" xmlns:psis="urn:npfit:psisqr">
			<psis:recordTarget>
				<psis:patient>
					<psis:id>
						<xsl:attribute name="extension">
							<xsl:value-of select="$nhsNumberCode"/>
						</xsl:attribute>
						<xsl:attribute name="root">
							<xsl:value-of select="$nhsNumberCodeSystem"/>
						</xsl:attribute>
					</psis:id>
				</psis:patient>
			</psis:recordTarget>
			<psis:event>
				<psis:eventID>
					<xsl:attribute name="root">
						<xsl:value-of select="$eventID"/>
					</xsl:attribute>
				</psis:eventID>
				<psis:payloadID>
					<xsl:attribute name="extension">
						<xsl:value-of select="$payloadIDCode"/>
					</xsl:attribute>
					<xsl:attribute name="root">
						<xsl:value-of select="$payloadIDCodeSystem"/>
					</xsl:attribute>
				</psis:payloadID>
				<psis:persistenceDate>
					<xsl:attribute name="value">
						<xsl:value-of select="$persistenceDate"/>
					</xsl:attribute>
				</psis:persistenceDate>
				<psis:eventStatus>
					<xsl:attribute name="code">
						<xsl:value-of select="$eventStatusCode"/>
					</xsl:attribute>
					<xsl:attribute name="codeSystem">
						<xsl:value-of select="$eventStatusCodeSystem"/>
					</xsl:attribute>
					<xsl:attribute name="displayName">
						<xsl:value-of select="$eventStatusDisplayName"/>
					</xsl:attribute>
				</psis:eventStatus>
				<psis:eventType>
					<xsl:attribute name="code">
						<xsl:value-of select="$eventTypeCode"/>
					</xsl:attribute>
					<xsl:attribute name="codeSystem">
						<xsl:value-of select="$eventTypeCodeSystem"/>
					</xsl:attribute>
					<xsl:attribute name="displayName">
						<xsl:value-of select="$eventTypeDisplayName"/>
					</xsl:attribute>
				</psis:eventType>
				<psis:hl7Data>
					<xsl:copy-of select="/hl7:*/hl7:ControlActEvent/hl7:subject/*"/>
				</psis:hl7Data>
			</psis:event>
		</psis:queryResponseEvent>
	</xsl:template>
</xsl:stylesheet>
