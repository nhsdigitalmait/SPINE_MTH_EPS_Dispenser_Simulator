<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes"/>

	<xsl:param name="responseGUID">example-guid</xsl:param>
	<xsl:param name="responseService">pdsquery</xsl:param>
	<xsl:param name="responseAction">QUPA_IN040000UK14</xsl:param>
	<xsl:param name="responseName">retrievalQueryResponse</xsl:param>
	<xsl:param name="requestGUID">example-request-GUID</xsl:param>
	<xsl:param name="creationTime">19700101000000</xsl:param>
    <xsl:param name="toASID">UNKNOWN</xsl:param>
    <xsl:param name="toPartyKey">UNKNOWN</xsl:param>
    <xsl:param name="fromASID">UNKNOWN</xsl:param>
    <xsl:param name="fromPartyKey">UNKNOWN</xsl:param>
    <xsl:param name="justifyingDetectedIssue">false</xsl:param>
    <xsl:param name="detectedIssueCode">NotKnown</xsl:param>
    <xsl:param name="errorDesc">NotKnown</xsl:param>
    <xsl:param name="successResponseName">NotKnown</xsl:param>
    
	<xsl:template match="/">
		<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
			<SOAP-ENV:Header>
				<naspResponseHeader>
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
					<versionCode code="V3NPfIT2.0"/>
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
							<id root="2.16.840.1.113883.2.1.3.2.4.10">
								<xsl:attribute name="extension">
									<xsl:value-of select="$toASID"/>
								</xsl:attribute>
							</id>
						</device>
					</communicationFunctionRcv>
					<communicationFunctionSnd typeCode="SND">
						<device classCode="DEV" determinerCode="INSTANCE">
							<id root="2.16.840.1.113883.2.1.3.2.4.10">
								<xsl:attribute name="extension">
									<xsl:value-of select="$fromASID"/>
								</xsl:attribute>
							</id>
						</device>
					</communicationFunctionSnd>
					<ControlAct classCode="CACT" moodCode="EVN" type="ControlAct">
    				<queryAck type="QueryAck">
					<queryId>
						<xsl:attribute name="root"><xsl:value-of select="$requestGUID"/></xsl:attribute>
					</queryId>
					<queryResponseCode code="OK"/>
				</queryAck>
			</ControlAct>
				</naspResponseHeader>
			</SOAP-ENV:Header>
			<SOAP-ENV:Body>
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
					<versionCode code="V3NPfIT2.0"/>
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
							<id root="2.16.840.1.113883.2.1.3.2.4.10">
								<xsl:attribute name="extension">
									<xsl:value-of select="$toASID"/>
								</xsl:attribute>
							</id>
						</device>
					</communicationFunctionRcv>
					<communicationFunctionSnd typeCode="SND">
						<device classCode="DEV" determinerCode="INSTANCE">
							<id root="2.16.840.1.113883.2.1.3.2.4.10">
								<xsl:attribute name="extension"> 
									<xsl:value-of select="$fromASID"/>
								</xsl:attribute>
							</id>
						</device>
					</communicationFunctionSnd>
					<ControlActProcess classCode="CACT" moodCode="EVN">
                       	<subject typeCode="SUBJ">        
                            <xsl:element name="{$successResponseName}" classCode="OBS" moodCode="EVN">
                                <code code="1"/>
                                <xsl:choose>
                                    <xsl:when test="$justifyingDetectedIssue='true'">
                                        <value>
                                            <xsl:attribute name="code"><xsl:value-of select="$detectedIssueCode"/></xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.7</xsl:attribute>
                                            <xsl:attribute name="displayName"><xsl:value-of select="$errorDesc"/></xsl:attribute>
                                        </value>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <value code="8" codeSystem="2.16.840.1.113883.2.1.3.2.4.7" displayName="Successful retrieval"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:copy-of select="*/*"/>
                            </xsl:element>
						</subject>
						<queryAck type="QueryAck">
							<queryId>
								<xsl:attribute name="root">
									<xsl:value-of select="$requestGUID"/>
								</xsl:attribute>
							</queryId>
							<queryResponseCode code="OK"/>
						</queryAck>
					</ControlActProcess>
				</xsl:element>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>

	</xsl:template>
</xsl:stylesheet>