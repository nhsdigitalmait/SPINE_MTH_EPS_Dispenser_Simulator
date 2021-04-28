<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="messageID">NotKnown</xsl:param>
    <xsl:param name="timeStampSent">NotKnown</xsl:param>
    <xsl:param name="fromASID">NotKnown</xsl:param>
    <xsl:param name="toASID">NotKnown</xsl:param>
    <xsl:param name="prescriptionID">NotKnown</xsl:param>
    <xsl:param name="currentInstance">NotKnown</xsl:param>
    <xsl:param name="adminAction">NotKnown</xsl:param>
    <xsl:param name="interactionID">NotKnown</xsl:param>

    <xsl:template match="/">
    <xsl:element name="{$interactionID}" xmlns="urn:hl7-org:v3">
    <id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></id>
    <creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></creationTime>
    <versionCode code="V3NPfIT4.2.00"/>
    <interactionId root="2.16.840.1.113883.2.1.3.2.4.12">
        <xsl:attribute name="extension">
        <xsl:value-of select="$interactionID"/>
        </xsl:attribute>
    </interactionId>
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
            <prescriptionActionRequest xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ..\schemas\PORX_MT999000UK01.xsd" classCode="ORGANIZER" moodCode="EVN">
                <id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></id>
                <effectiveTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></effectiveTime>
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
                    <action>
                    <xsl:attribute name="value"><xsl:value-of select="$adminAction"/></xsl:attribute>
                    </action>
                </optionalItems>
            </prescriptionActionRequest>
        </subject>
    </ControlActEvent>
</xsl:element>

    </xsl:template>
</xsl:stylesheet>