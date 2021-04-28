<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:nasp="http://national.carerecords.nhs.uk/schema/" xmlns:xsi="http://www.w3c.org/2001/XML-Schema-Instance" xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"  xmlns:crs="http://national.carerecords.nhs.uk/schema/crs/" version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no" />
    <xsl:template match="/SOAP:Envelope/SOAP:Header/wsa:*"></xsl:template>
    <xsl:template match="/SOAP:Envelope/SOAP:Body/hl7:scraPermissionsQueryResponse/hl7:HAS_SCRA_PERMISSIONS_INSM01">
{
"messageID": "<xsl:value-of select="hl7:id/@root" />",
"interactionID": "<xsl:value-of select="hl7:interactionId/@extension" />",
"messageRef": "<xsl:value-of select="hl7:acknowledgement/hl7:messageRef/hl7:id/@root" />",
"status": "success", 
    <xsl:for-each select="hl7:ControlActEvent/hl7:subject/hl7:hasSCRaPermissionsResponse">
        "ActiveNormalEvents": {
        <xsl:for-each select="hl7:event">
            "<xsl:value-of select="hl7:eventID/@root" />": {
            "eventID": "<xsl:value-of select="hl7:eventID/@root" />",
            <xsl:if test="withdrawingEventID">"withdrawingEventID": "<xsl:value-of select="hl7:withdrawingEventID/@root" />",</xsl:if>
            "payloadID": {
            "code": "<xsl:value-of select="hl7:payloadID/@extension" />",
            "codeSystem": "<xsl:value-of select="hl7:payloadID/@root" />"
            },
            "persistenceDate": "<xsl:value-of select="hl7:persistenceDate/@value" />",
            "eventStatus":  {
        "codeSystem": "<xsl:value-of select="hl7:eventStatus/@codeSystem" />",
        "code": "<xsl:value-of select="hl7:eventStatus/@code" />",
        "displayName": "<xsl:value-of select="hl7:eventStatus/@displayName" />"
      },
      "eventType": {
        "codeSystem": "<xsl:value-of select="hl7:eventType/@codeSystem" />",
        "code": "<xsl:value-of select="hl7:eventType/@code" />",
        "displayName": "<xsl:value-of select="hl7:eventType/@displayName" />"
      },
      "author": {
        "time": "<xsl:value-of select="hl7:author/hl7:time/@value" />",
        "AgentPersonSDS": {
          "id": {
            "code": "<xsl:value-of select="hl7:author/hl7:AgentPersonSDS/hl7:id/@extension" />",
            "codeSystem": "<xsl:value-of select="hl7:author/hl7:AgentPersonSDS/hl7:id/@root" />"
          },
          "personSDS": {
            "id": {
              "code": "<xsl:value-of select="hl7:author/hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:id/@extension" />",
              "codeSystem": "<xsl:value-of select="hl7:author/hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:id/@root" />"
            }
            <xsl:if test="hl7:author/hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:name/hl7:family"> 
            ,"familyName": "<xsl:value-of select="hl7:author/hl7:AgentPersonSDS/hl7:agentPersonSDS/hl7:name/hl7:family" />"
            </xsl:if>
          }
        }
      }
            }<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        
        },
  "Consent": {
    "Store": "<xsl:value-of select="hl7:consent/hl7:values[@type='Store']/@value" />",
    "View": "<xsl:value-of select="hl7:consent/hl7:values[@type='View']/@value" />"
  },
  "PermissionToView": {
    "exists": "<xsl:value-of select="hl7:permissionToView/@exists" />",
    "claimed": "<xsl:value-of select="hl7:permissionToView/@claimed" />",
    "referred": "<xsl:value-of select="hl7:permissionToView/@referred" />",
    "start": "<xsl:value-of select="hl7:permissionToView/@start" />",
    "end": "<xsl:value-of select="hl7:permissionToView/@end" />",
    "author": "<xsl:value-of select="hl7:permissionToView/@author" />",
    "assessorID": "<xsl:value-of select="hl7:permissionToView/@assessorID" />",
    "assessorGR": "<xsl:value-of select="hl7:permissionToView/@assessorGR" />"
  },
  "LegitimateRelationship": {
    "exists": "<xsl:value-of select="hl7:legitimateRelationships/@exists" />",
    "claimed": "<xsl:value-of select="hl7:legitimateRelationships/@claimed" />",
    "referred": "<xsl:value-of select="hl7:legitimateRelationships/@referred" />",
    "start": "<xsl:value-of select="hl7:legitimateRelationships/@start" />",
    "end": "<xsl:value-of select="hl7:legitimateRelationships/@end" />",
    "reason": "<xsl:value-of select="hl7:legitimateRelationships/@reason" />",
    "staff": "<xsl:value-of select="hl7:legitimateRelationships/@staff" />"
  },
  "hasActiveCPO": "<xsl:value-of select="hl7:hasActiveCPO/@value" />"
    </xsl:for-each>
}
    </xsl:template>
</xsl:stylesheet>