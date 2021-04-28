<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<table>
			<tr>
				<th>Patient checker</th>
			</tr>
			<xsl:call-template name="checkPatientR1"/>
		</table>
	</xsl:template>
	<xsl:template name="checkPatientR1">
		<xsl:call-template name="checkOID">
			<xsl:with-param name="loc" select="//hl7:Patient/hl7:id"/>
			<xsl:with-param name="oid" select="'2.16.840.1.113883.2.1.4.1'"/>
		</xsl:call-template>
		<xsl:call-template name="checkOID">
			<xsl:with-param name="loc" select="//hl7:Patient/hl7:sourceOf/hl7:GpRegisteredWith/hl7:id"/>
			<xsl:with-param name="oid" select="'2.16.840.1.113883.2.1.3.2.4.11'"/>
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
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:administrativeGenderCode/@code"/>
				<xsl:with-param name="n1" select="'Patient gender'"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:patientPerson/hl7:administrativeGenderCode'"/>
			</xsl:call-template>
			<xsl:call-template name="checkExistsAndPopulated">
				<xsl:with-param name="loc" select="//hl7:Patient/hl7:patientPerson/hl7:birthTime/@value"/>
				<xsl:with-param name="n1" select="'Patient birth time'"/>
				<xsl:with-param name="n2" select="'hl7:Patient/hl7:patientPerson/hl7:birthTime'"/>
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
