<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3">
	<xsl:template match="/">
		<RESULT>
			<TITLE>ETP Repeat Prescription and Dispense check schematron</TITLE>
			<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation5/hl7:pertinentPrescriptionTreatmentType/hl7:value" mode="M2"/>
			<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:component/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2/hl7:pertinentLineItem[hl7:repeatNumber]/hl7:repeatNumber" mode="M3"/>
			<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:component/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2/hl7:pertinentLineItem[hl7:repeatNumber]/hl7:repeatNumber" mode="M4"/>
			<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:pertinentInformation1/hl7:pertinentPrescription[hl7:component1/hl7:daysSupply or hl7:pertinentDaysSupply]" mode="M5"/>
		</RESULT>
	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation5/hl7:pertinentPrescriptionTreatmentType/hl7:value" priority="4000" mode="M2">
		<xsl:variable name="contents">
			<xsl:if test="@code='0002' and not(/*[1]/hl7:ControlActEvent/hl7:subject//hl7:component/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:repeatNumber | /*[1]/hl7:ControlActEvent/hl7:subject//hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:repeatNumber )">
				<ASSERT>Missing prescription repeat Number for repeat prescription</ASSERT>
			</xsl:if>
			<xsl:if test="@code='0003' and not(/*[1]/hl7:ControlActEvent/hl7:subject//hl7:component/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:repeatNumber | /*[1]/hl7:ControlActEvent/hl7:subject//hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:repeatNumber )">
				<ASSERT>Missing prescription repeat Number for repeat dispensing</ASSERT>
			</xsl:if>
		</xsl:variable>
		<xsl:if test="normalize-space($contents)">
			<PATTERN name="Repeat Dispense and Prescribe has repeatNumber check">
				<xsl:copy-of select="$contents"/>
			</PATTERN>
		</xsl:if>
		<xsl:apply-templates mode="M2"/>
	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:component/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2/hl7:pertinentLineItem[hl7:repeatNumber]/hl7:repeatNumber" priority="4000" mode="M3">
		<xsl:variable name="contents">
			<xsl:for-each select="hl7:low">
				<xsl:if test="@value!= /*[1]/hl7:ControlActEvent/hl7:subject//hl7:component/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2/hl7:pertinentLineItem/hl7:repeatNumber/hl7:low/@value">
					<ASSERT> prescription repeat Number Low does not match pertinentLineItem repeatNumber Low</ASSERT>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="normalize-space($contents)">
			<PATTERN name="Repeat Dispense or Prescribe High Repeat Number for Prescription and Items equal checks">
				<xsl:copy-of select="$contents"/>
			</PATTERN>
		</xsl:if>
		<xsl:apply-templates mode="M3"/>
	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:component/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2/hl7:pertinentLineItem[hl7:repeatNumber]/hl7:repeatNumber" priority="4000" mode="M4">
		<xsl:variable name="contents">
			<xsl:for-each select="hl7:high">
				<xsl:if test="@value!= /*[1]/hl7:ControlActEvent/hl7:subject//hl7:component/hl7:ParentPrescription/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2/hl7:pertinentLineItem/hl7:repeatNumber/hl7:high/@value">
					<ASSERT> prescription repeat Number High does not match pertinentLineItem repeatNumber High</ASSERT>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="normalize-space($contents)">
			<PATTERN name="Repeat Dispense or Prescribe Low Repeat Number for Prescription and Items equal checks">
				<xsl:copy-of select="$contents"/>
			</PATTERN>
		</xsl:if>
		<xsl:apply-templates mode="M4"/>
	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//hl7:pertinentInformation1/hl7:pertinentPrescription[hl7:component1/hl7:daysSupply or hl7:pertinentDaysSupply]" priority="4000" mode="M5">
		<xsl:variable name="contents">
			<xsl:choose>
				<xsl:when test="hl7:component1/hl7:daysSupply/hl7:effectiveTime or hl7:pertinentDaysSupply/hl7:effectiveTime"/>
				<xsl:otherwise>
					<ASSERT>Dispensing effectiveTime element is missing.</ASSERT>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="hl7:component1/hl7:daysSupply/hl7:expectedUseTime or hl7:pertinentDaysSupply/hl7:expectedUseTime"/>
				<xsl:otherwise>
					<ASSERT>Dispensing expectedUseTime element is missing.</ASSERT>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="normalize-space($contents)">
			<PATTERN name="Repeat DaySupply Element and Attribute checks">
				<xsl:copy-of select="$contents"/>
			</PATTERN>
		</xsl:if>
		<xsl:apply-templates mode="M5"/>
	</xsl:template>
	<xsl:template match="text()" priority="-1" mode="M5"/>
	<xsl:template match="text()" priority="-1"/>
</xsl:stylesheet>