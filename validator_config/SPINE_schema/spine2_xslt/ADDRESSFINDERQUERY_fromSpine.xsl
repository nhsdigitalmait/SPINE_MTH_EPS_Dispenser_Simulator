<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"  version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
    <xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"/>
    <xsl:template match="/SOAP:Envelope/SOAP:Body/nasp:getAddressListResponse">{
       "ID": "<xsl:value-of select="nasp:messageHeader/nasp:messageId" />",
       <xsl:if test="nasp:addressList">
                "addressList": [
            <xsl:for-each select="nasp:addressList/nasp:postalAddress">
                    {"address1": "<xsl:value-of select="nasp:address1" />",
                    "address2": "<xsl:value-of select="nasp:address2" />",
                    "address3": "<xsl:value-of select="nasp:address3" />",
                    "town": "<xsl:value-of select="nasp:town" />",
                    "county": "<xsl:value-of select="nasp:county" />",
                    "postCode": "<xsl:value-of select="nasp:postCode" />",
                    "country": "<xsl:value-of select="nasp:country" />",
                    "addressKey": "<xsl:value-of select="nasp:addressKey" />"
                }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ],
            "totalmatches": <xsl:value-of select="nasp:totalmatches" />,
            "success": "True"
        }
        </xsl:if>
        <xsl:if test="nasp:messageHeader/nasp:errorList">
            "errorList":[
             <xsl:for-each select="nasp:messageHeader/nasp:errorList/nasp:error">
                    {"codeContext": "<xsl:value-of select="nasp:codeContext" />",
                    "errorCode": "<xsl:value-of select="nasp:errorCode" />",
                    "severity": "<xsl:value-of select="nasp:severity" />",
                    "description": "<xsl:value-of select="nasp:description" />"
                }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ],
            "success": "False"
        }
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>