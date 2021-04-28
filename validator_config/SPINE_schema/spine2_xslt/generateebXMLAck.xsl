<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes"/>
	<xsl:param name="toPartyID">Sender</xsl:param>
	<xsl:param name="fromPartyID">Spine</xsl:param>
	<xsl:param name="cpaID">CollaborationAgreement</xsl:param>
	<xsl:param name="conversationID">ebXML-ConversationID</xsl:param>
	<xsl:param name="messageID">ebXML-MessageID-ofAck</xsl:param>
	<xsl:param name="refToMessageID">ebXML-MessageID-ofAck</xsl:param>
	<xsl:param name="timestampRcv">TimestampofReceivedMsg</xsl:param>
	<xsl:param name="timestampAck">TimestampofAcknowledgement</xsl:param>
	
	<xsl:param name="linkRequired">False</xsl:param>
	<xsl:param name="linkName">None</xsl:param>
	<xsl:param name="linkLocation">="urn:hl7-org:v3_MCCI_IN010000UK13.xsd"</xsl:param>
	<xsl:param name="linkVersion">="13"</xsl:param>
	
	<xsl:param name="ebXMLService">urn:oasis:names:tc:ebxml-msg:service</xsl:param>
	<xsl:param name="ebXMLAction">Acknowledgment</xsl:param>
	
	<xsl:template match="/">

<soap:Envelope xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:hl7ebxml="urn:hl7-org:transport/ebXML/DSTUv1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
	<soap:Header>
		<eb:MessageHeader eb:version="2.0" soap:mustUnderstand="1">
		<eb:From><eb:PartyId eb:type="urn:nhs:names:partyType:ocs+serviceInstance"><xsl:value-of select="$fromPartyID"/></eb:PartyId></eb:From>
		<eb:To><eb:PartyId eb:type="urn:nhs:names:partyType:ocs+serviceInstance"><xsl:value-of select="$toPartyID"/></eb:PartyId></eb:To>
		<eb:CPAId><xsl:value-of select="$cpaID"/></eb:CPAId>
		<eb:ConversationId><xsl:value-of select="$conversationID"/></eb:ConversationId>
		<eb:Service><xsl:value-of select="$ebXMLService"/></eb:Service>
		<eb:Action><xsl:value-of select="$ebXMLAction"/></eb:Action>
		<eb:MessageData>
			<eb:MessageId><xsl:value-of select="$messageID"/></eb:MessageId>
			<eb:Timestamp><xsl:value-of select="$timestampRcv"/></eb:Timestamp>
			<eb:RefToMessageId><xsl:value-of select="$refToMessageID"/></eb:RefToMessageId>
		</eb:MessageData>
		</eb:MessageHeader>
        <eb:Acknowledgment eb:version="2.0" soap:mustUnderstand="1" soap:actor="urn:oasis:names:tc:ebxml-msg:actor:toPartyMSH">
            <eb:Timestamp><xsl:value-of select="$timestampAck"/></eb:Timestamp>
            <eb:RefToMessageId><xsl:value-of select="$refToMessageID"/></eb:RefToMessageId>
            <eb:From><eb:PartyId eb:type="urn:nhs:names:partyType:ocs+serviceInstance"><xsl:value-of select="$fromPartyID"/></eb:PartyId></eb:From>
        </eb:Acknowledgment>
	</soap:Header>
	<soap:Body>
		<xsl:if test="$linkRequired='True'">
			<eb:Manifest eb:version="2.0">
				<eb:Reference>
					<xsl:attribute name="xlink:href"><xsl:value-of select="$linkName"></xsl:value-of></xsl:attribute>
					<eb:Schema eb:location="$linkLocation" eb:version="1.0">
						<xsl:attribute name="eb:location"><xsl:value-of select="$linkLocation"/></xsl:attribute>
						<xsl:attribute name="eb:version"><xsl:value-of select="$linkVersion"/></xsl:attribute>
					</eb:Schema>
					<eb:Description xml:lang="en">HL7 payload</eb:Description>
					<hl7ebxml:Payload style="HL7" encoding="XML" version="3.0"/>
				</eb:Reference>
			</eb:Manifest>
		</xsl:if>	
	</soap:Body>
</soap:Envelope>


	</xsl:template>
</xsl:stylesheet>