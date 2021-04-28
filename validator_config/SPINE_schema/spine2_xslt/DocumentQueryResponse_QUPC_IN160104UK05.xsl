<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:npfitlc="NPFIT:HL7:Localisation">
    <xsl:output indent="yes"/>

    <xsl:param name="messageID">NotKnown</xsl:param>
    <xsl:param name="responseAction">QUPC_IN160104UK05</xsl:param>
    <xsl:param name="versionCode">V3NPfIT3.0</xsl:param>
    <xsl:param name="refToMessageID">NotKnown</xsl:param>
    <xsl:param name="timeStampSent">NotKnown</xsl:param>
    <xsl:param name="fromASID">NotKnown</xsl:param>
    <xsl:param name="serviceASID">NotKnown</xsl:param>
    <xsl:param name="toASID">NotKnown</xsl:param>
    <xsl:param name="scnNumber">NotKnown</xsl:param>
    <xsl:param name="justifyingDetectedIssue">false</xsl:param>
    <xsl:param name="detectedIssueCode">NotKnown</xsl:param>
    <xsl:param name="errorDesc">NotKnown</xsl:param>
    <xsl:param name="issueQualifier">NotKnown</xsl:param>
    <xsl:param name="queryCode">OK</xsl:param>

    <xsl:param name="nhsNumberCode">NotProvided</xsl:param>
    <xsl:param name="nhsNumberCodeSystem">NotProvided</xsl:param>
    <xsl:param name="eventID">NotProvided</xsl:param>
    <xsl:param name="persistenceDate">NotProvided</xsl:param>
    <xsl:param name="effectiveTime">NotProvided</xsl:param>
    <xsl:param name="eventStatusCode">NotProvided</xsl:param>
    <xsl:param name="eventStatusCodeSystem">NotProvided</xsl:param>
    <xsl:param name="eventStatusDisplayName">NotProvided</xsl:param>
    <xsl:param name="eventTypeCode">NotProvided</xsl:param>
    <xsl:param name="eventTypeCodeSystem">NotProvided</xsl:param>
    <xsl:param name="eventTypeDisplayName">NotProvided</xsl:param>
    <xsl:param name="messageType">NotProvided</xsl:param>
    <xsl:param name="estimatedDocumentSize">NotProvided</xsl:param>
    <xsl:param name="replacingDocumentUUID">NotProvided</xsl:param>
    <xsl:param name="withdrawingDocumentUUID">NotProvided</xsl:param>
    <xsl:param name="eventTitle">NotProvided</xsl:param>
    <xsl:param name="authorJobRoleCode">NotProvided</xsl:param>
    <xsl:param name="authorJobRoleCodeSystem">NotProvided</xsl:param>
    <xsl:param name="authorJobRoleDisplay">NotProvided</xsl:param>
    <xsl:param name="authorPersonUserID">NotProvided</xsl:param>
    <xsl:param name="authorPersonRoleProfileID">NotProvided</xsl:param>
    <xsl:param name="authorOrganizationID">NotProvided</xsl:param>
    <xsl:param name="agentPlayingAuthorNameProvided">NotProvided</xsl:param>
    <xsl:param name="agentPlayingAuthorClassCode">NotProvided</xsl:param>
    <xsl:param name="agentPlayingAuthorUnstructuredName">NotProvided</xsl:param>
    <xsl:param name="agentPlayingAuthorNamePrefix">NotProvided</xsl:param>
    <xsl:param name="agentPlayingAuthorNameFamily">NotProvided</xsl:param>
    <xsl:param name="agentPlayingAuthorNameGiven1">NotProvided</xsl:param>
    <xsl:param name="agentPlayingAuthorNameGiven2">NotProvided</xsl:param>
    <xsl:param name="agentPlayingAuthorNameSuffix">NotProvided</xsl:param>
    <xsl:param name="authorScopedOrganizationCodeSystem">NotProvided</xsl:param>
    <xsl:param name="authorScopedOrganizationCode">NotProvided</xsl:param>
    <xsl:param name="authorScopedOrganizationName">NotProvided</xsl:param>
    <xsl:param name="careRecordState">NotProvided</xsl:param>

    <xsl:template match="/">
        <xsl:element name="{$responseAction}" xmlns="urn:hl7-org:v3">
            <id>
                <xsl:attribute name="root">
                    <xsl:value-of select="$messageID"/>
                </xsl:attribute>
            </id>
            <creationTime>
                <xsl:attribute name="value">
                    <xsl:value-of select="$timeStampSent"/>
                </xsl:attribute>
            </creationTime>
            <versionCode>
                <xsl:attribute name="code">
                    <xsl:value-of select="$versionCode"/>
                </xsl:attribute>
            </versionCode>
            <interactionId root="2.16.840.1.113883.2.1.3.2.4.12">
                <xsl:attribute name="extension">
                    <xsl:value-of select="$responseAction"/>
                </xsl:attribute>
            </interactionId>
            <processingCode code="P"/>
            <processingModeCode code="T"/>
            <acceptAckCode code="NE"/>
            <acknowledgement typeCode="AA">
                <messageRef>
                    <id>
                        <xsl:attribute name="root">
                            <xsl:value-of select="$refToMessageID"/>
                        </xsl:attribute>
                    </id>
                </messageRef>
            </acknowledgement>
            <communicationFunctionRcv typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id root="1.2.826.0.1285.0.2.0.107">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="$toASID"/>
                        </xsl:attribute>
                    </id>
                </device>
            </communicationFunctionRcv>
            <communicationFunctionSnd typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id root="1.2.826.0.1285.0.2.0.107">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="$fromASID"/>
                        </xsl:attribute>
                    </id>
                </device>
            </communicationFunctionSnd>
            <ControlActEvent classCode="CACT" moodCode="EVN">
                <author1 typeCode="AUT">
                    <AgentSystemSDS classCode="AGNT">
                        <agentSystemSDS classCode="DEV" determinerCode="INSTANCE">
                            <id root="1.2.826.0.1285.0.2.0.107">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="$fromASID"/>
                                </xsl:attribute>
                            </id>
                        </agentSystemSDS>
                    </AgentSystemSDS>
                </author1>
                <xsl:if test="$justifyingDetectedIssue='true'">
                    <reason typeCode="RSON">
                        <justifyingDetectedIssueEvent classCode="ALRT" moodCode="EVN">
                            <code>
                                <xsl:attribute name="code">
                                    <xsl:value-of select="$errorCode"/>
                                </xsl:attribute>
                                <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.42</xsl:attribute>
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="$errorDesc"/>
                                </xsl:attribute>
                                <qualifier>
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="$issueQualifier"/>
                                    </xsl:attribute>
                                </qualifier>
                            </code>
                        </justifyingDetectedIssueEvent>
                    </reason>
                </xsl:if>
                <subject typeCode="SUBJ">
                    <DocumentCollection classCode="OBS" moodCode="EVN" xmlns="urn:hl7-org:v3">
                        <code code="DCOL" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.177" />
                        <component typeCode="COMP">
                            <pSISDocMetaData classCode="OBS" moodCode="EVN">
                                <availabilityTime>
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="$persistenceDate" />
                                    </xsl:attribute>
                                </availabilityTime>
                                <code code="PDMD" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.177"/>
                                <effectiveTime>
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="$effectiveTime" />
                                    </xsl:attribute>
                                </effectiveTime>
                                <id>
                                    <xsl:attribute name="root">
                                        <xsl:value-of select="$eventID" />
                                    </xsl:attribute>
                                </id>
                                <npfitlc:messageType root="2.16.840.1.113883.2.1.3.2.4.18.17">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="$messageType" />
                                    </xsl:attribute>
                                </npfitlc:messageType>
                                <component1 typeCode="COMP">
                                    <documentState classCode="OBS" moodCode="EVN">
                                        <code code="DCST" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.177" />
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$eventStatusCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">
                                                <xsl:value-of select="$eventStatusCodeSystem"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$eventStatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </documentState>
                                </component1>
                                <component14 typeCode="COMP">
                                    <estDocSize classCode="OBS" moodCode="EVN">
                                        <code code="ESTD" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.177" />
                                        <value>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$estimatedDocumentSize"/>
                                            </xsl:attribute>
                                        </value>
                                    </estDocSize>
                                </component14>
                                <xsl:if test="$replacingDocumentUUID != 'NotProvided'">
                                    <component2 typeCode="COMP">
                                        <replacingDocUUID classCode="OBS" moodCode="EVN">
                                            <code code="RPLD" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.177" />
                                            <value>
                                                <xsl:attribute name="root">
                                                    <xsl:value-of select="$replacingDocumentUUID"/>
                                                </xsl:attribute>
                                            </value>
                                        </replacingDocUUID>
                                    </component2>
                                </xsl:if>
                                <component3 typeCode="COMP">
                                    <documentMetaData classCode="DOCCLIN" moodCode="EVN">
                                        <code>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$eventTypeCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">
                                                <xsl:value-of select="$eventTypeCodeSystem"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$eventTypeDisplayName"/>
                                            </xsl:attribute>
                                        </code>
                                        <effectiveTime>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$effectiveTime" />
                                            </xsl:attribute>
                                        </effectiveTime>
                                        <title>
                                            <xsl:value-of select="$eventTitle" />
                                        </title>
                                        <author2 typeCode="AUT" contextControlCode="AP">
                                            <documentAuthor classCode="AGNT">
                                                <xsl:if test="$authorJobRoleCode != 'NotProvided'">
                                                    <code>
                                                        <xsl:attribute name="code">
                                                            <xsl:value-of select="$authorJobRoleCode"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="codeSystem">
                                                            <xsl:value-of select="$authorJobRoleCodeSystem"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="displayName">
                                                            <xsl:value-of select="$authorJobRoleDisplayName"/>
                                                        </xsl:attribute>
                                                    </code>
                                                </xsl:if>
                                                <xsl:if test="$authorPersonUserID != 'NotProvided'">
                                                    <id root="1.2.826.0.1285.0.2.0.65">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="$authorPersonUserID"/>
                                                        </xsl:attribute>
                                                    </id>
                                                </xsl:if>
                                                <xsl:if test="$authorPersonRoleProfileID != 'NotProvided'">
                                                    <id root="1.2.826.0.1285.0.2.0.67">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="$authorPersonRoleProfileID"/>
                                                        </xsl:attribute>
                                                    </id>
                                                </xsl:if>
                                                <xsl:if test="$authorOrganizationID != 'NotProvided'">
                                                    <id root="1.2.826.0.1285.0.1.10">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="$authorOrganizationID"/>
                                                        </xsl:attribute>
                                                    </id>
                                                </xsl:if>
                                                <xsl:if test="$agentPlayingAuthorNameProvided != 'NotProvided'">
                                                <agentPlayingAuthor determinerCode="INSTANCE">
                                                    <xsl:attribute name="classCode">
                                                        <xsl:value-of select="$agentPlayingAuthorClassCode"/>
                                                    </xsl:attribute>
                                                    <xsl:choose>
                                                        <xsl:when test="$agentPlayingAuthorUnstructuredName != 'NotProvided'">
                                                            <name>
                                                                <xsl:value-of select="$agentPlayingAuthorUnstructuredName"/>
                                                            </name>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <name>
                                                                <xsl:if test="$agentPlayingAuthorNamePrefix != 'NotProvided'">
                                                                    <prefix>
                                                                        <xsl:value-of select="$agentPlayingAuthorNamePrefix"/>
                                                                    </prefix>
                                                                </xsl:if>
                                                                <xsl:if test="$agentPlayingAuthorNameFamily != 'NotProvided'">
                                                                    <family>
                                                                        <xsl:value-of select="$agentPlayingAuthorNameFamily"/>
                                                                    </family>
                                                                </xsl:if>
                                                                <xsl:if test="$agentPlayingAuthorNameGiven1 != 'NotProvided'">
                                                                    <given>
                                                                        <xsl:value-of select="$agentPlayingAuthorNameGiven1"/>
                                                                    </given>
                                                                </xsl:if>
                                                                <xsl:if test="$agentPlayingAuthorNameGiven2 != 'NotProvided'">
                                                                    <given>
                                                                        <xsl:value-of select="$agentPlayingAuthorNameGiven2"/>
                                                                    </given>
                                                                </xsl:if>
                                                                <xsl:if test="$agentPlayingAuthorNameSuffix != 'NotProvided'">
                                                                    <suffix>
                                                                        <xsl:value-of select="$agentPlayingAuthorNameSuffix"/>
                                                                    </suffix>
                                                                </xsl:if>
                                                            </name>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </agentPlayingAuthor>
                                                </xsl:if>
                                                <xsl:if test="$authorScopedOrganizationCode != 'NotProvided'">
                                                    <representedScopingOrg classCode="ORG" determinerCode="INSTANCE">
                                                        <id>
                                                            <xsl:attribute name="root">
                                                                <xsl:value-of select="$authorScopedOrganizationCodeSystem"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="$authorScopedOrganizationCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="$authorScopedOrganizationName"/>
                                                        </name>
                                                    </representedScopingOrg>
                                                </xsl:if>
                                            </documentAuthor>
                                        </author2>
                                    </documentMetaData>
                                </component3>
                                <xsl:if test="$withdrawingDocumentUUID != 'NotProvided'">
                                    <component4 typeCode="COMP">
                                        <withdrawingDocUUID classCode="OBS" moodCode="EVN">
                                            <code code="WTHD" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.177" />
                                            <value>
                                                <xsl:attribute name="root">
                                                    <xsl:value-of select="$withdrawingDocumentUUID"/>
                                                </xsl:attribute>
                                            </value>
                                        </withdrawingDocUUID>
                                    </component4>
                                </xsl:if>
                                <component5 typeCode="COMP">
                                    <documentDQState classCode="OBS" moodCode="EVN">
                                        <code code="DQST" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.177" />
                                        <value code="NORMAL" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.189"/>
                                    </documentDQState>
                                </component5>
                                <component7 typeCode="COMP">
                                    <xsl:copy-of select="/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:*"/>
                                </component7>
                            </pSISDocMetaData>
                        </component>
                        <component12 typeCode="COMP">
                            <careRecordState classCode="OBS" moodCode="EVN">
                                <code code="CRST" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.177" />
                                <value>
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="$careRecordState"/>
                                    </xsl:attribute>
                                </value>
                            </careRecordState>
                        </component12>
                        <recordTarget typeCode="RCT">
                            <patient classCode="PAT">
                                <id>
                                    <xsl:attribute name="root">
                                        <xsl:value-of select="$nhsNumberCodeSystem"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="$nhsNumberCode"/>
                                    </xsl:attribute>
                                </id>
                            </patient>
                        </recordTarget>
                    </DocumentCollection>
                </subject>
                <queryAck type="QueryAck">
                    <queryResponseCode>
                        <xsl:attribute name="code">
                            <xsl:value-of select="$queryCode"/>
                        </xsl:attribute>
                    </queryResponseCode>
                </queryAck>
            </ControlActEvent>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

