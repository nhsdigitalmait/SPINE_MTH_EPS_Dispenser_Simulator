<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="messageID">Not Known</xsl:param>
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
        <QUPC_IN060000UK32 xmlns="urn:hl7-org:v3">
        	<id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></id>
        	<creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></creationTime>
        	<versionCode code="V3NPfIT6.2.00"/>
        	<interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="QUPC_IN060000UK32"/>
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
        		<subject typeCode="SUBJ">
        			<xsl:copy-of select="."/>
        		</subject>
                <queryAck type="QueryAck">
                  <queryResponseCode code="OK"/>
                </queryAck>
        	</ControlActEvent>
        </QUPC_IN060000UK32>
	</xsl:template>
</xsl:stylesheet>
