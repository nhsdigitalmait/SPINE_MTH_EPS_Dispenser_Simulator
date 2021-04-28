<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<!--Author: Damian Murphy -->
	<!--Version: 4.0 -->
	<!--Date Created: 16th July 2009-->
	<!--Date Modified: 29th July 2009-->
	<!--Modified By: Meena Pillai -->
	<!--Purpose: To check that the Participant CMET mandatory elements and attributes are present according to the specification.
		1)Amended to include OID 1.2.826.0.1285.0.2.1.54 and 1.2.826.0.1285.0.2.0.65
		2) Amended to include check for healthCareProviderLicense only for R2 messages.-->
	<!--12/01/2015 RRobinson - Updated to remove checking for OID 2.16.840.1.113883.2.1.3.2.4.17.94 - MIM states that representedOrganization and representedOrganization/hl7:healthCareProviderLicense/hl7:Organization do not require OIDs -->
		
	<xsl:template match="/">
		<h3>Participant CMET checker</h3>
		<table>
			<xsl:call-template name="checkParticipant"/>
		</table>
	</xsl:template>
	<xsl:template name="checkParticipant">
		<xsl:if test="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:author">
			<tr>
				<td>Author</td>
			</tr>
			<xsl:call-template name="checkPerformer">
				<xsl:with-param name="p" select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:author"/>
				<xsl:with-param name="n" select="'author'"/>
				<xsl:with-param name="m" select="/*[1]/hl7:interactionId/@extension"/>
			</xsl:call-template>
			<xsl:if test="/*[1]/hl7:interactionId[not(@extension='PORX_IN020101UK04') and not(@extension='PORX_IN020102UK04')]/@extension">
				<xsl:call-template name="checkHealthProvider">
					<xsl:with-param name="p" select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:author"/>
					<xsl:with-param name="n" select="'author'"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
		<xsl:if test="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:legalAuthenticator">
			<tr>
				<td>legalAuthenticator</td>
			</tr>
			<xsl:call-template name="checkPerformer">
				<xsl:with-param name="p" select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:legalAuthenticator"/>
				<xsl:with-param name="n" select="'legalAuthenticator'"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:responsibleParty">
			<tr>
				<td>responsibleParty</td>
			</tr>
			<xsl:call-template name="checkPerformer">
				<xsl:with-param name="p" select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:responsibleParty"/>
				<xsl:with-param name="n" select="'responsibleParty'"/>
				<xsl:with-param name="m" select="/*[1]/hl7:interactionId/@extension"/>
			</xsl:call-template>
			<xsl:if test="/*[1]/hl7:interactionId[not(@extension='PORX_IN020101UK04') and not(@extension='PORX_IN020102UK04')]/@extension">
				<xsl:call-template name="checkHealthProvider">
					<xsl:with-param name="p" select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:responsibleParty"/>
					<xsl:with-param name="n" select="'responsibleParty'"/>
					<xsl:with-param name="m" select="/*[1]/hl7:interactionId/@extension"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="checkPerformer">
		<xsl:param name="p"/>
		<xsl:param name="n"/>
		<xsl:param name="m"/>
		<!-- Check the OIDs first -->
		<xsl:call-template name="checkOID">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:id"/>
			<xsl:with-param name="oid" select="'1.2.826.0.1285.0.2.0.67'"/>
		</xsl:call-template>
		<xsl:call-template name="checkCode">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:code"/>
			<xsl:with-param name="oid" select="'1.2.826.0.1285.0.2.1.104'"/>
		</xsl:call-template>
		<xsl:call-template name="checkOID">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:agentPerson/hl7:id"/>
			<xsl:with-param name="oid" select="'1.2.826.0.1285.0.2.1.54'"/>
			<xsl:with-param name="oid2" select="'1.2.826.0.1285.0.2.0.65'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:agentPerson/hl7:name"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:agentPerson/hl7:name'"/>
		</xsl:call-template>
		<xsl:call-template name="checkOID">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:id"/>
			<xsl:with-param name="oid" select="'1.2.826.0.1285.0.1.10'"/>
		</xsl:call-template>
<!--		<xsl:call-template name="checkCode">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:code"/>
			<xsl:with-param name="oid" select="'2.16.840.1.113883.2.1.3.2.4.17.94'"/>
		</xsl:call-template>-->
		<!-- Then check the contents -->
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:id/@root"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:id/@extension'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:code/@code"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:code/@code'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:telecom/@value"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:telecom/@value'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:id/@extension"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:id/@extension'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:code/@code"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:code/@code'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:name"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:name'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:telecom/@value"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:telecom/@value'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:addr[child::*]"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:addr[child::*]'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:addr[child::hl7:postalCode]"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:addr[child::hl7:postalCode]'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:agentPerson/hl7:id/@extension"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:agentPerson/hl7:id/@extension'"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="checkHealthProvider">
		<xsl:param name="p"/>
		<xsl:param name="n"/>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:healthCareProviderLicense/hl7:Organization/hl7:id/@extension"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:healthCareProviderLicense/hl7:Organization/hl7:id/@extension'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:healthCareProviderLicense/hl7:Organization/hl7:code/@code"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:healthCareProviderLicense/hl7:Organization/hl7:code/@code'"/>
		</xsl:call-template>
		<xsl:call-template name="checkExistsAndPopulated">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:healthCareProviderLicense/hl7:Organization/hl7:name"/>
			<xsl:with-param name="n1" select="$n"/>
			<xsl:with-param name="n2" select="'hl7:AgentPerson/hl7:representedOrganization/hl7:healthCareProviderLicense/hl7:Organization/hl7:name'"/>
		</xsl:call-template>
		<xsl:call-template name="checkOID">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:healthCareProviderLicense/hl7:Organization/hl7:id"/>
			<xsl:with-param name="oid" select="'1.2.826.0.1285.0.1.10'"/>
		</xsl:call-template>
<!--		<xsl:call-template name="checkCode">
			<xsl:with-param name="loc" select="$p/hl7:AgentPerson/hl7:representedOrganization/hl7:healthCareProviderLicense/hl7:Organization/hl7:code"/>
			<xsl:with-param name="oid" select="'2.16.840.1.113883.2.1.3.2.4.17.94'"/>
		</xsl:call-template>-->
	</xsl:template>
	<xsl:template name="checkExistsAndPopulated">
		<xsl:param name="loc"/>
		<xsl:param name="n1"/>
		<xsl:param name="n2"/>
		<xsl:if test="not($loc)">
			<tr>
				<td>
					<xsl:text>ERROR: </xsl:text>
					<xsl:call-template name="plotPath">
						<xsl:with-param name="forNode" select="$loc"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:text>Location not found: </xsl:text>
					<xsl:value-of select="$n2"/>
					<xsl:text> in </xsl:text>
					<xsl:value-of select="$n1"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:variable name="s" select="normalize-space(string($loc))"/>
		<xsl:if test="string-length($s) = 0">
			<tr>
				<td>
					<xsl:text>ERROR: </xsl:text>
					<xsl:call-template name="plotPath">
						<xsl:with-param name="forNode" select="$loc"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:value-of select="$n2"/>
					<xsl:text> in </xsl:text>
					<xsl:value-of select="$n1"/>
					<xsl:text> is empty</xsl:text>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template name="checkOID">
		<xsl:param name="loc"/>
		<xsl:param name="oid"/>
		<xsl:param name="oid2"/>
		<xsl:choose>
			<xsl:when test="not(string-length($oid2)=0)">
				<xsl:if test="not($loc/@root=$oid or $loc/@root=$oid2)">
					<tr>
						<td>
							<xsl:text>ERROR: </xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="$loc"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:text>Expected OID </xsl:text>
							<xsl:value-of select="$oid"/>
							<xsl:text>or</xsl:text>
							<xsl:value-of select="$oid2"/>
							<xsl:text> found </xsl:text>
							<xsl:value-of select="$loc/@root"/>
						</td>
					</tr>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($loc/@root=$oid)">
					<tr>
						<td>
							<xsl:text>ERROR: </xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="$loc"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:text>Expected OID </xsl:text>
							<xsl:value-of select="$oid"/>
							<xsl:text> found </xsl:text>
							<xsl:value-of select="$loc/@root"/>
						</td>
					</tr>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="checkCode">
		<xsl:param name="loc"/>
		<xsl:param name="oid"/>
		<xsl:if test="not($loc/@codeSystem=$oid)">
			<tr>
				<td>
					<xsl:text>ERROR: </xsl:text>
					<xsl:call-template name="plotPath">
						<xsl:with-param name="forNode" select="$loc"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:text>Expected OID </xsl:text>
					<xsl:value-of select="$oid"/>
					<xsl:text> found </xsl:text>
					<xsl:value-of select="$loc/@codeSystem"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template name="plotPath">
		<xsl:param name="forNode"/>
		<xsl:if test="name($forNode)">
			<xsl:call-template name="plotPath">
				<xsl:with-param name="forNode" select="$forNode/.."/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="not(name($forNode)='')">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="name($forNode)"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
