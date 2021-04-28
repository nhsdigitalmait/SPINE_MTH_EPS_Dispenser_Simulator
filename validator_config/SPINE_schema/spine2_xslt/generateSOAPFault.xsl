<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes"/>
	
	<xsl:template match="/">
		<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" >
    			<SOAP:Body>
        			<SOAP:Fault>
            			<faultcode><xsl:value-of select="$faultCode"/></faultcode>
            			<faultstring><xsl:value-of select="$faultString"/></faultstring>
            			<detail>
                			<nasp:errorList xmlns:nasp="http://national.carerecords.nhs.uk/schema/">
                    			<nasp:error>
                        			<nasp:codeContext><xsl:value-of select="$codeContext"/></nasp:codeContext>
                        			<nasp:errorCode><xsl:value-of select="$errorCode"/></nasp:errorCode>
                        			<nasp:severity><xsl:value-of select="$severity"/></nasp:severity>
                        			<nasp:location><xsl:value-of select="$location"/></nasp:location>
                        			<nasp:description><xsl:value-of select="$description"/></nasp:description>
                    		</nasp:error>
               		 </nasp:errorList>
            			</detail>
           		</SOAP:Fault>
    			</SOAP:Body>
		</SOAP:Envelope>
	</xsl:template>
</xsl:stylesheet>