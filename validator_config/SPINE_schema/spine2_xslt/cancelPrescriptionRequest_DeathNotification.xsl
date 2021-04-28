<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="messageID">Not Known</xsl:param>
    <xsl:param name="timeStampSent">Not Known</xsl:param>
    <xsl:param name="fromASID">Not Known</xsl:param>
    <xsl:param name="toASID">Not Known</xsl:param>
    <xsl:param name="prescriptionID">Not Known</xsl:param>
    <xsl:param name="currentInstance">Not Known</xsl:param>
    <xsl:param name="nhsNumber">Not Known</xsl:param>

    <xsl:template match="/">
<PORX_IN030101UK32 xmlns="urn:hl7-org:v3">
    <id><xsl:attribute name="root"><xsl:value-of select="$messageID"/></xsl:attribute></id>
    <creationTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></creationTime>
    <versionCode code="V3NPfIT4.2.00"/>
    <interactionId root="2.16.840.1.113883.2.1.3.2.4.12" extension="PORX_IN030101UK32"/>
    <processingCode code="P"/>
    <processingModeCode code="T"/>
    <acceptAckCode code="NE"/>
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
    <ControlActEvent classCode="CACT" moodCode="EVN">
        <author1 typeCode="AUT">
            <AgentSystemSDS classCode="AGNT">
                <agentSystemSDS classCode="DEV" determinerCode="INSTANCE">
                    <id root="1.2.826.0.1285.0.2.0.107">
                    <xsl:attribute name="extension"><xsl:value-of select="$fromASID"/></xsl:attribute>
                    </id>
                </agentSystemSDS>
            </AgentSystemSDS>
        </author1>
      <subject>
         <CancellationRequest xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" classCode="ACTN" moodCode="RQO" xsi:schemaLocation="urn:hl7-org:v3 ..\Schemas\PORX_MT135001UK32.xsd">
            <id>
                  <xsl:attribute name="root">
                  <xsl:value-of select="$messageID"/>
                  </xsl:attribute>   
            </id> 
            <effectiveTime><xsl:attribute name="value"><xsl:value-of select="$timeStampSent"/></xsl:attribute></effectiveTime>
            <recordTarget typeCode="RCT">
               <Patient classCode="PAT">
                  <id root="2.16.840.1.113883.2.1.4.1">
                  <xsl:attribute name="extension">
                  <xsl:value-of select="$nhsNumber"/>
                  </xsl:attribute>   
                  </id>
                  <addr/>
                  <patientPerson>
                     <name/>
                     <administrativeGenderCode code="NotProvided"/>
                     <birthTime value="NotProvided"/>
                  </patientPerson>
               </Patient>
            </recordTarget>
            <author typeCode="AUT">
               <AgentPerson classCode="AGNT">
                  <id root="1.2.826.0.1285.0.2.0.67" extension="103142999989"/>
                  <code codeSystem="1.2.826.0.1285.0.2.1.104" code="X0000:X0000:X0000" />
                  <telecom use="WP" value="NOTPROVIDED"/>
                  <agentPerson classCode="PSN" determinerCode="INSTANCE">
                     <id root="1.2.826.0.1285.0.2.1.54" extension="NOTPROVIDED"/>
                     <name use="L">NOTPROVIDED</name>
                  </agentPerson>
                  <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                     <id root="1.2.826.0.1285.0.1.10" extension="D00000"/>
                     <code code="0001" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.94"/>
                     <name>NOTPROVIDED</name>
                     <telecom use="WP" value="NOTPROVIDED"/>
                      <addr use="WP">
                        <streetAddressLine>NOTPROVIDED</streetAddressLine>
                        <streetAddressLine>NOTPROVIDED</streetAddressLine>
                        <streetAddressLine>NOTPROVIDED</streetAddressLine>
                        <postalCode>NOT PROVIDED</postalCode>
                     </addr>
                  </representedOrganization>
               </AgentPerson>
            </author>
            <pertinentInformation2 typeCode="PERT" contextConductionInd="true">
               <seperatableInd value="false"/>
               <pertinentPrescriptionID classCode="OBS" moodCode="EVN">
                  <code codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30" code="PID"/>
                  <value root="2.16.840.1.113883.2.1.3.2.4.18.8">
                  <xsl:attribute name="extension">
                  <xsl:value-of select="$prescriptionID"/>
                  </xsl:attribute>                                    
                  </value>
               </pertinentPrescriptionID>
            </pertinentInformation2>
            <pertinentInformation typeCode="PERT" contextConductionInd="true">
               <seperatableInd value="false"/>
               <pertinentCancellationReason classCode="OBS" moodCode="EVN">
                  <code codeSystem="2.16l.840.1.113883.2.1.3.2.4.17.30" code="CR"/>
                  <text>Notification of Death</text>
                  <value codeSystem="2.16.840.1.113883.2.1.3.2.4.16.27" code="0007"/>
               </pertinentCancellationReason>
            </pertinentInformation>
         </CancellationRequest>
      </subject>
   </ControlActEvent>
</PORX_IN030101UK32>

    </xsl:template>
</xsl:stylesheet>