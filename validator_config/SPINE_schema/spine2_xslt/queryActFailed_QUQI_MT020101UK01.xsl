<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="messageID">Not Known</xsl:param>
    <xsl:param name="refToMessageID">Not Known</xsl:param>
    <xsl:param name="timeStampSent">Not Known</xsl:param>
    <xsl:param name="fromPartyKey">Not Known</xsl:param>
    <xsl:param name="toPartyKey">Not Known</xsl:param>
    <xsl:param name="fromASID">Not Known</xsl:param>
    <xsl:param name="serviceASID">Not Known</xsl:param>
    <xsl:param name="toASID">Not Known</xsl:param>
    <xsl:param name="scnNumber">Not Known</xsl:param>
    <xsl:param name="queryCode">Not Known</xsl:param>
    <xsl:param name="queryCode">Not Known</xsl:param>
    <xsl:param name="queryCodeDisplayName">Not Known</xsl:param>
    <xsl:param name="ackTypeCode">AE</xsl:param>
    <xsl:param name="detailTypeCode">ER</xsl:param>
    <xsl:param name="detailCode">ME</xsl:param>
    <xsl:param name="jdieCode">1</xsl:param>
    <xsl:param name="errorLevel" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorLevel']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorCode" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorCode']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorText" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorText']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="p1r1ErrorCode" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='p1r1ErrorCode']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>


    <xsl:template match="/">
        <hl7:QUQI_IN010000UK01 xmlns:hl7="urn:hl7-org:v3">
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
            <hl7:versionCode code="V3NPfIT2.0"/>
            <hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="QUQI_IN010000UK01"/>
            <hl7:processingCode code="P" />
            <hl7:processingModeCode code="T" />
            <hl7:acceptAckCode code="NE" />
            <hl7:acknowledgement>
                <xsl:attribute name="typeCode">
                    <xsl:value-of select="$ackTypeCode"/>
                </xsl:attribute>
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
            <hl7:ControlAct classCode="CACT" moodCode="EVN">
                <hl7:reason typeCode="RSON">
                    <hl7:justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
                        <hl7:code code="1"/>
                        <hl7:value>
                            <xsl:value-of select="$errorText"/>
                        </hl7:value>
                    </hl7:justifyingDetectedIssueEvent>
                </hl7:reason>
                <hl7:queryAck type="QueryAck">
                    <hl7:queryId>
                        <xsl:attribute name="root">
                            <xsl:value-of select="$refToMessageID"/>
                        </xsl:attribute>
                    </hl7:queryId>
                    <xsl:if test="$queryCode='0'">
                        <hl7:queryResponseCode code="0" displayName="Response failure due to inadequate, incorrect or invalid information in request"/>
                    </xsl:if>
                    <xsl:if test="$queryCode='1'">
                        <hl7:queryResponseCode code="1" displayName="No match to a Service User record"/>
                    </xsl:if>
                    <xsl:if test="$queryCode='2'">
                        <hl7:queryResponseCode code="2" displayName="Multiple match, number of entries exceed current operational limit for number of matches returned"/>
                    </xsl:if>
                </hl7:queryAck>
            </hl7:ControlAct>
        </hl7:QUQI_IN010000UK01>
    </xsl:template>
</xsl:stylesheet>
