<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"	version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
	<xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"></xsl:template>
	<xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:*/hl7:ControlActEvent/hl7:subject/hl7:PdsTraceMatch">
{
	<xsl:for-each select="hl7:subject">
			<xsl:for-each select="hl7:patientRole">
				"<xsl:value-of select="hl7:id/@extension" />": {				
				"confidentialityCode": "<xsl:value-of select="hl7:confidentialityCode/@code" />",
				"confidentialityCodeCodeSystem": "<xsl:value-of select="hl7:confidentialityCode/@codeSystem"/>", 
				<xsl:for-each select="hl7:subjectOf3/hl7:deathNotification">
					"deathNotificationCode": "<xsl:value-of select="hl7:code/@code" />",
					"deathNotificationCodeSystem": "<xsl:value-of select="hl7:code/@codeSystem" />",
					"deathNotificationValue": "<xsl:value-of select="hl7:value/@value" />",
					"deathNotificationValueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem" />",
				</xsl:for-each>
                
                "alternativeIdentifier": [
                <xsl:for-each select="hl7:subjectOf4/hl7:alternativeIdentifier">
                    {
                    "value":"<xsl:value-of select="hl7:value/@extension" />",
                    "valueCodeSystem": "<xsl:value-of select="hl7:value/@root" />"
                    }
                    <xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each> ],
                "oldVersion": [
                <xsl:for-each select="hl7:replacementOf/hl7:oldVersion">
                    {
                    "value":"<xsl:value-of select="hl7:id/@extension" />",
                    "valueCodeSystem": "<xsl:value-of select="hl7:id/@root" />"
                    }
                    <xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each> ],
                
                <xsl:for-each select="hl7:subjectOf3/hl7:deathNotification">
                    "deathNotificationCode": "<xsl:value-of select="hl7:code/@code" />",
                    "deathNotificationCodeSystem": "<xsl:value-of select="hl7:code/@codeSystem" />",
                    "deathNotificationValue": "<xsl:value-of select="hl7:value/@value" />",
                    "deathNotificationValueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem" />",
                </xsl:for-each>
                
                <xsl:for-each select="hl7:subjectOf1/hl7:matchingLevel">
					"matchingLevelCode": "<xsl:value-of select="hl7:code/@code" />",
					"matchingLevelCodeSystem": "<xsl:value-of select="hl7:code/@codeSystem" />",
					"matchingLevelValue": "<xsl:value-of select="hl7:value/@value" />",
					"matchingLevelUnit": "<xsl:value-of select="hl7:value/@unit" />",
				</xsl:for-each>
				<xsl:for-each select="hl7:subjectOf2/hl7:previousNhsContact">
					"previousNhsContactCode": "<xsl:value-of select="hl7:code/@code" />",
					"previousNhsContactCodeSystem": "<xsl:value-of select="hl7:code/@codeSystem" />",
					"previousNhsContactValue": "<xsl:value-of select="hl7:value/@code" />",
					"previousNhsContactValueCodeSystem": "<xsl:value-of select="hl7:value/@codeSystem" />",
				</xsl:for-each>
				<xsl:for-each select="hl7:patientPerson">
					"Gender": "<xsl:value-of select="hl7:administrativeGenderCode/@code"/>", 
					"birthTime": "<xsl:value-of select="hl7:birthTime/@value"/>", 
					"deceasedTime": "<xsl:value-of select="hl7:deceasedTime/@value"/>", 
					"multipleBirthOrderNumber": "<xsl:value-of select="hl7:multipleBirthOrderNumber/@value"/>", 
                    "address": [
					<xsl:for-each select="hl7:COCT_MT000201UK02.PartOfWhole">
						{
						<xsl:for-each select="hl7:addr" >
						"addr": [
							{"line": "<xsl:value-of select="hl7:streetAddressLine[1]" />"},
							{"line": "<xsl:value-of select="hl7:streetAddressLine[2]" />"},
							{"line": "<xsl:value-of select="hl7:streetAddressLine[3]" />"},
							{"line": "<xsl:value-of select="hl7:streetAddressLine[4]" />"},
							{"line": "<xsl:value-of select="hl7:streetAddressLine[5]" />"}
							],
                            "addressKey": "<xsl:value-of select="hl7:addressKey" />",
                            "class": "<xsl:value-of select="@use" />",
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:useablePeriod/hl7:low/@value" />",
                                            "high": "<xsl:value-of select="hl7:useablePeriod/hl7:high/@value" />"
                                        }
                                    ]
                                
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension" />",
                            "postalCode": "<xsl:value-of select="hl7:postalCode" />"
						</xsl:for-each>,
                        "sedLow": "<xsl:value-of select="hl7:subjectOf2/hl7:systemEffectiveDate/hl7:value/hl7:low/@value" />",
                        "sedHigh": "<xsl:value-of select="hl7:subjectOf2/hl7:systemEffectiveDate/hl7:value/hl7:high/@value" />",
                        "sourceIdentified": [
                            {
                                "codeSystem": "<xsl:value-of select="hl7:subjectOf1/hl7:sourceSourceIdentified/hl7:code/@codeSystem" />",
                                "value": "<xsl:value-of select="hl7:subjectOf1/hl7:sourceSourceIdentified/hl7:value/@extension" />"
                            }
                        ]
					}<xsl:if test="position() != last()">,</xsl:if>
					</xsl:for-each>	],
                    "telecom": [
                    <xsl:for-each select="hl7:COCT_MT000202UK02.PartOfWhole">
                        {
                        <xsl:for-each select="hl7:telecom" >
                            "class": "<xsl:value-of select="@use" />",
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:useablePeriod/hl7:low/@value" />",
                                            "high": "<xsl:value-of select="hl7:useablePeriod/hl7:high/@value" />"
                                        }
                                    ]
                                
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension" />",
                            "tel": "<xsl:value-of select="@value" />",
                        </xsl:for-each>
                        "sedLow": "<xsl:value-of select="hl7:subjectOf2/hl7:systemEffectiveDate/hl7:value/hl7:low/@value" />",
                        "sedHigh": "<xsl:value-of select="hl7:subjectOf2/hl7:systemEffectiveDate/hl7:value/hl7:high/@value" />",
                        "sourceIdentified": [
                            {
                                "codeSystem": "<xsl:value-of select="hl7:subjectOf1/hl7:sourceSourceIdentified/hl7:code/@codeSystem" />",
                                "value": "<xsl:value-of select="hl7:subjectOf1/hl7:sourceSourceIdentified/hl7:value/@extension" />"
                            }
                        ]
                    }<xsl:if test="position() != last()">,</xsl:if>
                    </xsl:for-each> ],
                    "name": [
                    <xsl:for-each select="hl7:COCT_MT000203UK02.PartOfWhole">
                        {
                        <xsl:for-each select="hl7:partPerson/hl7:name" >
                            "class": "<xsl:value-of select="@use" />",
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:validTime/hl7:low/@value" />",
                                            "high": "<xsl:value-of select="hl7:validTime/hl7:high/@value" />"
                                        }
                                    ]
                                
                                }
                            ],
                            "id": "<xsl:value-of select="hl7:id/@extension" />",
                            "prefix": "<xsl:value-of select="hl7:prefix" />",
                            "givenNames": [
                                <xsl:for-each select="hl7:given">{
                                    "name": "<xsl:value-of select="self::node()"/>"
                                    }<xsl:if test="position() != last()">,</xsl:if>
                                </xsl:for-each>
                            ],
                            "family": "<xsl:value-of select="hl7:family" />",
                            "suffix": "<xsl:value-of select="hl7:suffix" />",
                        </xsl:for-each>
                        "sedLow": "<xsl:value-of select="hl7:subjectOf2/hl7:systemEffectiveDate/hl7:value/hl7:low/@value" />",
                        "sedHigh": "<xsl:value-of select="hl7:subjectOf2/hl7:systemEffectiveDate/hl7:value/hl7:high/@value" />",
                        "sourceIdentified": [
                            {
                                "codeSystem": "<xsl:value-of select="hl7:subjectOf1/hl7:sourceSourceIdentified/hl7:code/@codeSystem" />",
                                "value": "<xsl:value-of select="hl7:subjectOf1/hl7:sourceSourceIdentified/hl7:value/@extension" />"
                            }
                        ]
                    }<xsl:if test="position() != last()">,</xsl:if>
                    </xsl:for-each> ],
                    "playedOtherProviderPatient": [
                    <xsl:for-each select="hl7:playedOtherProviderPatient">
                        {
                        <xsl:for-each select="hl7:subjectOf/hl7:patientCareProvision" >
                            "effective": [
                                {
                                    "window": [
                                        {
                                            "low": "<xsl:value-of select="hl7:effectiveTime/hl7:low/@value" />",
                                            "high": "<xsl:value-of select="hl7:effectiveTime/hl7:high/@value" />"
                                        }
                                    ]
                                
                                }
                            ],
                            "healthCareProvider": [{
                                "code": "<xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:id/@extension" />",
                                "codeSystem": "<xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:id/@root" />"
                            }],
                            "patientCareProvisionCode": [{
                                "code": "<xsl:value-of select="hl7:code/@code" />",
                                "codeSystem": "<xsl:value-of select="hl7:code/@codeSystem" />"
                            }],
                        </xsl:for-each>
                        "sedLow": "<xsl:value-of select="hl7:subjectOf2/hl7:systemEffectiveDate/hl7:value/hl7:low/@value" />",
                        "sedHigh": "<xsl:value-of select="hl7:subjectOf2/hl7:systemEffectiveDate/hl7:value/hl7:high/@value" />",
                        "sourceIdentified": [
                            {
                                "codeSystem": "<xsl:value-of select="hl7:subjectOf1/hl7:sourceSourceIdentified/hl7:code/@codeSystem" />",
                                "value": "<xsl:value-of select="hl7:subjectOf1/hl7:sourceSourceIdentified/hl7:value/@extension" />"
                            }
                        ]
                    }<xsl:if test="position() != last()">,</xsl:if>
                    </xsl:for-each>  ],   
				</xsl:for-each>
                "nhsNumber": "<xsl:value-of select="hl7:id/@extension" />", 
                "nhsNumberCodeSystem": "<xsl:value-of select="hl7:id/@root" />" 
				}
            </xsl:for-each>
		<xsl:if test="position() != last()">,</xsl:if>
	</xsl:for-each>
	}
	</xsl:template>

</xsl:stylesheet>