<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<!--Author: Damian Murphy -->
	<!--Version: 3.0 -->
	<!--Date Created: 30th July 2007-->
	<!--Date Modified: 20th May 2010-->
	<!--Modified By: Meena Pillai -->
	<!--Purpose: To check that the Patient CMET mandatory elements and attributes are present according to the specification.-->
	<xsl:template match="/">
		<table>
			<tr>
				<th>Patient checker</th>
			</tr>
			<xsl:call-template name="checkPatientR2"/>
		</table>
	</xsl:template>
	<xsl:template name="checkPatientR2">
		<xsl:call-template name="checkOID">
			<xsl:with-param name="loc" select="//hl7:Patient/hl7:id"/>
			<xsl:with-param name="oid" select="'2.16.840.1.113883.2.1.4.1'"/>
		</xsl:call-template>
		<xsl:call-template name="checkOID">
			<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:playedProviderPatient/hl7:subjectOf/hl7:patientCareProvision/hl7:responsibleParty/hl7:healthCareProvider/hl7:id"/>
			<xsl:with-param name="oid" select="'1.2.826.0.1285.0.2.0.65'"/>
			<xsl:with-param name="oid2" select="'1.2.826.0.1285.0.1.10'"/>
		</xsl:call-template>
		<xsl:call-template name="checkCode">
			<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:playedProviderPatient/hl7:subjectOf/hl7:patientCareProvision/hl7:code"/>
			<xsl:with-param name="oid" select="'2.16.840.1.113883.2.1.3.2.4.17.37'"/>
		</xsl:call-template>
		<xsl:if test="//hl7:ParentPrescription">
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:addr"/>
				<xsl:with-param name="n1" select="'Patient address'"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:addr'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:name"/>
				<xsl:with-param name="n1" select="'Patient name'"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:patientPerson/hl7:name'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:name/hl7:prefix"/>
				<xsl:with-param name="n1" select="'Patient name Prefix'"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:patientPerson/hl7:name/hl7:prefix'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:name/hl7:given"/>
				<xsl:with-param name="n1" select="'Patient Given name '"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:patientPerson/hl7:name/hl7:given'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:name/hl7:family"/>
				<xsl:with-param name="n1" select="'Patient Family Name'"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:patientPerson/hl7:name/hl7:family'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:administrativeGenderCode/@code"/>
				<xsl:with-param name="n1" select="'Patient gender'"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:patientPerson/hl7:administrativeGenderCode'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:birthTime/@value"/>
				<xsl:with-param name="n1" select="'Patient birth time'"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:patientPerson/hl7:birthTime'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:playedProviderPatient/hl7:subjectOf/hl7:patientCareProvision/hl7:code/@code"/>
				<xsl:with-param name="n1" select="'Patient Care Provision Code'"/>
				<xsl:with-param name="n2" select="'hl7:patientPerson/hl7:playedProviderPatient/hl7:subjectOf/hl7:patientCareProvision/hl7:code/@code'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:playedProviderPatient/hl7:subjectOf/hl7:patientCareProvision/hl7:responsibleParty/hl7:healthCareProvider/hl7:id/@extension"/>
				<xsl:with-param name="n1" select="'Patient HealthCare Provider Id'"/>
				<xsl:with-param name="n2" select="'//hl7:Patient/hl7:patientPerson/hl7:playedProviderPatient/hl7:subjectOf/hl7:patientCareProvision/hl7:responsibleParty/hl7:healthCareProvider/hl7:id/@extension'"/>
			</xsl:call-template>
		</xsl:if>
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
			<xsl:if test="not($loc/@root=$oid) and not($loc/@root=$oid2)">
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
						<xsl:text> </xsl:text>
						<xsl:text>or</xsl:text>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$oid2"/>
						<xsl:text> </xsl:text>
						<xsl:text> found </xsl:text>
						<xsl:value-of select="$loc/@root"/>
					</td>
				</tr>
			</xsl:if></xsl:when>
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
