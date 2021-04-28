<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="toPartyID">Not Known</xsl:param>
	<xsl:param name="fromPartyID">Not Known</xsl:param>
	<xsl:param name="CPAId">Not Known</xsl:param>
	<xsl:param name="ConversationID">Not Known</xsl:param>
	<xsl:param name="MessageID">Not Known</xsl:param>
	<xsl:param name="TimeStampSent">Not Known</xsl:param>
	<xsl:param name="RefToMessageID">Not Known</xsl:param>
	<xsl:param name="severity">Error</xsl:param>
	<xsl:param name="errorCode">200</xsl:param>
	<xsl:param name="description">System Failure to process message</xsl:param>
	<xsl:template match="/">

<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<soap:Header>
<eb:MessageHeader eb:version="2.0" soap:mustUnderstand="1">
<eb:From>
<eb:PartyId eb:type="urn:nhs:names:partyType:ocs+serviceInstance"><xsl:value-of select="$toPartyID"/></eb:PartyId>
</eb:From>
<eb:To>
<eb:PartyId eb:type="urn:nhs:names:partyType:ocs+serviceInstance"><xsl:value-of select="$fromPartyID"/></eb:PartyId>
</eb:To>
<eb:CPAId><xsl:value-of select="$CPAId"/></eb:CPAId>
<eb:ConversationId><xsl:value-of select="$ConversationID"/></eb:ConversationId>
<eb:Service>urn:oasis:names:tc:ebxml-msg:service</eb:Service>
<eb:Action>MessageError</eb:Action>
<eb:MessageData>
<eb:MessageId><xsl:value-of select="$MessageID"/></eb:MessageId>
<eb:Timestamp><xsl:value-of select="$TimeStampSent"/></eb:Timestamp>
<eb:RefToMessageId><xsl:value-of select="$RefToMessageID"/></eb:RefToMessageId>
</eb:MessageData>
</eb:MessageHeader>
<eb:ErrorList eb:version="2.0" soap:mustUnderstand="1">
	<xsl:attribute name="eb:highestSeverity"><xsl:value-of select="$severity"/></xsl:attribute>
	<eb:Error>
		<xsl:attribute name="eb:codeContext">urn:oasis:names:tc:ebxml-msg:service:errors</xsl:attribute>
		<xsl:attribute name="eb:severity"><xsl:value-of select="$severity"/></xsl:attribute>
		<xsl:attribute name="eb:errorCode"><xsl:value-of select="$errorCode"/></xsl:attribute>
		<eb:Description><xsl:value-of select="$description"/></eb:Description>
	</eb:Error>
</eb:ErrorList>
</soap:Header>
<soap:Body/>
</soap:Envelope>


	</xsl:template>
</xsl:stylesheet>