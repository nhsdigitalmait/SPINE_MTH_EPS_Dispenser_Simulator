<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes"/>
	<xsl:param name="fromASID">NA</xsl:param>
	<xsl:param name="responseGUID">example-guid</xsl:param>
	<xsl:param name="responseService">pdsquery</xsl:param>
	<xsl:param name="responseAction">MCCI_IN010000UK13</xsl:param>
	<xsl:param name="responseName">retrievalQueryResponse</xsl:param>
	<xsl:param name="toASID">Unavailable</xsl:param>
	<xsl:param name="requestGUID">example-request-GUID</xsl:param>
	<xsl:param name="creationTime">19700101000000</xsl:param>
    <xsl:param name="wsaFrom">https://<xsl:value-of select="$responseService"/>.national.ncrs.nhs.uk/syncservice</xsl:param>
    <xsl:param name="wsaTo"></xsl:param>
	<xsl:param name="errorLevel">ER</xsl:param>
	<xsl:param name="errorCode">202</xsl:param>
	<xsl:param name="errorText">HL7 Validation Error</xsl:param>
    <xsl:param name="wsaRequestGUID">example-request-GUID</xsl:param>

	<xsl:template match="/">
		<SOAP-ENV:Envelope xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
			<SOAP-ENV:Header>
				<wsa:MessageID>uuid:<xsl:value-of select="$responseGUID"/></wsa:MessageID>
				<wsa:Action>urn:nhs:names:services:<xsl:value-of select="$responseService"/>/<xsl:value-of select="$responseAction"/></wsa:Action>
				<wsa:To><xsl:value-of select="$wsaTo"/></wsa:To>
                <wsa:From>
                    <wsa:Address><xsl:value-of select="$wsaFrom"/></wsa:Address>
                </wsa:From>
				<communicationFunctionRcv typeCode="RCV">
					<device classCode="DEV" determinerCode="INSTANCE">
						<id root="1.2.826.0.1285.0.2.0.107">
							<xsl:attribute name="extension">
								<xsl:value-of select="$toASID"/>
							</xsl:attribute>
						</id>
					</device>
				</communicationFunctionRcv>
				<communicationFunctionSnd typeCode="SND">
					<device classCode="DEV" determinerCode="INSTANCE">
						<id root="1.2.826.0.1285.0.2.0.107">
							<xsl:attribute name="extension">
								<xsl:value-of select="$fromASID"/>
							</xsl:attribute>
						</id>
					</device>
				</communicationFunctionSnd>
				<wsa:RelatesTo>uuid:<xsl:value-of select="$wsaRequestGUID"/></wsa:RelatesTo>
			</SOAP-ENV:Header>
			<SOAP-ENV:Body>
				<xsl:element name="{$responseName}">
					<xsl:element name="{$responseAction}">
						<id>
							<xsl:attribute name="root">
								<xsl:value-of select="$responseGUID"/>
							</xsl:attribute>
						</id>
						<creationTime>
							<xsl:attribute name="value">
								<xsl:value-of select="$creationTime"/>
							</xsl:attribute>
						</creationTime>
						<versionCode code="V3NPfIT3.0"/>
						<interactionId root="2.16.840.1.113883.2.1.3.2.4.12">
							<xsl:attribute name="extension">
								<xsl:value-of select="$responseAction"/>
							</xsl:attribute>
						</interactionId>
						<processingCode code="P"/>
						<processingModeCode code="T"/>
						<acceptAckCode code="NE"/>
						<acknowledgement typeCode="AA">
							<messageRef>
								<id>
									<xsl:attribute name="root">
										<xsl:value-of select="$requestGUID"/>
									</xsl:attribute>
								</id>
							</messageRef>
						</acknowledgement>
						<communicationFunctionRcv typeCode="RCV">
							<device classCode="DEV" determinerCode="INSTANCE">
								<id root="1.2.826.0.1285.0.2.0.107">
									<xsl:attribute name="extension">
										<xsl:value-of select="$toASID"/>
									</xsl:attribute>
								</id>
							</device>
						</communicationFunctionRcv>
						<communicationFunctionSnd typeCode="SND">
							<device classCode="DEV" determinerCode="INSTANCE">
								<id root="1.2.826.0.1285.0.2.0.107">
									<xsl:attribute name="extension">
										<xsl:value-of select="$fromASID"/>
									</xsl:attribute>
								</id>
							</device>
						</communicationFunctionSnd>
						<ControlActEvent classCode="CACT" moodCode="EVN">
							<author1 typeCode="AUT">
								<AgentSystemSDS classCode="AGNT">
									<agentSystemSDS classCode="DEV" determinerCode="INSTANCE">
										<id root="1.2.826.0.1285.0.2.0.107">
											<xsl:attribute name="extension">
												<xsl:value-of select="$fromASID"/>
											</xsl:attribute>
										</id>
									</agentSystemSDS>
								</AgentSystemSDS>
							</author1>
						</ControlActEvent>
					</xsl:element>
				</xsl:element>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>

	</xsl:template>
</xsl:stylesheet>