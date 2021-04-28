<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3">
    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <copiedContent>
        
            <text>The prescription is with another dispenser so it cannot be released.</text>
            <performer typeCode="PRF">
                <time>
                    <xsl:attribute name="value">
                        <xsl:value-of select="/*/hl7:effectiveTime/@value"/>
                    </xsl:attribute>
                </time>
                <xsl:copy-of select="/*/hl7:author/hl7:AgentPerson"/>
            </performer>
        </copiedContent>
    </xsl:template>
</xsl:stylesheet>
