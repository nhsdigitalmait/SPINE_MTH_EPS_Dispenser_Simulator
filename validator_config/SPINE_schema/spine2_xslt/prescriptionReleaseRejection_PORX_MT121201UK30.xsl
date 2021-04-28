<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="messageID">Not Known</xsl:param>
    <xsl:param name="prescriptionID">Not Known</xsl:param>
    <xsl:param name="refToMessageID">Not Known</xsl:param>
    <xsl:param name="refToEventID">Not Known</xsl:param>
    <xsl:param name="timeStampSent">Not Known</xsl:param>
    <xsl:param name="fromASID">Not Known</xsl:param>
    <xsl:param name="serviceASID">Not Known</xsl:param>
    <xsl:param name="toASID">Not Known</xsl:param>
    <xsl:param name="issueQualifier" select="//pyxs:col[@type='dict'][1]/pyxs:prop[@name='errorLevel']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorCode" select="//pyxs:col[@type='dict'][1]/pyxs:prop[@name='errorCode']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorDesc" select="//pyxs:col[@type='dict'][1]/pyxs:prop[@name='errorText']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>
    <xsl:param name="errorCodeSystem" select="//pyxs:col[@type='dict'][1]/pyxs:prop[@name='errorCodeSystem']" xmlns:pyxs="http://projects.coder.cl/pyxser/model/"/>

    <xsl:template match="/">
        <hl7:PORX_IN110101UK30 xmlns:hl7="urn:hl7-org:v3">
            <hl7:id>
                <xsl:attribute name="root">
                    <xsl:value-of select="$messageID" />
                </xsl:attribute>
            </hl7:id>
            <hl7:creationTime>
                <xsl:attribute name="value">
                    <xsl:value-of select="$timeStampSent" />
                </xsl:attribute>
            </hl7:creationTime>
            <hl7:versionCode code="V3NPfIT4.2.00"/>
            <hl7:interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="PORX_IN110101UK30"/>
            <hl7:processingCode code="P"/>
            <hl7:processingModeCode code="T"/>
            <hl7:acceptAckCode code="NE"/>
            <hl7:acknowledgement>
                <xsl:attribute name="typeCode">
                    <xsl:value-of select="$issueQualifier" />
                </xsl:attribute>
                <hl7:messageRef>
                    <hl7:id>
                        <xsl:attribute name="root">
                            <xsl:value-of select="$refToMessageID" />
                        </xsl:attribute>
                    </hl7:id>
                </hl7:messageRef>
            </hl7:acknowledgement>
            <hl7:communicationFunctionRcv typeCode="RCV">
                <hl7:device classCode="DEV" determinerCode="INSTANCE">
                    <hl7:id root="1.2.826.0.1285.0.2.0.107">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="$toASID" />
                        </xsl:attribute>
                    </hl7:id>
                </hl7:device>
            </hl7:communicationFunctionRcv>
            <hl7:communicationFunctionSnd typeCode="SND">
                <hl7:device classCode="DEV" determinerCode="INSTANCE">
                    <hl7:id root="1.2.826.0.1285.0.2.0.107">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="$fromASID" />
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
                                    <xsl:value-of select="$fromASID" />
                                </xsl:attribute>
                            </hl7:id>
                        </hl7:agentSystemSDS>
                    </hl7:AgentSystemSDS>
                </hl7:author1>
                <hl7:subject typeCode="SUBJ" contextConductionInd="false">
                    <PrescriptionReleaseReject classCode="INFO" moodCode="EVN" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ppdbatch="http://spine.nhs.uk/spine-service-ppd" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:eb="http://www.oasis-open.org/committees/ebxml-msg/schema/msg-header-2_0.xsd" xmlns:soapcsf="http://www.w3.org/2001/12/soap-envelope" xmlns="urn:hl7-org:v3" xmlns:nasp="http://spine.nhs.uk/spine-servicev1.0" xmlns:soap="http://www.w3.org/2001/12/soap-envelope">
                        <id>
                            <xsl:attribute name="root">
                                <xsl:value-of select="$messageID" />
                            </xsl:attribute>
                        </id>
                        <effectiveTime>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$timeStampSent" />
                            </xsl:attribute>
                        </effectiveTime>
                        <pertinentInformation type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                            <seperatableInd value="false"/>
                            <pertinentRejectionReason type="Observation" classCode="OBS" moodCode="EVN">
                                <code code="PRRR" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                <xsl:copy-of select="/*/hl7:text"/>
                                <value>
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="$errorCode" />
                                    </xsl:attribute>
                                    <xsl:attribute name="codeSystem">
                                        <xsl:value-of select="$errorCodeSystem"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="displayName">
                                        <xsl:value-of select="$errorDesc" />
                                    </xsl:attribute>
                                </value>
                                <xsl:copy-of select="/*/hl7:performer"/>
                            </pertinentRejectionReason>
                        </pertinentInformation>
                        <reversalOf type="ActRelationship" typeCode="REV">
                            <seperatableInd value="true"/>
                            <priorPrescriptionReleaseRequestRef type="ControlAct" classCode="INFO" moodCode="RQO">
                                <id>
                                    <xsl:attribute name="root">
                                        <xsl:value-of select="$refToEventID" />
                                    </xsl:attribute>
                                </id>
                            </priorPrescriptionReleaseRequestRef>
                        </reversalOf>
                    </PrescriptionReleaseReject>
                </hl7:subject>
            </hl7:ControlActEvent>
        </hl7:PORX_IN110101UK30>
    </xsl:template>
</xsl:stylesheet>