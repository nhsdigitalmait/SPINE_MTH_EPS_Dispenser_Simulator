<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output indent="yes"/>
	<xsl:param name="fromASID">NA</xsl:param>
	<xsl:param name="responseGUID">example-guid</xsl:param>
	<xsl:param name="responseService">pdsquery</xsl:param>
	<xsl:param name="responseAction">MCCI_IN010000UK13</xsl:param>
	<xsl:param name="responseName">retrievalQueryResponse</xsl:param>
	<xsl:param name="toASID">Unavailable</xsl:param>
	<xsl:param name="requestGUID">example-request-GUID</xsl:param>
	<xsl:param name="creationTime">19700101000000</xsl:param>
	<xsl:param name="errorLevel" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorLevel']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
	<xsl:param name="errorCode" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorCode']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
	<xsl:param name="errorText" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='errorText']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="p1r1ErrorCode" select="//pyxs:col[@type='dict'][last()]/pyxs:prop[@name='p1r1ErrorCode']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
   <xsl:param name="ack_typeCode">AE</xsl:param>    

	<xsl:template match="/">
		<SOAP-ENV:Envelope xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
			<SOAP-ENV:Header>
				<naspResponseHeader>
				<id>
					<xsl:attribute name="root">
						<xsl:value-of select="$responseGUID"/>
					</xsl:attribute>
				</id>
				<creationTime>
					<xsl:attribute name="value">
						<xsl:value-of select="$creationTime"/>
					</xsl:attribute>
				</creationTime>
				<versionCode code="V3NPfIT2.0"/>
				<interactionId root="2.16.840.1.113883.2.1.3.2.4.12">
					<xsl:attribute name="extension">
						<xsl:value-of select="$responseAction"/>
					</xsl:attribute>
				</interactionId>
				<processingCode code="P"/>
				<processingModeCode code="T"/>
				<acceptAckCode code="NE"/>
				<acknowledgement> <xsl:attribute name="typeCode"><xsl:value-of select="$ack_typeCode" /></xsl:attribute>
					<messageRef>
						<id>
							<xsl:attribute name="root">
								<xsl:value-of select="$requestGUID"/>
							</xsl:attribute>
						</id>
					</messageRef>
				</acknowledgement>
				<communicationFunctionRcv typeCode="RCV">
					<device classCode="DEV" determinerCode="INSTANCE">
						<id root="2.16.840.1.113883.2.1.3.2.4.10">
							<xsl:attribute name="extension">
								<xsl:value-of select="$toASID"/>
							</xsl:attribute>
						</id>
					</device>
				</communicationFunctionRcv>
				<communicationFunctionSnd typeCode="SND">
					<device classCode="DEV" determinerCode="INSTANCE">
						<id root="2.16.840.1.113883.2.1.3.2.4.10">
							<xsl:attribute name="extension">
								<xsl:value-of select="$fromASID"/>
							</xsl:attribute>
						</id>
					</device>
				</communicationFunctionSnd>
				<ControlAct classCode="CACT" moodCode="EVN">
					<reason type="ActRelationship" typeCode="RSON">
						<justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN" type="Observation">
							<code>
								<xsl:attribute name="code">
									<xsl:value-of select="$errorCode"/>
								</xsl:attribute>
							</code>
							<value><xsl:value-of select="$errorText"/></value>
						</justifyingDetectedIssueEvent>
					</reason>
					<queryAck type="QueryAck">
						<queryId>
							<xsl:attribute name="root">
								<xsl:value-of select="$requestGUID"/>
							</xsl:attribute>
						</queryId>
						<queryResponseCode>
                                <xsl:attribute name="code">
                                    <xsl:value-of select="$p1r1ErrorCode"/>
                                </xsl:attribute>
						</queryResponseCode>
					</queryAck>
				</ControlAct>
				</naspResponseHeader>
			</SOAP-ENV:Header>
			<SOAP-ENV:Body>
				<xsl:element name="{$responseAction}">
					<id>
						<xsl:attribute name="root">
							<xsl:value-of select="$responseGUID"/>
						</xsl:attribute>
					</id>
					<creationTime>
						<xsl:attribute name="value">
							<xsl:value-of select="$creationTime"/>
						</xsl:attribute>
					</creationTime>
					<versionCode code="V3NPfIT2.0"/>
					<interactionId root="2.16.840.1.113883.2.1.3.2.4.12">
						<xsl:attribute name="extension">
							<xsl:value-of select="$responseAction"/>
						</xsl:attribute>
					</interactionId>
					<processingCode code="P"/>
					<processingModeCode code="T"/>
					<acceptAckCode code="NE"/>
					<acknowledgement> <xsl:attribute name="typeCode"><xsl:value-of select="$ack_typeCode" /></xsl:attribute>
						<messageRef>
							<id>
								<xsl:attribute name="root">
									<xsl:value-of select="$requestGUID"></xsl:value-of>
								</xsl:attribute>
							</id>
						</messageRef>
					</acknowledgement>
					<communicationFunctionRcv typeCode="RCV">
						<device classCode="DEV" determinerCode="INSTANCE">
							<id root="2.16.840.1.113883.2.1.3.2.4.10">
								<xsl:attribute name="extension">
									<xsl:value-of select="$toASID"/>
								</xsl:attribute>
							</id>
						</device>
					</communicationFunctionRcv>
					<communicationFunctionSnd typeCode="SND">
						<device classCode="DEV" determinerCode="INSTANCE">
							<id root="2.16.840.1.113883.2.1.3.2.4.10">
								<xsl:attribute name="extension">
									<xsl:value-of select="$fromASID"/>
								</xsl:attribute>
							</id>
						</device>
					</communicationFunctionSnd>
					<ControlAct classCode="CACT" moodCode="EVN">
						<reason typeCode="RSON">
							<justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
								<code>
								<xsl:attribute name="code">
									<xsl:value-of select="$p1r1ErrorCode"/>
								</xsl:attribute>
							</code>
							<value><xsl:value-of select="$errorText"/></value>
							</justifyingDetectedIssueEvent>
						</reason>
						<queryAck type="QueryAck">
							<queryId>
								<xsl:attribute name="root">
									<xsl:value-of select="$requestGUID"/>
								</xsl:attribute>
							</queryId>
							<queryResponseCode>
								<xsl:attribute name="code">
									<xsl:value-of select="$p1r1ErrorCode"/>
								</xsl:attribute>
								<xsl:attribute name="displayName">
									<xsl:value-of select="$errorText"/>
								</xsl:attribute>
							</queryResponseCode>
						</queryAck>
					</ControlAct>
				</xsl:element>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>