<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="messageID">Not Known</xsl:param>
    <xsl:param name="refToMessageID">Not Known</xsl:param>
    <xsl:param name="responseService">lrs</xsl:param>
    <xsl:param name="responseAction">MCCI_IN010000UK13</xsl:param>
    <xsl:param name="timeStampSent">Not Known</xsl:param>
    <xsl:param name="fromASID">Not Known</xsl:param>
    <xsl:param name="toASID">Not Known</xsl:param>
    <xsl:param name="serviceASID">Not Known</xsl:param>
    <xsl:param name="versionCode">V3NPFIT</xsl:param>
    <xsl:param name="responseName">NotKnown</xsl:param>
    <xsl:param name="wsaTo"></xsl:param>

    <xsl:template match="/">

        <SOAP:Envelope xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
            <SOAP:Header>
                <wsa:MessageID>uuid:<xsl:value-of select="$messageID"/></wsa:MessageID>
                <wsa:Action>urn:nhs:names:services:<xsl:value-of select="$responseService"/>/<xsl:value-of select="$responseAction"/></wsa:Action>
                <wsa:To><xsl:value-of select="$wsaTo"/></wsa:To>
                <wsa:From>
                    <wsa:Address>https://<xsl:value-of select="$responseService"/>-sync.national.ncrs.nhs.uk/syncservice-lrs/acf</wsa:Address>
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
                <wsa:RelatesTo>uuid:<xsl:value-of select="$refToMessageID"/></wsa:RelatesTo>
            </SOAP:Header>
            <SOAP:Body>
                <xsl:element name="{$responseName}">
                    <xsl:element name="{$responseAction}" xmlns="urn:hl7-org:v3">
                        <id>
                            <xsl:attribute name="root">
                                <xsl:value-of select="$messageID"/>
                            </xsl:attribute>
                        </id>
                        <creationTime>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$timeStampSent"/>
                            </xsl:attribute>
                        </creationTime>
                        <versionCode>
                        <xsl:attribute name="code">
                            <xsl:value-of select="$versionCode"/>
                        </xsl:attribute>
                        </versionCode>
                        <interactionId root="2.16.840.1.113883.2.1.3.2.4.12">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="$responseAction"/>
                            </xsl:attribute>
                        </interactionId>
                        <processingCode code="P"/>
                        <processingModeCode code="T"/>
                        <acceptAckCode code="NE"/>
                        <acknowledgement typeCode="AE">
                            <messageRef>
                                <id>
                                    <xsl:attribute name="root">
                                        <xsl:value-of select="$refToMessageID"/>
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
                            <xsl:for-each select="//pyxs:col[@type='dict' and @name='errors']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/">
                                <reason typeCode="RSON">
                                    <justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
                                        <code>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="pyxs:prop[@name='errorCode']"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">
                                                <xsl:value-of select="pyxs:prop[@name='errorCodeSystem']"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="pyxs:prop[@name='errorText']"/>
                                            </xsl:attribute>
                                            <xsl:if test="count(pyxs:col[@name='errorQualifier']) &gt; 0">
                                                <qualifier>
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="pyxs:col[@name='errorQualifier']/pyxs:prop[@name='errorCode']"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="codeSystem">
                                                        <xsl:value-of select="pyxs:col[@name='errorQualifier']/pyxs:prop[@name='errorCodeSystem']"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="pyxs:col[@name='errorQualifier']/pyxs:prop[@name='errorText']"/>
                                                    </xsl:attribute>
                                                </qualifier>
                                            </xsl:if>
                                        </code>
                                    </justifyingDetectedIssueEvent>
                                </reason>
                            </xsl:for-each>
                        </ControlActEvent>
                    </xsl:element>
                </xsl:element>
            </SOAP:Body>
        </SOAP:Envelope>
    </xsl:template>
</xsl:stylesheet>