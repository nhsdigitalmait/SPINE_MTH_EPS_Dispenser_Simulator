<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3">
    <xsl:output indent="yes"/>
    <xsl:param name="responseAction">PORX_IN370101UK31</xsl:param>
    <xsl:param name="timeStampSent">NotProvided</xsl:param>
    <xsl:param name="batchPayloadID">NotProvided</xsl:param>
    <xsl:param name="claimReplacementIndicator">False</xsl:param>
    <xsl:param name="prescriptionID">NotProvided</xsl:param>
    <xsl:param name="prescriptionInstance">NotProvided</xsl:param>

    <xsl:template match="/">
        <ppdbatch:batchItem xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ppdbatch="http://spine.nhs.uk/spine-service-ppd" xsi:schemaLocation="http://spine.nhs.uk/spine-service-ppd PPD-Batch-Schema.xsd">
            <ppdbatch:ppdAdditionalProperties>
                <ppdbatch:entry id="urn:spine:types:messageId">
                    <xsl:value-of select="$batchPayloadID"/>
                </ppdbatch:entry>
                <ppdbatch:entry id="2.16.840.1.113883.2.1.3.2.4.12">
                    <xsl:value-of select="$responseAction"/>
                </ppdbatch:entry>
                <ppdbatch:entry id="urn:spine:types:prescriptionId">
                    <xsl:value-of select="$prescriptionID"/>
                </ppdbatch:entry>
                <ppdbatch:entry id="urn:spine:types:prescriptionInstanceNo">
                    <xsl:value-of select="$prescriptionInstance"/>
                </ppdbatch:entry>
                <ppdbatch:entry id="urn:spine:types:messageType">PORX_MT142006UK31</ppdbatch:entry>
            </ppdbatch:ppdAdditionalProperties>
            <ppdbatch:messagePayload>
                <ReimbursmentClaim xsi:schemaLocation="urn:hl7-org:v3 ..\schemas\PORX_MT142006UK31.xsd" classCode="INFO" moodCode="EVN" type="ControlAct" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ppdbatch="http://spine.nhs.uk/spine-service-ppd" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:soapcsf="http://www.w3.org/2001/12/soap-envelope" xmlns="urn:hl7-org:v3" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:soap="http://www.w3.org/2001/12/soap-envelope">
                    <id>
                        <xsl:attribute name="root">
                            <xsl:value-of select="$batchPayloadID"/>
                        </xsl:attribute>
                    </id>
                    <effectiveTime>
                        <xsl:attribute name="value">
                            <xsl:value-of select="$timeStampSent"/>
                        </xsl:attribute>
                    </effectiveTime>
                    <xsl:copy-of select="/*/hl7:component1"/>
                    <xsl:copy-of select="/*/hl7:component2"/>
                    <xsl:copy-of select="/*/hl7:component3"/>
                    <xsl:copy-of select="/*/hl7:component4"/>
                    <pertinentInformation typeCode="PERT" contextConductionInd="true">
                        <seperatableInd value="false"/>
                        <pertinentReplacementInd classCode="OBS" moodCode="EVN">
                            <code codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30" code="RPL"/>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="$claimReplacementIndicator"/>
                                </xsl:attribute>
                            </value>
                        </pertinentReplacementInd>
                    </pertinentInformation>
                </ReimbursmentClaim>
            </ppdbatch:messagePayload>
        </ppdbatch:batchItem>
    </xsl:template>
</xsl:stylesheet>
