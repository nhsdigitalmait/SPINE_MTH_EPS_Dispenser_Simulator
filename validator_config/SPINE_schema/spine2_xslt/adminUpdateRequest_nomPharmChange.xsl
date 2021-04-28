<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="messageID">NotKnown</xsl:param>
    <xsl:param name="timeStampSent">NotKnown</xsl:param>
    <xsl:param name="fromASID">NotKnown</xsl:param>
    <xsl:param name="toASID">NotKnown</xsl:param>
    <xsl:param name="prescriptionID">NotKnown</xsl:param>
    <xsl:param name="currentInstance">NotKnown</xsl:param>
    <xsl:param name="nominatedPerformer">NotKnown</xsl:param>
    <xsl:param name="nominatedPerformerType">NotKnown</xsl:param>

    <xsl:template match="/">
<PORX_IN999000UK01 xmlns="urn:hl7-org:v3">
    <id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></id>
    <creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></creationTime>
    <versionCode code="V3NPfIT4.2.00"/>
    <interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="PORX_IN999000UK01"/>
    <processingCode code="P"/>
    <processingModeCode code="T"/>
    <acceptAckCode code="NE"/>
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
                    <id root="1.2.826.0.1285.0.2.0.107">
                    <xsl:attribute name="extension"><xsl:value-of select="$fromASID"/></xsl:attribute>
                    </id>
                </agentSystemSDS>
            </AgentSystemSDS>
        </author1>
        <subject>
            <prescriptionUpdateRequest xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ..\schemas\PORX_MT999000UK01.xsd" classCode="ORGANIZER" moodCode="EVN">
                <id root="F8966CE0-E034-11DA-863F-A7A405B41481"/>
                <effectiveTime value="20120119113000"/>
                <reference>
                    <!-- Used to identify the target prescription, version and instance-->
                    <prescriptionID>
                    <xsl:attribute name="value"><xsl:value-of select="$prescriptionID"/></xsl:attribute>
                    </prescriptionID>
                    <prescriptionVersion value="R2"/>
                    <currentInstance>
                    <xsl:attribute name="value"><xsl:value-of select="$currentInstance"/></xsl:attribute>
                    </currentInstance>
                </reference>
                <optionalItems>
                    <!--These are optional items and relate to fields stored on the JSON for the record-->
                    <nominatedPerformer>
                        <xsl:attribute name="value"><xsl:value-of select="$nominatedPerformer"/></xsl:attribute>                
                    </nominatedPerformer>
                    <nominatedPerformerType>
                        <xsl:attribute name="value"><xsl:value-of select="$nominatedPerformerType"/></xsl:attribute>
                    </nominatedPerformerType>
                </optionalItems>
            </prescriptionUpdateRequest>
        </subject>
    </ControlActEvent>
</PORX_IN999000UK01>

    </xsl:template>
</xsl:stylesheet>