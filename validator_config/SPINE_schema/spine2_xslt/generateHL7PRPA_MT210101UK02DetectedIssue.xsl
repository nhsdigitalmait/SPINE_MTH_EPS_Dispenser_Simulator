<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="messageID">Not Known</xsl:param>
	<xsl:param name="refToMessageID">Not Known</xsl:param>	
	<xsl:param name="timeStampSent">Not Known</xsl:param>
	<xsl:param name="toPartyKey">Not Known</xsl:param>
    <xsl:param name="fromPartyKey">Not Known</xsl:param>
    <xsl:param name="fromASID">Not Known</xsl:param>
	<xsl:param name="toASID">Not Known</xsl:param>
	<xsl:param name="serviceASID">Not Known</xsl:param>      
    <xsl:param name="issueQualifier" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorLevel']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorCode" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorCode']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorDesc" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorText']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>     
	<xsl:param name="versionCode">V3NPfIT</xsl:param>
	
	<xsl:template match="/">


<hl7:PRPA_IN140000UK01 xmlns:hl7="urn:hl7-org:v3">
	<hl7:id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></hl7:id>
	<hl7:creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></hl7:creationTime>
	<hl7:versionCode>
	<xsl:attribute name="code"><xsl:value-of select="$versionCode"/></xsl:attribute>
	</hl7:versionCode>
	<hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="PRPA_IN140000UK01"/>
	<hl7:processingCode code="P"/>
	<hl7:processingModeCode code="T"/>
	<hl7:acceptAckCode code="NE"/>
	<hl7:acknowledgement typeCode="AE">
		<hl7:messageRef>
			<hl7:id><xsl:attribute name="root"><xsl:value-of select="$refToMessageID"/></xsl:attribute></hl7:id>
		</hl7:messageRef>
	</hl7:acknowledgement>
	<hl7:communicationFunctionRcv typeCode="RCV">
                <hl7:device classCode="DEV" determinerCode="INSTANCE">
                    <hl7:id root="2.16.840.1.113883.2.1.3.2.4.10">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="$fromPartyKey"/>
                        </xsl:attribute>
                    </hl7:id>
                </hl7:device>
            </hl7:communicationFunctionRcv>
            <hl7:communicationFunctionSnd typeCode="SND">
                <hl7:device classCode="DEV" determinerCode="INSTANCE">
                    <hl7:id root="2.16.840.1.113883.2.1.3.2.4.10">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="$toPartyKey"/>
                        </xsl:attribute>
                    </hl7:id>
                </hl7:device>
            </hl7:communicationFunctionSnd>
        <hl7:ControlActEvent classCode="CACT" moodCode="EVN">
        <hl7:subject typeCode="SUBJ" contextConductionInd="false">
            <PdsFailureResponse classCode="OBS" moodCode="EVN" xmlns="urn:hl7-org:v3" xmlns:soapcsf="http://www.w3.org/2001/12/soap-envelope" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:soap="http://www.w3.org/2001/12/soap-envelope">
                <code code="1" />
                <value code="15" codeSystem="2.16.840.1.113883.2.1.3.2.4.7">
                 <xsl:attribute name="displayName">
                    <xsl:value-of select="$errorDesc"/>
                </xsl:attribute>
                </value>
                <inFulfillmentOf typeCode="FLFS">
                    <priorPdsRequest classCode="REG" moodCode="RQO">
                        <id>
                            <xsl:attribute name="root">
                                <xsl:value-of select="$messageID"/>
                            </xsl:attribute>
                        </id>
                    </priorPdsRequest>
                </inFulfillmentOf>                        
                 <reason>
                    <justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
                        <code code="1" />
                        <value>
                            <xsl:value-of select="$errorDesc"/>
                        </value>
                    </justifyingDetectedIssueEvent>
                </reason>
            </PdsFailureResponse>
	   </hl7:subject> 
    </hl7:ControlActEvent>
</hl7:PRPA_IN140000UK01>


	</xsl:template>
</xsl:stylesheet>
