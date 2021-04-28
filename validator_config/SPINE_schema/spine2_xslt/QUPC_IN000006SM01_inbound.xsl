<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"	version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
	<xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"></xsl:template>
	<xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:CP-ISNHSQueryResponse/hl7:REPC_IN000007SM01/hl7:ControlActEvent/hl7:subject/hl7:CP-ISNHSQueryResponse">
{
	<xsl:for-each select="hl7:pertinentInformation13">
        "previouslyViewedBy": [
            <xsl:for-each select="hl7:pertinentCP-ISNHSQuery">
                {
                    "effectiveTime": "<xsl:value-of select="hl7:effectiveTime/@value" />",
                    "messageGUID": "<xsl:value-of select="hl7:id/@root" />",
                    "viewersDetails": {
                        <xsl:for-each select="hl7:viewer">
                            "roleName": "<xsl:value-of select="hl7:jobRole/@displayName" />",
                            "name": {
                                <xsl:for-each select="hl7:name">
                                    "prefix": "<xsl:value-of select="hl7:prefix" />",
                                    <xsl:for-each select="hl7:given">
                                        "givenName": "<xsl:value-of select="." />",
                                    </xsl:for-each>
                                    "familyName": "<xsl:value-of select="hl7:family" />",
                                    <xsl:variable name="prefix" select="hl7:prefix"/>
                                    <xsl:variable name="givenName"><xsl:for-each select="hl7:given"><xsl:value-of select="." /> </xsl:for-each></xsl:variable>
                                    <xsl:variable name="familyName" select="hl7:family"/>
                                    "fullName": "<xsl:value-of select="normalize-space(concat($prefix,' ',$givenName,' ',$familyName))"/>"
                                </xsl:for-each>
                            },
                            "orgName": "<xsl:value-of select="hl7:organisation" />"
                        </xsl:for-each>
                    }
                }
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
        ],
    </xsl:for-each>
    <xsl:for-each select="hl7:pertinentInformation14">
        "currentCPOs": [
            <xsl:for-each select="hl7:pertinentCP-ISRecordControlAct">
                {
                "responsibleLocalAuthorityDetails": {
                    "orgId": "<xsl:value-of select="hl7:record/hl7:communicationFunctionSnd/hl7:organisation/hl7:id/@extension" />",
                    "orgName": "<xsl:value-of select="hl7:record/hl7:communicationFunctionSnd/hl7:organisation/hl7:name" />",
                    "telecomDetails": {
                        <xsl:for-each select="hl7:record/hl7:communicationFunctionSnd/hl7:organisation/hl7:telecom">
                            "<xsl:value-of select="./@use" />": "<xsl:value-of select="./@value" />"
                            <xsl:if test="position() != last()">,</xsl:if>
                        </xsl:for-each>
                    },
                    <xsl:for-each select="hl7:record/hl7:CP-ISRecord/hl7:pertinentInformation15/hl7:COCT_TP146105GB01.CPPInformation">
                        "startDate": "<xsl:value-of select="hl7:component/hl7:cPPStartDate/hl7:value/@value" />",
                        "endDate": "<xsl:value-of select="hl7:component1/hl7:cPPEndDate/hl7:value/@value" />",
                        "planType": "Child Protection Plan"
                   </xsl:for-each>
                   <xsl:for-each select="hl7:record/hl7:CP-ISRecord/hl7:pertinentInformation15/hl7:COCT_TP146103GB01.LACInformation">
                        "startDate": "<xsl:value-of select="hl7:component/hl7:lACStartDate/hl7:value/@value" />",
                        "endDate": "<xsl:value-of select="hl7:component1/hl7:lACEndDate/hl7:value/@value" />",
                        "planType": "Looked After Child"
                   </xsl:for-each>
                   <xsl:for-each select="hl7:record/hl7:CP-ISRecord/hl7:pertinentInformation15/hl7:COCT_TP146104GB01.UCPInformation">
                        "startDate": "<xsl:value-of select="hl7:component/hl7:uCPStartDate/hl7:value/@value" />",
                        "endDate": "<xsl:value-of select="hl7:component1/hl7:uCPEndDate/hl7:value/@value" />",
                        "planType": "Unborn Child Protection Plan"
                   </xsl:for-each>
                }
                }
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
        ]
        <xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
}
	</xsl:template>

</xsl:stylesheet>