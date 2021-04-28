<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="messageID">Not Known</xsl:param>
    <xsl:param name="refToMessageID">Not Known</xsl:param>
    <xsl:param name="timeStampSent">Not Known</xsl:param>
    <xsl:param name="versionCode">V3NPfIT3.1.10</xsl:param>
    <xsl:param name="fromASID">Not Known</xsl:param>
    <xsl:param name="toASID">Not Known</xsl:param>
    <xsl:param name="errorCode">Not Known</xsl:param>
    <xsl:param name="errorDesc">Not Known</xsl:param>
    <xsl:param name="issueQualifier">Not Known</xsl:param>

    <xsl:param name="responseService">Not Known</xsl:param>
    <xsl:param name="responseAction">Not Known</xsl:param>
    <xsl:param name="responseName">Not Known</xsl:param>
    <xsl:param name="acknowledgementType">AR</xsl:param>
    <xsl:param name="wsaRequestGUID">example-request-GUID</xsl:param>
    <xsl:param name="wsaTo"></xsl:param>

    <xsl:template match="/">

        <SOAP:Envelope xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
            <SOAP:Header>
                <wsa:MessageID>uuid:<xsl:value-of select="$messageID"/></wsa:MessageID>
                <wsa:Action>urn:nhs:names:services:<xsl:value-of select="$responseService"/>/<xsl:value-of select="$responseAction"/></wsa:Action>
                <wsa:To><xsl:value-of select="$wsaTo"/></wsa:To>
                <wsa:From>
                    <wsa:Address>https://<xsl:value-of select="$responseService"/>.national.ncrs.nhs.uk/syncservice</wsa:Address>
                </wsa:From>
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
                <wsa:RelatesTo>uuid:<xsl:value-of select="$wsaRequestGUID"/></wsa:RelatesTo>
            </SOAP:Header>

            <SOAP:Body>
                <hl7:MCCI_IN010000UK13 xmlns:hl7="urn:hl7-org:v3">

                    <hl7:id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></hl7:id>
                    <hl7:creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></hl7:creationTime>
                    <hl7:versionCode><xsl:attribute name="code"><xsl:value-of select="$versionCode"/></xsl:attribute></hl7:versionCode>
                    <hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="MCCI_IN010000UK13"/>
                    <hl7:processingCode code="P"/>
                    <hl7:processingModeCode code="T"/>
                    <hl7:acceptAckCode code="NE"/>

                    <hl7:acknowledgement><xsl:attribute name="typeCode"><xsl:value-of select="$acknowledgementType" /></xsl:attribute>
                        <!-- acknowledgementDetail section is for reporting errors when
                             acknowledgement is rejected (type = "AR") -->
                        <xsl:if test="$acknowledgementType = 'AR'">
                            <hl7:acknowledgementDetail><xsl:attribute name="typeCode"><xsl:value-of select="$issueQualifier"/></xsl:attribute>
                                <hl7:code codeSystem="2.16.840.1.113883.2.1.3.2.4.17.32">
                                    <xsl:attribute name="code"><xsl:value-of select="$errorCode"/></xsl:attribute><xsl:attribute name="displayName"><xsl:value-of select="$errorDesc"/></xsl:attribute>
                                </hl7:code>
                            </hl7:acknowledgementDetail>
                        </xsl:if>
                        <hl7:messageRef>
                            <hl7:id><xsl:attribute name="root"><xsl:value-of select="$refToMessageID"/></xsl:attribute></hl7:id>
                        </hl7:messageRef>
                    </hl7:acknowledgement>

                    <hl7:communicationFunctionRcv typeCode="RCV">
                        <hl7:device classCode="DEV" determinerCode="INSTANCE">
                            <hl7:id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$toASID"/></xsl:attribute></hl7:id>
                        </hl7:device>
                    </hl7:communicationFunctionRcv>

                    <hl7:communicationFunctionSnd typeCode="SND">
                        <hl7:device classCode="DEV" determinerCode="INSTANCE">
                            <hl7:id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$fromASID"/></xsl:attribute></hl7:id>
                        </hl7:device>
                    </hl7:communicationFunctionSnd>

                    <hl7:ControlActEvent classCode="CACT" moodCode="EVN">
                        <hl7:author1 typeCode="AUT">
                            <hl7:AgentSystemSDS classCode="AGNT">
                                <hl7:agentSystemSDS classCode="DEV" determinerCode="INSTANCE">
                                    <hl7:id root="1.2.826.0.1285.0.2.0.107"><xsl:attribute name="extension"><xsl:value-of select="$fromASID"/></xsl:attribute></hl7:id>
                                </hl7:agentSystemSDS>
                            </hl7:AgentSystemSDS>
                        </hl7:author1>
                    </hl7:ControlActEvent>

                </hl7:MCCI_IN010000UK13>
            </SOAP:Body>

        </SOAP:Envelope>

    </xsl:template>

</xsl:stylesheet>
