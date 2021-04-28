<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:npfitlc="NPFIT:HL7:Localisation">
    <xsl:output indent="yes"/>

    <xsl:param name="messageID">NotKnown</xsl:param>
    <xsl:param name="responseAction">QUPC_IN160102UK05</xsl:param>
    <xsl:param name="versionCode">V3NPfIT3.0</xsl:param>
    <xsl:param name="refToMessageID">NotKnown</xsl:param>
    <xsl:param name="timeStampSent">NotKnown</xsl:param>
    <xsl:param name="fromASID">NotKnown</xsl:param>
    <xsl:param name="serviceASID">NotKnown</xsl:param>
    <xsl:param name="toASID">NotKnown</xsl:param>
    <xsl:param name="scnNumber">NotKnown</xsl:param>
    <xsl:param name="justifyingDetectedIssue">false</xsl:param>
    <xsl:param name="detectedIssueCode">NotKnown</xsl:param>
    <xsl:param name="errorDesc">NotKnown</xsl:param>
    <xsl:param name="issueQualifier">NotKnown</xsl:param>
    <xsl:param name="queryCode">OK</xsl:param>


    <xsl:template match="/">
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
            <acknowledgement typeCode="AA">
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
                <xsl:if test="$justifyingDetectedIssue='true'">
                    <reason typeCode="RSON">
                        <justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
                            <code>
                                <xsl:attribute name="code">
                                    <xsl:value-of select="$errorCode"/>
                                </xsl:attribute>
                                <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.42</xsl:attribute>
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="$errorDesc"/>
                                </xsl:attribute>
                                <qualifier>
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="$issueQualifier"/>
                                    </xsl:attribute>
                                </qualifier>
                            </code>
                        </justifyingDetectedIssueEvent>
                    </reason>
                </xsl:if>
                <subject typeCode="SUBJ">
                    <xsl:copy-of select="."/>
                </subject>
                <queryAck type="QueryAck">
                    <queryResponseCode>
                        <xsl:attribute name="code">
                            <xsl:value-of select="$queryCode"/>
                        </xsl:attribute>
                    </queryResponseCode>
                </queryAck>
            </ControlActEvent>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

