<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" version="1.0">
	<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"/>
    <xsl:template name="string-replace-all">
        <xsl:param name="text" />
        <xsl:param name="replace" />
        <xsl:param name="by" />
        <xsl:choose>
          <xsl:when test="contains($text, $replace)">
            <xsl:value-of select="substring-before($text,$replace)" />
            <xsl:value-of select="$by" />
            <xsl:call-template name="string-replace-all">
              <xsl:with-param name="text"
              select="substring-after($text,$replace)" />
              <xsl:with-param name="replace" select="$replace" />
              <xsl:with-param name="by" select="$by" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$text" />
          </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
	<xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:retrievalQueryResponse/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:PDSResponse">{
	"<xsl:value-of select="hl7:subject/hl7:patientRole/hl7:id/@extension"/>": {
		"SerialChangeNumber": "<xsl:value-of select="hl7:pertinentInformation/hl7:pertinentSerialChangeNumber/hl7:value/@value"/>",<xsl:for-each select="hl7:subject">
			<xsl:for-each select="hl7:patientRole">                    
                "dataQualityType": {
                    "code": "<xsl:value-of select="hl7:subjectOf13/hl7:COCT_MT000312UK01.DataQualityType/hl7:code/@code"/>",
                    "codeSystem": "<xsl:value-of select="hl7:subjectOf13/hl7:COCT_MT000312UK01.DataQualityType/hl7:code/@codeSystem"/>" ,
                    "effectiveTime": [
                        {
                            "low": "<xsl:value-of select="hl7:subjectOf13/hl7:COCT_MT000312UK01.DataQualityType/hl7:effectiveTime/hl7:low/@value"/>",
                            "high": "<xsl:value-of select="hl7:subjectOf13/hl7:COCT_MT000312UK01.DataQualityType/hl7:effectiveTime/hl7:high/@value"/>"
                        }
                    ],
                    "dataQualityInvestigationReasonCode": [
                        {
                            "code": "<xsl:value-of select="hl7:subjectOf13/hl7:COCT_MT000312UK01.DataQualityType/hl7:pertinentInformation/hl7:pertinentDataQualityInvestigationReason/hl7:code/@code"/>",
                            "codeSystem": "<xsl:value-of select="hl7:subjectOf13/hl7:COCT_MT000312UK01.DataQualityType/hl7:pertinentInformation/hl7:pertinentDataQualityInvestigationReason/hl7:code/@codeSystem"/>"
                        }
                    ]
                },
                "confidentialityCode": "<xsl:value-of select="hl7:confidentialityCode/@code"/>",
				"confidentialityCodeCodeSystem": "<xsl:value-of select="hl7:confidentialityCode/@codeSystem"/>",
				"preferredContactMethod": [
				<xsl:for-each select="hl7:subjectOf4/hl7:preferredContactMethod">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"value": "<xsl:value-of select="hl7:value/@code"/>",
					"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>",
					"contactTimes": [
						<xsl:for-each select="hl7:pertinentInformation/hl7:pertinentPreferredContactTimes">{
							"code": "<xsl:value-of select="hl7:code/@code"/>",
							"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
							"contactTime": "<xsl:value-of select="hl7:value"/>"
							}</xsl:for-each>
						]
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"NHAISRegistrationEvent": [
				<xsl:for-each select="hl7:subjectOf7/hl7:nHAISRegistrationEvent">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"effectiveTime": [
						{
						"low": "<xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>",
						"high": "<xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>"
						}
					],
					"assignedDevice": [
						<xsl:for-each select="hl7:custodian/hl7:assignedDevice">{
							"systemID": "<xsl:value-of select="hl7:id/@extension"/>",
							"systemIDcodeSystem": "<xsl:value-of select="hl7:id/@root"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
						],
						"source": [
						<xsl:for-each select="hl7:subjectOf/hl7:pDSSourceData">{"sourceIdentified": [
							<xsl:for-each select="hl7:SourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}</xsl:for-each>
							], "sourceCoded": [
							<xsl:for-each select="hl7:SourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
						],
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf1/hl7:systemEffectiveDate">{
							"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}</xsl:for-each>
						]
						}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"preferredWrittenCommunicationFormat": [
				<xsl:for-each select="hl7:subjectOf5/hl7:preferredWrittenCommunicationFormat">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"value": "<xsl:value-of select="hl7:value/@code"/>",
					"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"sharedSecret": [
				<xsl:for-each select="hl7:subjectOf6/hl7:sharedSecret">{
                  <xsl:variable name="sharedSecret">
                    <xsl:call-template name="string-replace-all">
                      <xsl:with-param name="text" select="hl7:value" />
                      <xsl:with-param name="replace" select="'&#10;'" />
                      <xsl:with-param name="by" select="'\n'" />
                    </xsl:call-template>
                  </xsl:variable>
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"sharedSecret": "<xsl:value-of select="$sharedSecret"/>"
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"previousNhsContact": [
				<xsl:for-each select="hl7:subjectOf8/hl7:previousNhsContact">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"value": "<xsl:value-of select="hl7:value/@code"/>",
					"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"pCRemovalRegistrationEvent": [
				<xsl:for-each select="hl7:subjectOf9/hl7:pCRemovalRegistrationEvent">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"effectiveTime": [
						{
						"low": "<xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>",
						"high": "<xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>"
						}
					],
					"reasonCode": "<xsl:value-of select="hl7:reasonCode/@code"/>",
					"reasonCodeSystem": "<xsl:value-of select="hl7:reasonCode/@codeSystem"/>",
					"availabilityTime": "<xsl:value-of select="hl7:availabilityTime/@value"/>",
					"pcRemovalNotApplied": [
						<xsl:for-each select="hl7:component/hl7:pCRemovalNotApplied">{
							"code": "<xsl:value-of select="hl7:code/@code"/>",
							"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
							"value": "<xsl:value-of select="hl7:value/@code"/>",
							"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>],
					"source": [
					<xsl:for-each select="hl7:subjectOf/hl7:pDSSourceData">{
						"sourceIdentified": [
						<xsl:for-each select="hl7:SourceIdentified">{
							"extension": "<xsl:value-of select="hl7:value/@extension"/>",
							"root": "<xsl:value-of select="hl7:value/@root"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
						],
						"sourceCoded": [
						<xsl:for-each select="hl7:SourceCoded">{
							"code": "<xsl:value-of select="hl7:value/@code"/>",
							"codeSystem": "<xsl:value-of select="hl7:value/@CodeSystem"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
						]
						}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
					],
					"systemEffectiveDate": [
					<xsl:for-each select="hl7:subjectOf1/hl7:systemEffectiveDate">{
						"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
						"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
						}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
					]
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"healthspaceRegistration": [
				<xsl:for-each select="hl7:subjectOf1/hl7:healthspaceRegistration">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"value": "<xsl:value-of select="hl7:value/@code"/>",
					"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"deathNotification": [
				<xsl:for-each select="hl7:subjectOf2/hl7:deathNotification">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"value": "<xsl:value-of select="hl7:value/@code"/>",
					"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"consent": [
				<xsl:for-each select="hl7:subjectOf3/hl7:consent">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"value": "<xsl:value-of select="hl7:value/@code"/>",
					"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>",
					"effectiveTime": "<xsl:value-of select="hl7:effectiveTime/@value"/>"
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"suspectedMultipleRegistrations": [
				<xsl:for-each select="hl7:subjectOf/hl7:suspectedMultipleRegistrations">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"effectiveTime": "<xsl:value-of select="hl7:effectiveTime/@value"/>"
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"alternativeIdentifier": [
				<xsl:for-each select="hl7:subjectOf12/hl7:alternativeIdentifier">{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"value": "<xsl:value-of select="hl7:value/@extension"/>",
					"valueCodeSystem": "<xsl:value-of select="hl7:value/@root"/>",
					"effectiveTime": [
						{
						"low": "<xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>",
						"high": "<xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>"
						}
					],
					"id": "<xsl:value-of select="hl7:id/@extension"/>",
					"idCodeSystem": "<xsl:value-of select="hl7:id/@root"/>",
					"source": [
						<xsl:for-each select="hl7:subjectOf/hl7:pDSSourceData">{
						"sourceIdentified": [
							<xsl:for-each select="hl7:SourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
							],
							"sourceCoded": [
							<xsl:for-each select="hl7:SourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
						],
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf1/hl7:systemEffectiveDate">{
							"alternativeIdentifierSEDLow": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"alternativeIdentifierSEDHigh": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
						]
						}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"bloodDonor": [
				<xsl:for-each select="hl7:subjectOf10/hl7:bloodDonorPrefs">
					{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"effectiveTime": "<xsl:value-of select="hl7:effectiveTime/@value"/>",
					"consent": [
						<xsl:for-each select="hl7:component/hl7:bloodDonorConsent">
							{
							"code": "<xsl:value-of select="hl7:code/@code"/>",
							"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
							"value": "<xsl:value-of select="hl7:value/@code"/>",
							"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>",
							"effectiveTime": "<xsl:value-of select="hl7:effectiveTime/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
						]
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"organDonor": [
				<xsl:for-each select="hl7:subjectOf15/hl7:organDonorPrefs">
					{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"effectiveTime": "<xsl:value-of select="hl7:effectiveTime/@value"/>",
					"consent": [
						<xsl:for-each select="hl7:component/hl7:organDonorConsent">
							{
							"code": "<xsl:value-of select="hl7:code/@code"/>",
							"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
							"value": "<xsl:value-of select="hl7:value/@code"/>",
							"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>",
							"effectiveTime": "<xsl:value-of select="hl7:effectiveTime/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
						]
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"treatmentEntitlement": [
				<xsl:for-each select="hl7:subjectOf11/hl7:treatmentEntitlement">
					{
					"code": "<xsl:value-of select="hl7:code/@code"/>",
					"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
					"value": "<xsl:value-of select="hl7:value/@code"/>",
					"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>",
					"effectiveTime": [
						{
						"low": "<xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>",
						"high": "<xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>"
						}
					],
					"treatmentCategoryType": [
						<xsl:for-each select="hl7:component/hl7:treatmentCategoryType">
							{
							"code": "<xsl:value-of select="hl7:code/@code"/>",
							"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
							"value": "<xsl:value-of select="hl7:value/@code"/>",
							"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>",
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
						],
					"residentialStatus": [
						<xsl:for-each select="hl7:component/hl7:residentialStatus">
							{
							"code": "<xsl:value-of select="hl7:code/@code"/>",
							"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
							"value": "<xsl:value-of select="hl7:value/@code"/>",
							"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>",
							}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
						]
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				],
				"supercededId": [
				<xsl:for-each select="hl7:replacementOf/hl7:oldVersion">{
					"id": "<xsl:value-of select="hl7:id/@extension"/>",
					"idCodeSystem": "<xsl:value-of select="hl7:id/@root"/>",
					"effectiveTime": [
						{
						"low": "<xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>",
						"high": "<xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>"
						}
					]
					}<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>],
				<xsl:for-each select="hl7:patientPerson">
					"relatedPersons": [
					<xsl:for-each select="hl7:scopedRelatedPersonRole">{
						"relationshipType": "<xsl:value-of select="@classCode"/>",
						"classOfRelatedPerson": "<xsl:value-of select="hl7:code/@code"/>",
						"id": "<xsl:value-of select="hl7:id/@extension"/>",
					"idCodeSystem": "<xsl:value-of select="hl7:id/@root"/>",
					"effectiveTime": [
						{
						"low": "<xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>",
						"high": "<xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>"
						}
					],
					"positionNumber": "<xsl:value-of select="hl7:positionNumber/@value"/>",
					"NextOfKin": [
					<xsl:for-each select="hl7:part3/hl7:partNextOfKin">{
						"code": "<xsl:value-of select="hl7:code/@code"/>",
						"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>"
						}					
					</xsl:for-each>
					],
					"correspondence": [
					<xsl:for-each select="hl7:part4/hl7:partCorrespondence">{
						"code": "<xsl:value-of select="hl7:code/@code"/>",
						"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>"
						}					
					</xsl:for-each>
					],
					"callCentreCallBackConsent": [
					<xsl:for-each select="hl7:subjectOf3/hl7:callCentreCallBackConsent">{
						"code": "<xsl:value-of select="hl7:code/@code"/>",
						"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
						"value": "<xsl:value-of select="hl7:value/@code"/>",
						"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
						}					
					</xsl:for-each>
					],
					"preferredContactMethod": [
					<xsl:for-each select="hl7:subjectOf1/hl7:preferredContactMethod">{
						"code": "<xsl:value-of select="hl7:code/@code"/>",
						"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
						"value": "<xsl:value-of select="hl7:value/@code"/>",
						"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
						}					
					</xsl:for-each>
					],
					"preferredWrittenCommunicationFormat": [
					<xsl:for-each select="hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat">{
						"code": "<xsl:value-of select="hl7:code/@code"/>",
						"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
						"value": "<xsl:value-of select="hl7:value/@code"/>",
						"valueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
						}					
					</xsl:for-each>
					],
					"systemEffectiveDate": [
					<xsl:for-each select="hl7:subjectOf5/hl7:systemEffectiveDate">{
						"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
						"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
						}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
					],
					"source": [
					<xsl:for-each select="hl7:subjectOf4/hl7:pDSSourceData">
						{"sourceIdentified": [
						<xsl:for-each select="hl7:SourceIdentified">{
							"extension": "<xsl:value-of select="hl7:value/@extension"/>",
							"root": "<xsl:value-of select="hl7:value/@root"/>"
							}
						</xsl:for-each>
						], "sourceCoded": [
						<xsl:for-each select="hl7:SourceCoded">{
							"code": "<xsl:value-of select="hl7:value/@code"/>",
							"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
							}
						</xsl:for-each>
						]
						}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
					],
					"player": [
					<xsl:for-each select="hl7:player">{
					"relatedPatient": "<xsl:value-of select="hl7:playedRelatedPatient/hl7:id/@extension"/>",
                    "language": [
                    <xsl:for-each select="hl7:languageCommunication">
                        {
							"code": "<xsl:value-of select="hl7:languageCode/@code"/>",
							"proficiencyLevelCode": "<xsl:value-of select="hl7:proficiencyLevelCode/@code"/>",
							"preferenceInd": "<xsl:value-of select="hl7:preferenceInd/@value"/>"
						}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each> 
                    ],
					"address": [
					<xsl:for-each select="hl7:COCT_MT000201UK03.PartOfWhole">
						{
						<xsl:for-each select="hl7:addr">
						"addr": [{"line": "<xsl:value-of select="hl7:streetAddressLine[1]"/>"},
									{"line": "<xsl:value-of select="hl7:streetAddressLine[2]"/>"},
									{"line": "<xsl:value-of select="hl7:streetAddressLine[3]"/>"},
									{"line": "<xsl:value-of select="hl7:streetAddressLine[4]"/>"},
									{"line": "<xsl:value-of select="hl7:streetAddressLine[5]"/>"}],
                        "addressKey": "<xsl:value-of select="hl7:addressKey"/>",
                        "desc": "<xsl:value-of select="hl7:desc"/>",
                        "class": "<xsl:value-of select="@use"/>",
                        "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:useablePeriod/hl7:low/@value"/>",
                                            "high": "<xsl:value-of select="hl7:useablePeriod/hl7:high/@value"/>"
                                        }
                                    ]
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension"/>",
                            "postalCode": "<xsl:value-of select="hl7:postalCode"/>",
						</xsl:for-each>
					"source": [
						<xsl:for-each select="hl7:subjectOf1">{
						"sourceIdentified": [
							<xsl:for-each select="hl7:sourceSourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
									</xsl:for-each>
							],
							"sourceCoded": [
							<xsl:for-each select="hl7:sourceSourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
									</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
								</xsl:for-each>
						],
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf2/hl7:systemEffectiveDate">{
							"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
								</xsl:for-each>
						]
						}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>	
					],
					"telecom": [
                    <xsl:for-each select="hl7:COCT_MT000202UK03.PartOfWhole">
                       {
                        <xsl:for-each select="hl7:telecom">
                            "class": "<xsl:value-of select="@use"/>",
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:useablePeriod/hl7:low/@value"/>",
                                            "high": "<xsl:value-of select="hl7:useablePeriod/hl7:high/@value"/>"
                                        }
                                    ]
                                
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension"/>",
                            "tel": "<xsl:value-of select="@value"/>",
                        </xsl:for-each>
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf2/hl7:systemEffectiveDate">{
							"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
								</xsl:for-each>
						],
					"source": [
						<xsl:for-each select="hl7:subjectOf1">{
						"sourceIdentified": [
							<xsl:for-each select="hl7:sourceSourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
									</xsl:for-each>
							],
							"sourceCoded": [
							<xsl:for-each select="hl7:sourceSourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
									</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
								</xsl:for-each>
						]
                    }<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each> 
                    ],
                    "name": [
                    <xsl:for-each select="hl7:COCT_MT000203UK03.PartOfWhole">
                        {
                        <xsl:for-each select="hl7:partPerson/hl7:name">
                            "class": "<xsl:value-of select="@use"/>",
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:validTime/hl7:low/@value"/>",
                                            "high": "<xsl:value-of select="hl7:validTime/hl7:high/@value"/>"
                                        }
                                    ]
                                
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension"/>",
                            "prefix": "<xsl:value-of select="hl7:prefix"/>",
                            "givenNames": [
                                <xsl:for-each select="hl7:given">{
                                    "name": "<xsl:value-of select="self::node()"/>"
                                    }<xsl:if test="position() != last()">,</xsl:if>
                                </xsl:for-each>
                            ],
                            "family": "<xsl:value-of select="hl7:family"/>",
                            "suffix": "<xsl:value-of select="hl7:suffix"/>",
                        </xsl:for-each>
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf2/hl7:systemEffectiveDate">{
							"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
								</xsl:for-each>
						],
					"source": [
						<xsl:for-each select="hl7:subjectOf1">{
						"sourceIdentified": [
							<xsl:for-each select="hl7:sourceSourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
									</xsl:for-each>
							],
							"sourceCoded": [
							<xsl:for-each select="hl7:sourceSourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
									</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
								</xsl:for-each>
						]
                    }<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each> 
                    ]
					}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
					]
					
					
					
					}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>
					
					],
				
				
					"multipleBirthOrderNumber": "<xsl:value-of select="hl7:multipleBirthOrderNumber/@value"/>", 
					"address": [
					<xsl:for-each select="hl7:COCT_MT000201UK03.PartOfWhole">
						{
						<xsl:for-each select="hl7:addr">
						"addr": [{"line": "<xsl:value-of select="hl7:streetAddressLine[1]"/>"},
									{"line": "<xsl:value-of select="hl7:streetAddressLine[2]"/>"},
									{"line": "<xsl:value-of select="hl7:streetAddressLine[3]"/>"},
									{"line": "<xsl:value-of select="hl7:streetAddressLine[4]"/>"},
									{"line": "<xsl:value-of select="hl7:streetAddressLine[5]"/>"}],
                        "addressKey": "<xsl:value-of select="hl7:addressKey"/>",
                        "desc": "<xsl:value-of select="hl7:desc"/>",
                        "class": "<xsl:value-of select="@use"/>",
                        "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:useablePeriod/hl7:low/@value"/>",
                                            "high": "<xsl:value-of select="hl7:useablePeriod/hl7:high/@value"/>"
                                        }
                                    ]
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension"/>",
                            "postalCode": "<xsl:value-of select="hl7:postalCode"/>",
						</xsl:for-each>
					"source": [
						<xsl:for-each select="hl7:subjectOf1">{
						"sourceIdentified": [
							<xsl:for-each select="hl7:sourceSourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>
							],
							"sourceCoded": [
							<xsl:for-each select="hl7:sourceSourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
						],
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf2/hl7:systemEffectiveDate">{
							"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
						]
						}<xsl:if test="position() != last()">,</xsl:if>
						<!-- }<xsl:if test="position() != last()">,</xsl:if>-->
					</xsl:for-each>	
					],
					"telecom": [
                    <xsl:for-each select="hl7:COCT_MT000202UK03.PartOfWhole">
                       {
                        <xsl:for-each select="hl7:telecom">
                            "class": "<xsl:value-of select="@use"/>",
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:useablePeriod/hl7:low/@value"/>",
                                            "high": "<xsl:value-of select="hl7:useablePeriod/hl7:high/@value"/>"
                                        }
                                    ]
                                
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension"/>",
                            "tel": "<xsl:value-of select="@value"/>",
                        </xsl:for-each>
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf2/hl7:systemEffectiveDate">{
							"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
						],
					"source": [
						<xsl:for-each select="hl7:subjectOf1">{
						"sourceIdentified": [
							<xsl:for-each select="hl7:sourceSourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>
							],
							"sourceCoded": [
							<xsl:for-each select="hl7:sourceSourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
						]
                    }<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each> 
                    ],
                    "name": [
                    <xsl:for-each select="hl7:COCT_MT000203UK03.PartOfWhole">
                        {
                        <xsl:for-each select="hl7:partPerson/hl7:name">
                            "class": "<xsl:value-of select="@use"/>",
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:validTime/hl7:low/@value"/>",
                                            "high": "<xsl:value-of select="hl7:validTime/hl7:high/@value"/>"
                                        }
                                    ]
                                
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension"/>",
                            "prefix": "<xsl:value-of select="hl7:prefix"/>",
                            "givenNames": [
                                <xsl:for-each select="hl7:given">{
                                    "name": "<xsl:value-of select="self::node()"/>"
                                    }<xsl:if test="position() != last()">,</xsl:if>
                                </xsl:for-each>
                            ],
                            "family": "<xsl:value-of select="hl7:family"/>",
                            "suffix": "<xsl:value-of select="hl7:suffix"/>",
                        </xsl:for-each>
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf2/hl7:systemEffectiveDate">{
							"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
						],
					"source": [
						<xsl:for-each select="hl7:subjectOf1">{
						"sourceIdentified": [
							<xsl:for-each select="hl7:sourceSourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>
							],
							"sourceCoded": [
							<xsl:for-each select="hl7:sourceSourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
						]
                    }<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each> 
                    ],
                    "birthPlace": [
                    <xsl:for-each select="hl7:COCT_MT000208UK01.BirthPlace">
                        {
                        <xsl:for-each select="hl7:addr">
							"country": [
							<xsl:for-each select="hl7:country">
								{
								"code": "<xsl:value-of select="hl7:code/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>"
								}
                            </xsl:for-each>
                            ],
                            "county":  "<xsl:value-of select="hl7:county"/>",
                            "city":  "<xsl:value-of select="hl7:city"/>",
                        </xsl:for-each>
                        "notificationTime": [
                        <xsl:for-each select="hl7:subjectOf/hl7:notificationTime">
							{
								"value": "<xsl:value-of select="hl7:value/@value"/>"
							}
                        </xsl:for-each>
                        ]
						}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each> 
                    ],
                    "birthTime": [
                    <xsl:for-each select="hl7:COCT_MT000210UK01.PartBirthTime">
                        {
                        <xsl:for-each select="hl7:partPerson">
							"birthTime": "<xsl:value-of select="hl7:birthTime/@value"/>",
                        </xsl:for-each>
                        "notificationTime": [
                        <xsl:for-each select="hl7:subjectOf/hl7:notificationTime">
							{
								"value": "<xsl:value-of select="hl7:value/@value"/>"
							}
                        </xsl:for-each>
                        ]
						}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each> 
                    ],
                    "gender": [
                    <xsl:for-each select="hl7:COCT_MT000209UK01.PartAdminGenderCode">
                        {
                        <xsl:for-each select="hl7:partPerson">
							"gender": "<xsl:value-of select="hl7:administrativeGenderCode/@code"/>",
                        </xsl:for-each>
                        "notificationTime": [
                        <xsl:for-each select="hl7:subjectOf/hl7:notificationTime">
							{
								"value": "<xsl:value-of select="hl7:value/@value"/>"
							}
                        </xsl:for-each>
                        ]
						}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each> 
                    ],
                    "deceasedTime": [
                    <xsl:for-each select="hl7:COCT_MT000211UK01.PartDeceasedTime">
                        {
                        <xsl:for-each select="hl7:partPerson">
							"deceasedTime": "<xsl:value-of select="hl7:deceasedTime/@value"/>",
                        </xsl:for-each>
                        "notificationTime": [
                        <xsl:for-each select="hl7:subjectOf/hl7:notificationTime">
							{
								"value": "<xsl:value-of select="hl7:value/@value"/>"
							}
                        </xsl:for-each>
                        ]
						}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each> 
                    ],
                    "language": [
                    <xsl:for-each select="hl7:languageCommunication">
                        {
							"code": "<xsl:value-of select="hl7:languageCode/@code"/>",
							"proficiencyLevelCode": "<xsl:value-of select="hl7:proficiencyLevelCode/@code"/>",
							"preferenceInd": "<xsl:value-of select="hl7:preferenceInd/@value"/>"
						}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each> 
                    ],
                    
                    
                    
                    "playedOtherProviderPatient": [
                    <xsl:for-each select="hl7:playedOtherProviderPatient">
                        {
                        <xsl:for-each select="hl7:subjectOf/hl7:patientCareProvision">
							"id": "<xsl:value-of select="hl7:id/@extension"/>",
							"code": "<xsl:value-of select="hl7:code/@code"/>",
                            "codeSystem": "<xsl:value-of select="hl7:code/@codeSystem"/>",
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>",
                                            "high": "<xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>"
                                        }
                                    ]
                                }
                            ],
                            "assignedEntity": [{
                                "id": "<xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:id/@extension"/>",
                                "codeSystem": "<xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:id/@root"/>"
                            }],
						"source": [
						<xsl:for-each select="hl7:subjectOf/hl7:pDSSourceData">
							{"sourceIdentified": [
							<xsl:for-each select="hl7:SourceIdentified">{
								"extension": "<xsl:value-of select="hl7:value/@extension"/>",
								"root": "<xsl:value-of select="hl7:value/@root"/>"
								}
							</xsl:for-each>
							], "sourceCoded": [
							<xsl:for-each select="hl7:SourceCoded">{
								"code": "<xsl:value-of select="hl7:value/@code"/>",
								"codeSystem": "<xsl:value-of select="hl7:value/@codeSystem"/>"
								}
							</xsl:for-each>
							]
							}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>
						],
						"systemEffectiveDate": [
						<xsl:for-each select="hl7:subjectOf1/hl7:systemEffectiveDate">{
							"low": "<xsl:value-of select="hl7:value/hl7:low/@value"/>",
							"high": "<xsl:value-of select="hl7:value/hl7:high/@value"/>"
							}<xsl:if test="position() != last()">,</xsl:if>
							</xsl:for-each>
						]<xsl:if test="position() != last()">,</xsl:if>
						</xsl:for-each>
                    }<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each> 
                    ],    
				</xsl:for-each>
                "nhsNumber": "<xsl:value-of select="hl7:id/@extension"/>", 
                "nhsNumberCodeSystem": "<xsl:value-of select="hl7:id/@root"/>" 
				}
            </xsl:for-each>
			<xsl:if test="position() != last()">,</xsl:if>
		</xsl:for-each>
	}
	</xsl:template>
</xsl:stylesheet>
