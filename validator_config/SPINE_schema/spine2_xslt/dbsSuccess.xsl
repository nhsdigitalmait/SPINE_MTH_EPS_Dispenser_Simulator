<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="messageID">Not Known</xsl:param>
	<xsl:param name="responseAction">Not Known</xsl:param>
	<xsl:param name="versionCode">V3NPfIT3.0</xsl:param>
	<xsl:param name="refToMessageID">Not Known</xsl:param>	
	<xsl:param name="timeStampSent">Not Known</xsl:param>
	<xsl:param name="fromASID">Not Known</xsl:param>
	<xsl:param name="serviceASID">Not Known</xsl:param>
	<xsl:param name="toASID">Not Known</xsl:param>
	<xsl:param name="scnNumber">Not Known</xsl:param>
	<xsl:param name="justifyingDetectedIssue">false</xsl:param>
	<xsl:param name="detectedIssueCode">Not Known</xsl:param>
	<xsl:param name="errorDesc">Not Known</xsl:param>
	<xsl:param name="issueQualifier">Not Known</xsl:param>

	<xsl:template match="/">
<xsl:element name="{$responseAction}" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
	<hl7:id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></hl7:id>
	<hl7:creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></hl7:creationTime>
	<hl7:versionCode><xsl:attribute name="code"><xsl:value-of select="$versionCode"/></xsl:attribute></hl7:versionCode>
	<hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12"><xsl:attribute name="extension"><xsl:value-of select="$responseAction"/></xsl:attribute></hl7:interactionId>
	<hl7:ControlActEvent classCode="CACT" moodCode="EVN">
		<xsl:if test="$justifyingDetectedIssue='true'">
			<hl7:reason typeCode="RSON">
				<hl7:justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
					<hl7:code codeSystem="2.16.840.1.113883.2.1.3.2.4.17.42">
						<xsl:attribute name="code"><xsl:value-of select="$errorCode"/></xsl:attribute><xsl:attribute name="displayName"><xsl:value-of select="$errorDesc"/></xsl:attribute>
						<hl7:qualifier>
							<xsl:attribute name="code"><xsl:value-of select="$issueQualifier"/></xsl:attribute>	
						</hl7:qualifier>
					</hl7:code>
				</hl7:justifyingDetectedIssueEvent>
			</hl7:reason>
		</xsl:if>
		<hl7:subject typeCode="SUBJ">
			<xsl:copy-of select="."/>
		</hl7:subject>
	</hl7:ControlActEvent>
</xsl:element>
	</xsl:template>
</xsl:stylesheet>
