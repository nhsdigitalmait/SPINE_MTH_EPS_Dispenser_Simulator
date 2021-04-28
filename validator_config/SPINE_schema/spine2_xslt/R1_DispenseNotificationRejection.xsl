<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="messageID">Not Known</xsl:param>
    <xsl:param name="refToMessageID">Not Known</xsl:param>
    <xsl:param name="timeStampSent">Not Known</xsl:param>
    <xsl:param name="fromASID">Not Known</xsl:param>
    <xsl:param name="toASID">Not Known</xsl:param>
    <xsl:param name="serviceASID">Not Known</xsl:param>
    <xsl:param name="versionCode">V3NPfIT</xsl:param>
    <xsl:param name="refToEventID">Not Known</xsl:param>


    <xsl:template match="/">


        <hl7:PORX_IN260101UK04 xmlns:hl7="urn:hl7-org:v3">
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
            <hl7:versionCode>
                <xsl:attribute name="code">
                    <xsl:value-of select="$versionCode"/>
                </xsl:attribute>
            </hl7:versionCode>
            <hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="PORX_IN260101UK04"/>
            <hl7:processingCode code="P"/>
            <hl7:processingModeCode code="T"/>
            <hl7:acceptAckCode code="NE"/>
            <hl7:acknowledgement typeCode="AE">
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
                                    <xsl:value-of select="$fromASID"/>
                                </xsl:attribute>
                            </hl7:id>
                        </hl7:agentSystemSDS>
                    </hl7:AgentSystemSDS>
                </hl7:author1>
                <hl7:subject>
                    <hl7:DispenseReject xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../Schemas/PORX_MT024201UK04.xsd" classCode="INFO" moodCode="EVN" type="ControlAct">
                        <!--  This is ID of the dispense rejection  -->
                        <hl7:id>
                            <xsl:attribute name="root">
                                <xsl:value-of select="$messageID"/>
                            </xsl:attribute>
                        </hl7:id>
                        <hl7:effectiveTime>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$timeStampSent"/>
                            </xsl:attribute>
                        </hl7:effectiveTime>
                        <hl7:pertinentInformation2 typeCode="PERT" type="ActRelationship">
                            <hl7:pertinentDispenseRejectionReason classCode="OBS" moodCode="EVN" type="Observation">
                                <xsl:for-each select="//pyxs:col[@type='dict']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/">
                                    <hl7:code codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30" code="DNRR"/>
                                    <hl7:text>
                                        <xsl:value-of select="./pyxs:prop[@name='errorText']"/>
                                    </hl7:text>
                                    <hl7:value>
                                        <xsl:attribute name="codeSystem">
                                            <xsl:value-of select="./pyxs:prop[@name='errorCodeSystem']"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="./pyxs:prop[@name='errorCode']"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="./pyxs:prop[@name='errorText']"/>
                                        </xsl:attribute>
                                    </hl7:value>
                                </xsl:for-each>
                            </hl7:pertinentDispenseRejectionReason>
                        </hl7:pertinentInformation2>
                        <hl7:pertinentInformation1 typeCode="PERT" type="ActRelationship">
                            <hl7:pertinentDispenseNotificationRef classCode="INFO" moodCode="EVN" type="ControlAct">
                                <hl7:id>
                                    <xsl:attribute name="root">
                                        <xsl:value-of select="$refToEventID"/>
                                    </xsl:attribute>
                                </hl7:id>
                            </hl7:pertinentDispenseNotificationRef>
                        </hl7:pertinentInformation1>
                    </hl7:DispenseReject>
                </hl7:subject>
            </hl7:ControlActEvent>
        </hl7:PORX_IN260101UK04>

    </xsl:template>
</xsl:stylesheet>
