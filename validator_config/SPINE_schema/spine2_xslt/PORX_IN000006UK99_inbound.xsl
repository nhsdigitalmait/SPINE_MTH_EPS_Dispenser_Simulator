<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"  version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
    <xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"/>    
    <xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:prescriptionDetailQueryResponse/hl7:PORX_IN000006UK99">{
        "ID": "<xsl:value-of select="hl7:id/@root" />",
        "CreationTime": "<xsl:value-of select="hl7:creationTime/@value" />",
        "Response": {
    <xsl:for-each select="hl7:ControlActEvent/hl7:subject/hl7:PrescriptionJsonQueryResponse">
            "GUID": "<xsl:value-of select="hl7:id/@root" />",
            "EffectiveTime": "<xsl:value-of select="hl7:effectiveTime/@value" />",
            "EpsIndex": [
                <xsl:for-each select="hl7:epsIndex">
                    {"PrescribingSiteStatus": "<xsl:value-of select="hl7:prescribingSite_status"/>",
                    "PharmacyStatus": "<xsl:value-of select="hl7:nominatedPharmacy_status"/>",
                    "NextActivityDate": "<xsl:value-of select="hl7:nextActivity_nextActivityDate"/>"
                    }<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
                ],
            "EpsRecord": [
            <xsl:for-each select="hl7:epsRecord">{
                "PrescriptionStatus": "<xsl:value-of select="hl7:prescriptionStatus" />",
                "NominatedDownloadDate": "<xsl:value-of select="hl7:nominatedDownloadDate" />",
                "CompletionDate": "<xsl:value-of select="hl7:completionDate" />",
                "ExpiryDate": "<xsl:value-of select="hl7:expiryDate" />",   
                "window": [
                <xsl:for-each select="hl7:dispenseWindow">{
                        "low": "<xsl:value-of select="hl7:low/@value" />",
                        "high": "<xsl:value-of select="hl7:high/@value" />"
                        }<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
                ],
                "InstanceNumber": "<xsl:value-of select="hl7:instanceNumber" />",
                "lineItems": [
                <xsl:for-each select="hl7:lineItem">{
                    "Item": "<xsl:value-of select="hl7:order/@value" />",
                    "ItemID": "<xsl:value-of select="hl7:ID/@value" />",
                    "ItemStatus": "<xsl:value-of select="hl7:status/@value" />"
                    }<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
                ],
                "history": [
                <xsl:for-each select="hl7:history">{
                    "SCN": "<xsl:value-of select="hl7:SCN" />",
                    "instance": "<xsl:value-of select="hl7:instance" />",
                	"message": "<xsl:value-of select="hl7:message" />",
                    "messageID": "<xsl:value-of select="hl7:messageID" />",
                    "interactionID": "<xsl:value-of select="hl7:interactionID" />",
                    "status": "<xsl:value-of select="hl7:status" />",
                    "instanceStatus": "<xsl:value-of select="hl7:instanceStatus" />",
                    "agentSystem": "<xsl:value-of select="hl7:agentSystem" />",
                    "timestamp": "<xsl:value-of select="hl7:timestamp" />",
                    "toASID": "<xsl:value-of select="hl7:toASID" />",
                    "fromASID": "<xsl:value-of select="hl7:fromASID" />"
                    }<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
                ],
                "lastDispenseNotificationMsgRef": "<xsl:value-of select="hl7:lastDispenseNotificationMsgRef" />",
                "lastDispenseNotificationGuid": "<xsl:value-of select="hl7:lastDispenseNotificationGuid" />",
                "DispensingOrganization": "<xsl:value-of select="hl7:dispensingOrganization" />",
                "LastDispenseDate": "<xsl:value-of select="hl7:lastDispenseDate" />",
                "ClaimReceivedDate": "<xsl:value-of select="hl7:claimReceivedDate" />",
                "currentInstance": "<xsl:value-of select="hl7:currentInstance" />",
                "signedTime": "<xsl:value-of select="hl7:signedTime" />",
                "prescriptionTreatmentType": "<xsl:value-of select="hl7:prescriptionTreatmentType" />",
                "prescriptionType": "<xsl:value-of select="hl7:prescriptionType" />",
                "prescriptionTime": "<xsl:value-of select="hl7:prescriptionTime" />",
                "prescriptionID": "<xsl:value-of select="hl7:prescriptionID" />",
                "eventID": "<xsl:value-of select="hl7:eventID" />",
                "prescribingOrganization": "<xsl:value-of select="hl7:prescribingOrganization" />",
                "daysSupply": "<xsl:value-of select="hl7:daysSupply" />",
                "messageRef": "<xsl:value-of select="hl7:prescriptionMsgRef" />",
                "maxRepeats": "<xsl:value-of select="hl7:maxRepeats" />",
                "lowerAgeLimit": "<xsl:value-of select="hl7:lowerAgeLimit" />",
                "higherAgeLimit": "<xsl:value-of select="hl7:higherAgeLimit" />",
                "patientNhsNumber": "<xsl:value-of select="hl7:patientNhsNumber" />",
                "patientBirthTime": "<xsl:value-of select="hl7:patientBirthTime" />",
                "nominatedPerformer": "<xsl:value-of select="hl7:nominatedPerformer" />",
                "nominatedPerformerType": "<xsl:value-of select="hl7:nominatedPerformerType" />",               
                "ExpiryDate": "<xsl:value-of select="hl7:expiryDate" />"
                }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ]
        }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
    }
    </xsl:template>
</xsl:stylesheet>