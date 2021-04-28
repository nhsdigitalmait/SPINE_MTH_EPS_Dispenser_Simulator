<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="messageID">Not Known</xsl:param>
	<xsl:param name="refToMessageID">Not Known</xsl:param>	
	<xsl:param name="timeStampSent">Not Known</xsl:param>
    <xsl:param name="versionCode">V3NPfIT3.0</xsl:param>
	<xsl:param name="fromASID">Not Known</xsl:param>
	<xsl:param name="serviceASID">Not Known</xsl:param>
	<xsl:param name="toASID">Not Known</xsl:param>
	<xsl:param name="scnNumber">Not Known</xsl:param>
	<xsl:param name="justifyingDetectedIssue">false</xsl:param>
	<xsl:param name="detectedIssueCode">Not Known</xsl:param>
	<xsl:param name="errorDesc">Not Known</xsl:param>
	<xsl:param name="issueQualifier">Not Known</xsl:param>
    <xsl:param name="justifyingDetectedIssue1">false</xsl:param>
    <xsl:param name="detectedIssueCode1">Not Known</xsl:param>
    <xsl:param name="errorDesc1">Not Known</xsl:param>
    <xsl:param name="issueQualifier1">Not Known</xsl:param>
    <xsl:param name="justifyingDetectedIssue2">false</xsl:param>
    <xsl:param name="detectedIssueCode2">Not Known</xsl:param>
    <xsl:param name="errorDesc2">Not Known</xsl:param>
    <xsl:param name="issueQualifier2">Not Known</xsl:param>
    


	<xsl:template match="/">
<QUPA_IN030000UK15 xmlns="urn:hl7-org:v3">
	<id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></id>
	<creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></creationTime>
    <versionCode><xsl:attribute name="code"><xsl:value-of select="$versionCode"/></xsl:attribute></versionCode>    
	<interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="QUPA_IN030000UK15"/>
	<processingCode code="P"/>
	<processingModeCode code="T"/>
	<acceptAckCode code="NE"/>
	<acknowledgement typeCode="AA">
		<messageRef>
			<id><xsl:attribute name="root"><xsl:value-of select="$refToMessageID"/></xsl:attribute></id>
		</messageRef>
	</acknowledgement>
	<communicationFunctionRcv typeCode="RCV">
		<device classCode="DEV" determinerCode="INSTANCE">
			<id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$toASID"/></xsl:attribute></id>
		</device>
	</communicationFunctionRcv>
	<communicationFunctionSnd typeCode="SND">
		<device classCode="DEV" determinerCode="INSTANCE">
			<id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$fromASID"/></xsl:attribute></id>
		</device>
	</communicationFunctionSnd>
	<ControlActEvent classCode="CACT" moodCode="EVN">
		<author1 typeCode="AUT">
			<AgentSystemSDS classCode="AGNT">
				<agentSystemSDS classCode="DEV" determinerCode="INSTANCE">
					<id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$fromASID"/></xsl:attribute></id>
				</agentSystemSDS>
			</AgentSystemSDS>
		</author1>
		<xsl:if test="$justifyingDetectedIssue='true'">
			<reason typeCode="RSON">
				<justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
					<code>
						<xsl:attribute name="code"><xsl:value-of select="$errorCode"/></xsl:attribute>
                        <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.42</xsl:attribute>
                        <xsl:attribute name="displayName"><xsl:value-of select="$errorDesc"/></xsl:attribute>
						<qualifier>
							<xsl:attribute name="code"><xsl:value-of select="$issueQualifier"/></xsl:attribute>	
						</qualifier>
					</code>
				</justifyingDetectedIssueEvent>
			</reason>
		</xsl:if>
        <xsl:if test="$justifyingDetectedIssue1='true'">
            <reason typeCode="RSON">
                <justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
                    <code>
                        <xsl:attribute name="code"><xsl:value-of select="$errorCode1"/></xsl:attribute>
                        <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.42</xsl:attribute>
                        <xsl:attribute name="displayName"><xsl:value-of select="$errorDesc1"/></xsl:attribute>
                        <qualifier>
                            <xsl:attribute name="code"><xsl:value-of select="$issueQualifier1"/></xsl:attribute> 
                        </qualifier>
                    </code>
                </justifyingDetectedIssueEvent>
            </reason>
        </xsl:if>
        <xsl:if test="$justifyingDetectedIssue2='true'">
            <reason typeCode="RSON">
                <justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
                    <code>
                        <xsl:attribute name="code"><xsl:value-of select="$errorCode2"/></xsl:attribute>
                        <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.42</xsl:attribute>
                        <xsl:attribute name="displayName"><xsl:value-of select="$errorDesc2"/></xsl:attribute>
                        <qualifier>
                            <xsl:attribute name="code"><xsl:value-of select="$issueQualifier2"/></xsl:attribute> 
                        </qualifier>
                    </code>
                </justifyingDetectedIssueEvent>
            </reason>
        </xsl:if>
        <queryAck type="QueryAck">
          <queryResponseCode code="OK"/>
        </queryAck>
		<subject typeCode="SUBJ">
			<xsl:copy-of select="."/>
		</subject>
	</ControlActEvent>
</QUPA_IN030000UK15>
	</xsl:template>
</xsl:stylesheet>
