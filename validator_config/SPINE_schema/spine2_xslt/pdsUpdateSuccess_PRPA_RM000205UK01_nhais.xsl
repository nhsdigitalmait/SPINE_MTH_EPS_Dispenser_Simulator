<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="messageID">Not Known</xsl:param>
	<xsl:param name="refToMessageID">Not Known</xsl:param>	
	<xsl:param name="timeStampSent">Not Known</xsl:param>
	<xsl:param name="fromASID">Not Known</xsl:param>
	<xsl:param name="serviceASID">Not Known</xsl:param>
	<xsl:param name="toASID">Not Known</xsl:param>
	<xsl:param name="scnNumber">Not Known</xsl:param>
	<xsl:param name="warningCode1">None</xsl:param>
	<xsl:param name="warningCode2">None</xsl:param>
	<xsl:param name="warningCode3">None</xsl:param>
    <xsl:param name="versionCode">V3NPfIT</xsl:param>
    
	<xsl:template match="/">
<hl7:PRPA_IN000209UK01 xmlns:hl7="urn:hl7-org:v3">
	<hl7:id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></hl7:id>
	<hl7:creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></hl7:creationTime>
			<hl7:versionCode>
				<xsl:attribute name="code">
					<xsl:value-of select="$versionCode"/>
				</xsl:attribute>
			</hl7:versionCode>

	<hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="PRPA_IN000209UK01"/>
	<hl7:processingCode code="P"/>
	<hl7:processingModeCode code="T"/>
	<hl7:acceptAckCode code="NE"/>
	<hl7:acknowledgement typeCode="AA">
		<hl7:messageRef>
			<hl7:id><xsl:attribute name="root"><xsl:value-of select="$refToMessageID"/></xsl:attribute></hl7:id>
		</hl7:messageRef>
	</hl7:acknowledgement>
	<hl7:communicationFunctionRcv typeCode="RCV">
		<hl7:device classCode="DEV" determinerCode="INSTANCE">
			<hl7:id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$toASID"/></xsl:attribute></hl7:id>
		</hl7:device>
	</hl7:communicationFunctionRcv>
	<hl7:communicationFunctionSnd typeCode="SND">
		<hl7:device classCode="DEV" determinerCode="INSTANCE">
			<hl7:id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$fromASID"/></xsl:attribute></hl7:id>
		</hl7:device>
	</hl7:communicationFunctionSnd>
	<hl7:ControlActEvent classCode="CACT" moodCode="EVN">
		<hl7:author1 typeCode="AUT">
			<hl7:AgentSystemSDS classCode="AGNT">
				<hl7:agentSystemSDS classCode="DEV" determinerCode="INSTANCE">
					<hl7:id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$fromASID"/></xsl:attribute></hl7:id>
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
        </hl7:reason>
        </xsl:if>
        <xsl:if test="not($warningCode2='None')">
            <hl7:reason typeCode="RSON">
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
            </hl7:reason>
        </xsl:if>
        <xsl:if test="not($warningCode3='None')">
            <hl7:reason typeCode="RSON">
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
           </hl7:reason>
        </xsl:if>
        <hl7:subject typeCode="SUBJ" contextConductionInd="false">
			<PdsSuccessfulUpdateResponse classCode="REG" moodCode="EVN" xmlns="urn:hl7-org:v3" xmlns:soapcsf="http://www.w3.org/2001/12/soap-envelope" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:soap="http://www.w3.org/2001/12/soap-envelope">
				<pertinentInformation typeCode="PERT">
					<pertinentSerialChangeNumber classCode="OBS" moodCode="EVN">
						<code code="2" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.35"/>
						<value><xsl:attribute name="value"><xsl:value-of select="$scnNumber"/></xsl:attribute></value>
					</pertinentSerialChangeNumber>
				</pertinentInformation>
			</PdsSuccessfulUpdateResponse>
		</hl7:subject>
	</hl7:ControlActEvent>
</hl7:PRPA_IN000209UK01>
	</xsl:template>
</xsl:stylesheet>