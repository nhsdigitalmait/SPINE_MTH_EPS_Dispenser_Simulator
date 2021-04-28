<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="messageID">Not Known</xsl:param>
	<xsl:param name="prescriptionID">Not Known</xsl:param>
	<xsl:param name="refToMessageID">Not Known</xsl:param>
	<xsl:param name="timeStampSent">Not Known</xsl:param>
	<xsl:param name="fromASID">Not Known</xsl:param>
	<xsl:param name="serviceASID">Not Known</xsl:param>
	<xsl:param name="toASID">Not Known</xsl:param>
	<xsl:param name="scnNumber">Not Known</xsl:param>
	<xsl:param name="responseText">Not Known</xsl:param>
	<xsl:param name="warningCode1">None</xsl:param>
	<xsl:param name="warningCode2">None</xsl:param>
	<xsl:param name="warningCode3">None</xsl:param>
    <xsl:param name="responseName">PrescriptionsResponse</xsl:param>
    <xsl:param name="wsaRequestGUID">example-request-GUID</xsl:param>
    <xsl:param name="wsaTo"></xsl:param>
 
 
	<xsl:template match="/">
        <SOAP:Envelope xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
            <SOAP:Header>
                <wsa:MessageID>uuid:<xsl:value-of select="$messageID"/></wsa:MessageID>
                <wsa:Action>urn:nhs:names:services:mm/MCCI_IN010000UK13</wsa:Action>
                <wsa:To><xsl:value-of select="$wsaTo"/></wsa:To>
                <wsa:From>
                    <wsa:Address>https://mm.national.ncrs.nhs.uk/syncservice</wsa:Address>
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
            </SOAP:Header>
            <SOAP:Body>
                <xsl:element name="{$responseName}">
            		<hl7:MCCI_IN010000UK13 xmlns:hl7="urn:hl7-org:v3">
            			<hl7:id>
            				<xsl:attribute name="root">
            					<xsl:value-of select="$messageID"/>
            				</xsl:attribute>
            			</hl7:id>
            			<hl7:creationTime>
            				<xsl:attribute name="value">
            					<xsl:value-of select="$timeStampSent"/>
            				</xsl:attribute>
            			</hl7:creationTime>
            			<hl7:versionCode code="V3NPfIT4.2.00"/>
            			<hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="MCCI_IN010000UK13"/>
            			<hl7:processingCode code="P"/>
            			<hl7:processingModeCode code="T"/>
            			<hl7:acceptAckCode code="NE"/>
            			<hl7:acknowledgement typeCode="AA">
            				<hl7:messageRef>
            					<hl7:id>
            						<xsl:attribute name="root">
            							<xsl:value-of select="$refToMessageID"/>
            						</xsl:attribute>
            					</hl7:id>
            				</hl7:messageRef>
            			</hl7:acknowledgement>
            			<hl7:communicationFunctionRcv typeCode="RCV">
            				<hl7:device classCode="DEV" determinerCode="INSTANCE">
            					<hl7:id root="1.2.826.0.1285.0.2.0.107">
            						<xsl:attribute name="extension">
            							<xsl:value-of select="$toASID"/>
            						</xsl:attribute>
            					</hl7:id>
            				</hl7:device>
            			</hl7:communicationFunctionRcv>
            			<hl7:communicationFunctionSnd typeCode="SND">
            				<hl7:device classCode="DEV" determinerCode="INSTANCE">
            					<hl7:id root="1.2.826.0.1285.0.2.0.107">
            						<xsl:attribute name="extension">
            							<xsl:value-of select="$fromASID"/>
            						</xsl:attribute>
            					</hl7:id>
            				</hl7:device>
            			</hl7:communicationFunctionSnd>
            			<hl7:ControlActEvent classCode="CACT" moodCode="EVN">
            				<hl7:author1 typeCode="AUT">
            					<hl7:AgentSystemSDS classCode="AGNT">
            						<hl7:agentSystemSDS classCode="DEV" determinerCode="INSTANCE">
            							<hl7:id root="1.2.826.0.1285.0.2.0.107">
            								<xsl:attribute name="extension">
            									<xsl:value-of select="$serviceASID"/>
            								</xsl:attribute>
            							</hl7:id>
            						</hl7:agentSystemSDS>
            					</hl7:AgentSystemSDS>
            				</hl7:author1>
            				<xsl:if test="not($warningCode1='None')">
            					<hl7:reason typeCode="RSON">
            						<hl7:justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
            							<hl7:code codeSystem="2.16.840.1.113883.2.1.3.2.4.17.42">
            								<xsl:attribute name="code">
            									<xsl:value-of select="$warningCode1"/>
            								</xsl:attribute>
            								<hl7:qualifier>
            									<hl7:value code="WG" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.104"/>
            								</hl7:qualifier>
            							</hl7:code>
            						</hl7:justifyingDetectedIssueEvent>
            						<xsl:if test="not($warningCode2='None')">
            							<hl7:justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
            								<hl7:code codeSystem="2.16.840.1.113883.2.1.3.2.4.17.42">
            									<xsl:attribute name="code">
            										<xsl:value-of select="$warningCode2"/>
            									</xsl:attribute>
            									<hl7:qualifier>
            										<hl7:value code="WG" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.104"/>
            									</hl7:qualifier>
            								</hl7:code>
            							</hl7:justifyingDetectedIssueEvent>
            						</xsl:if>
            						<xsl:if test="not($warningCode3='None')">
            							<hl7:justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
            								<hl7:code codeSystem="2.16.840.1.113883.2.1.3.2.4.17.42">
            									<xsl:attribute name="code">
            										<xsl:value-of select="$warningCode3"/>
            									</xsl:attribute>
            									<hl7:qualifier>
            										<hl7:value code="WG" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.104"/>
            									</hl7:qualifier>
            								</hl7:code>
            							</hl7:justifyingDetectedIssueEvent>
            						</xsl:if>
            					</hl7:reason>
            				</xsl:if>
            				<hl7:requestSuccessDetail>
            					<hl7:detail><xsl:value-of select="$responseText"/></hl7:detail>
            					<hl7:id>
            						<xsl:attribute name="root">
            							<xsl:value-of select="$prescriptionID"/>
            						</xsl:attribute>
            					</hl7:id>
            				</hl7:requestSuccessDetail>
            			</hl7:ControlActEvent>
            		</hl7:MCCI_IN010000UK13>
                </xsl:element>
            </SOAP:Body>
        </SOAP:Envelope>
	</xsl:template>
</xsl:stylesheet>