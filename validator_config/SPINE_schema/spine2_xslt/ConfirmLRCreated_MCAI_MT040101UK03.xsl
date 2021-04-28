<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="messageID">Not Known</xsl:param>
	<xsl:param name="refToMessageID">Not Known</xsl:param>
	<xsl:param name="timeStampSent">Not Known</xsl:param>
	<xsl:param name="fromASID">Not Known</xsl:param>
	<xsl:param name="serviceASID">Not Known</xsl:param>
	<xsl:param name="toASID">Not Known</xsl:param>
    <xsl:param name="lrRecordId">None</xsl:param>
    
	<xsl:template match="/">
		<hl7:REPC_IN020000UK13 xmlns:hl7="urn:hl7-org:v3">
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
            <!--  This version code is incorrect, but has been set to match Spine 1 -->
			<hl7:versionCode code="V3NPfIT6.2.00"/>
			<hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="REPC_IN020000UK13"/>
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
                    <!-- Most of these namespaces are spurious, however they have been added to match Spine1 -->
                    <CreationResponseConfirm classCode="PCPR" moodCode="EVN" xmlns="urn:hl7-org:v3" xmlns:soapcsf="http://www.w3.org/2001/12/soap-envelope" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:soap="http://www.w3.org/2001/12/soap-envelope">
                        <id root="2.16.840.1.113883.2.1.3.2.4.18.3">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="$lrRecordId"/>
                            </xsl:attribute>
                        </id>
                    </CreationResponseConfirm>
                </hl7:subject>
			</hl7:ControlActEvent>
		</hl7:REPC_IN020000UK13>
	</xsl:template>
</xsl:stylesheet>