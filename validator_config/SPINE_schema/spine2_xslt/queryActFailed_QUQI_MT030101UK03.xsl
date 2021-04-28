<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="messageID">Not Known</xsl:param>
	<xsl:param name="refToMessageID">Not Known</xsl:param>	
	<xsl:param name="timeStampSent">Not Known</xsl:param>
	<xsl:param name="fromASID">Not Known</xsl:param>
	<xsl:param name="toASID">Not Known</xsl:param>
	<xsl:param name="serviceASID">Not Known</xsl:param>
    <xsl:param name="versionCode">V3NPfIT3.0</xsl:param>
    <xsl:param name="issueQualifier" select="//pyxs:col[@type='dict'][1]/pyxs:prop[@name='errorLevel']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorCode" select="//pyxs:col[@type='dict'][1]/pyxs:prop[@name='errorCode']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorDesc" select="//pyxs:col[@type='dict'][1]/pyxs:prop[@name='errorText']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>     	
	<xsl:template match="/">


<QUQI_IN010000UK14 xmlns="urn:hl7-org:v3">
	<id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></id>
	<creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></creationTime>
    <versionCode><xsl:attribute name="code"><xsl:value-of select="$versionCode"/></xsl:attribute></versionCode>
	<interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="QUQI_IN010000UK14"/>
	<processingCode code="P"/>
	<processingModeCode code="T"/>
	<acceptAckCode code="NE"/>
	<acknowledgement typeCode="AE">
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
        <xsl:for-each select="//pyxs:col[@type='dict']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/">
            <reason typeCode="RSON">
                <justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
                    <code>
                        <xsl:attribute name="code">
                            <xsl:value-of select="./pyxs:prop[@name='errorCode']"/>
                        </xsl:attribute>
                        <xsl:attribute name="codeSystem">
                            <xsl:value-of select="./pyxs:prop[@name='errorCodeSystem']"/>
                        </xsl:attribute>
                        <xsl:attribute name="displayName">
                            <xsl:value-of select="./pyxs:prop[@name='errorText']"/>
                        </xsl:attribute>
                        <qualifier>
                            <xsl:attribute name="code"><xsl:value-of select="./pyxs:prop[@name='errorLevel']"/></xsl:attribute> 
                        </qualifier>
                    </code>
                </justifyingDetectedIssueEvent>
            </reason>                          
        </xsl:for-each>   
        <queryAck type="QueryAck">
             <queryResponseCode code="ID"/>
        </queryAck>
	</ControlActEvent>
</QUQI_IN010000UK14>
	</xsl:template>
</xsl:stylesheet>
