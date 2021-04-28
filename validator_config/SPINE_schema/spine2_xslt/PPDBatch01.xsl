<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3"
    xmlns:hl7="urn:hl7-org:v3">
    <xsl:output indent="yes"/>
    <xsl:param name="messageID">MessageID</xsl:param>
    <xsl:param name="timeStampSent">NotProvided</xsl:param>
    <xsl:param name="fromAC">338068513039</xsl:param>
    <xsl:param name="toAC">285873935032</xsl:param>
    <xsl:param name="messagesInBatch">NotProvided</xsl:param>
    <xsl:param name="sequenceNumber">NotProvided</xsl:param>

    <xsl:template match="/">
        <soap:Envelope xmlns:hl7="urn:hl7-org:v3" xmlns:soap="http://www.w3.org/2001/12/soap-envelope" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ppdbatch="http://spine.nhs.uk/spine-service-ppd" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:soapcsf="http://www.w3.org/2001/12/soap-envelope" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns="urn:hl7-org:v3">
            <soap:Header>
                <nasp:requestHeader>
                    <nasp:interactionId>urn:spine:interactionid:ppdbatch01</nasp:interactionId>
                    <nasp:messageId>
                        <xsl:value-of select="$messageID" />
                    </nasp:messageId>
                    <nasp:clientId>urn:spine:tmsclient:TMS</nasp:clientId>
                    <!-- Conversation ID added in per the Spine 1 solution but not in the specs -->
                    <nasp:conversationId>
                        <xsl:value-of select="$messageID" />
                    </nasp:conversationId>
                    <nasp:creationTime>
                        <xsl:value-of select="$timeStampSent" />
                    </nasp:creationTime>
                    <nasp:serviceId>urn:nhs:names:services:tms</nasp:serviceId>
                    <nasp:noPerfLog>false</nasp:noPerfLog>
                    <nasp:authorId root="1.2.826.0.1285.0.2.0.107">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="$fromAC" />
                        </xsl:attribute>
                    </nasp:authorId>
                    <nasp:orgAddressContext>
                        <nasp:fromAC root="1.2.826.0.1285.0.2.0.107">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="$fromAC" />
                            </xsl:attribute>
                        </nasp:fromAC>
                        <nasp:toAC root="1.2.826.0.1285.0.2.0.107">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="$toAC" />
                            </xsl:attribute>
                        </nasp:toAC>
                    </nasp:orgAddressContext>
                    <!-- Additional elements added in per the Spine 1 solution but not in the specs -->
                    <nasp:event type="urn:spine:types:subsystem-message-despatched">
                        <xsl:attribute name="value">
                            <xsl:value-of select="concat($timeStampSent,'000')" />
                        </xsl:attribute>
                    </nasp:event>
                    <nasp:requestState>
                        <eb:CPAId>S2001919A2011844</eb:CPAId>
                        <eb:ConversationId>
                            <xsl:value-of select="$messageID" />
                        </eb:ConversationId>
                        <eb:MessageId>
                            <xsl:value-of select="$messageID" />
                        </eb:MessageId>
                        <eb:InboundMessageSizeInBits>0</eb:InboundMessageSizeInBits>
                        <nasp:event type="urn:spine:types:message-received">
                            <xsl:attribute name="value">
                                <xsl:value-of select="concat($timeStampSent,'000')" />
                            </xsl:attribute>
                        </nasp:event>
                    </nasp:requestState>
                    <nasp:doLR>true</nasp:doLR>
                    <nasp:doRBAC>true</nasp:doRBAC>
                    <nasp:doSealedEnvelopePatient>true</nasp:doSealedEnvelopePatient>
                    <nasp:doSealedEnvelopeClinician>true</nasp:doSealedEnvelopeClinician>
                    <!-- End of additional elements added in per the Spine 1 solution but not in the specs -->
                </nasp:requestHeader>
                <nasp:batchHeader>
                    <nasp:messageCount>
                        <xsl:value-of select="$messagesInBatch" />
                    </nasp:messageCount>
                    <nasp:batchSequenceNumber>
                        <xsl:value-of select="$sequenceNumber" />
                    </nasp:batchSequenceNumber>
                </nasp:batchHeader>
            </soap:Header>
            <soap:Body>
                <xsl:copy-of select="/nasp:servicePayload" />
            </soap:Body>
        </soap:Envelope>
    </xsl:template>
</xsl:stylesheet>
