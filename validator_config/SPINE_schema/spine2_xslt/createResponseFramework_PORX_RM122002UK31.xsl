<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes"/>

	<xsl:param name="messageID">example-guid</xsl:param>
    <xsl:param name="responseService">mm</xsl:param>
	<xsl:param name="responseAction">PORX_IN070103UK31</xsl:param>
	<xsl:param name="responsePayload">PORX_MT122003UK32</xsl:param>
	<xsl:param name="toASID">1234567890</xsl:param>
    <xsl:param name="fromASID">1234567890</xsl:param>
	<xsl:param name="refToMessageID">example-request-GUID</xsl:param>
    <xsl:param name="refToEventID">example-request-GUID</xsl:param>
	<xsl:param name="timeStampSent">19700101000000</xsl:param>
	<xsl:param name="detectedIssueCode5">false</xsl:param>
	<xsl:param name="detectedIssueCode9">false</xsl:param>
	<xsl:param name="detectedIssueCode24">false</xsl:param>

	<xsl:template match="/">
		<xsl:element name="hl7:{$responseAction}" xmlns:hl7="urn:hl7-org:v3">
			<!--Using create response framework RM122-->
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
			<hl7:versionCode code="V3NPfIT4.2.00"/>
			<hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12">
				<xsl:attribute name="extension">
					<xsl:value-of select="$responseAction"/>
				</xsl:attribute>
			</hl7:interactionId>
			<hl7:processingCode code="P"/>
			<hl7:processingModeCode code="T"/>
			<hl7:acceptAckCode code="NE"/>
			<hl7:acknowledgement typeCode="AA">
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
				<hl7:subject typeCode="SUBJ" contextConductionInd="false">
					<PrescriptionReleaseResponse classCode="INFO" moodCode="EVN" type="ControlAct" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ppdbatch="http://spine.nhs.uk/spine-service-ppd" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:soapcsf="http://www.w3.org/2001/12/soap-envelope" xmlns="urn:hl7-org:v3" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:soap="http://www.w3.org/2001/12/soap-envelope">
						<id>
							<xsl:attribute name="root">
								<xsl:value-of select="$messageID"/>
							</xsl:attribute>
						</id>
						<effectiveTime>
							<xsl:attribute name="value">
								<xsl:value-of select="$timeStampSent"/>
							</xsl:attribute>
						</effectiveTime>
						<component type="ActRelationship" typeCode="COMP" contextConductionInd="false">
							<seperatableInd value="false"/>
							<templateId>
								<xsl:attribute name="root">2.16.840.1.113883.2.1.3.2.4.17.120</xsl:attribute>
								<xsl:attribute name="extension">
									<xsl:value-of select="$responsePayload"/>
								</xsl:attribute>
							</templateId>
							<ParentPrescription classCode="INFO" moodCode="EVN">
								<xsl:copy-of select="/*/hl7:id"/>
								<xsl:copy-of select="/*/hl7:code"/>
								<xsl:copy-of select="/*/hl7:effectiveTime"/>
								<typeId>
									<xsl:attribute name="root">2.16.840.1.113883.2.1.3.2.4.18.7</xsl:attribute>
									<xsl:attribute name="extension">
										<xsl:value-of select="$responsePayload"/>
									</xsl:attribute>
								</typeId>
								<xsl:copy-of select="/*/hl7:recordTarget"/>
								<xsl:copy-of select="/*/hl7:pertinentInformation1"/>
								<xsl:copy-of select="/*/hl7:pertinentInformation2"/>
							</ParentPrescription>
						</component>
						<inFulfillmentOf type="ActRelationship" typeCode="FLFS" inversionInd="false" negationInd="false">
							<seperatableInd value="true"/>
							<priorDownloadRequestRef type="ControlAct" classCode="INFO" moodCode="RQO">
								<id>
									<xsl:attribute name="root">
										<xsl:value-of select="$refToEventID"/>
									</xsl:attribute>
								</id>
							</priorDownloadRequestRef>
						</inFulfillmentOf>
					</PrescriptionReleaseResponse>
				</hl7:subject>
			</hl7:ControlActEvent>
		</xsl:element>

	</xsl:template>
</xsl:stylesheet>
