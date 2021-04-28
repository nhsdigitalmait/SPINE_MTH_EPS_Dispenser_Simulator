<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:psis="urn:npfit:psisqr" version="1.0">
	<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"/>
	<xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:extendedQueryResponse/hl7:SCRA_EXTENDEDRESPONSE_INSM01/hl7:ControlActEvent/hl7:subject">
{"<xsl:value-of select="psis:extendedQueryResponse/psis:recordTarget/psis:patient/psis:id/@extension"/>": [
	{
            <xsl:for-each select="psis:extendedQueryResponse/psis:event">
			"<xsl:value-of select="psis:eventID/@root"/>": [
                {"eventID": "<xsl:value-of select="psis:eventID/@root"/>",
                "payloadID": "<xsl:value-of select="psis:payloadID/@extension"/>",
                "payloadIDcodeSystem": "<xsl:value-of select="psis:payloadID/@root"/>",
                "persistenceDate": "<xsl:value-of select="psis:persistenceDate/@value"/>",
                "eventStatus": [
                <xsl:for-each select="psis:eventStatus">
                    {"code": "<xsl:value-of select="@code"/>",
                    "codeSystem": "<xsl:value-of select="@codeSystem"/>",
                    "displayName": "<xsl:value-of select="@displayName"/>"}
                </xsl:for-each>
                ],
                "eventType": [
                <xsl:for-each select="psis:eventType">
                    {"code": "<xsl:value-of select="@code"/>",
                    "codeSystem": "<xsl:value-of select="@codeSystem"/>",
                    "displayName": "<xsl:value-of select="@displayName"/>"}
                </xsl:for-each>
                ],
                "author": [
                <xsl:for-each select="psis:author">
                    {"time": "<xsl:value-of select="psis:time/@value"/>",
                    "agentPerson": [{
                    <xsl:for-each select="psis:AgentPersonSDS">
                        "roleProfileId": "<xsl:value-of select="psis:id/@extension"/>",
                        "usersUniqueId": "<xsl:value-of select="psis:agentPersonSDS/psis:id/@extension"/>",
                        "roleId": "<xsl:value-of select="psis:partSDSRole/psis:id/@extension"/>"
                    </xsl:for-each>
                    }]
                    ,
                    "agentSystem": [
                    <xsl:for-each select="hl7:UKCT_MT160018UK01.AgentSystemSDS">
                        {"systemId": "<xsl:value-of select="hl7:agentSystemSDS/hl7:id/@extension"/>"}
                    </xsl:for-each>
                    ]}<xsl:if test="position() != last()">,</xsl:if>
			</xsl:for-each>
                ]}
                ],
		</xsl:for-each>
        "hasActiveCPO": "<xsl:value-of select="psis:extendedQueryResponse/psis:hasActiveCPO/@value"/>"
        }
       ]
	}
	</xsl:template>
</xsl:stylesheet>
