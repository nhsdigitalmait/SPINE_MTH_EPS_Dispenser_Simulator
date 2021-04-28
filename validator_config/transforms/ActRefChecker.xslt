<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="actrefs" select="//hl7:actRef"/>
		<xsl:variable name="referrals2.3" select="//*[(name() = 'component2')]/hl7:referralComponent/*/hl7:id[@root]"/>
		<xsl:variable name="referrals3.1X" select="//*[(name() = 'component2')]/*/hl7:id[@root]"/>
		<xsl:variable name="referrals" select="$referrals2.3 | $referrals3.1X"/>
		<xsl:element name="Parser">
			<xsl:attribute name="Details">Actref Checker</xsl:attribute>
			<xsl:choose>
				<xsl:when test="not($actrefs)">
					<xsl:element name="Reason">
						<xsl:attribute name="Type">Info</xsl:attribute>
						<xsl:element name="Description">
							<xsl:text>Message contains no identifiable actRef elements</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="$actrefs">
						<xsl:element name="Reason">
							<xsl:variable name="thisId" select="./hl7:id/@root"/>
							<xsl:variable name="pointsto" select="//*[not(name() = 'actRef')]/hl7:id[@root = $thisId]/.."/>
							<xsl:variable name="v_classCode_Check" select="./@classCode = $pointsto/@classCode"/>
							<xsl:variable name="v_moodCode_Check" select="./@moodCode = $pointsto/@moodCode"/>
							<xsl:variable name="v_check" select="not($pointsto) or not($v_classCode_Check) or not($v_moodCode_Check)"/>
							<xsl:attribute name="Type"><xsl:choose><xsl:when test="$v_check">Warning</xsl:when><xsl:otherwise>Info</xsl:otherwise></xsl:choose></xsl:attribute>
							<xsl:element name="ID">
								<xsl:value-of select="$thisId"/>
							</xsl:element>
							<xsl:choose>
								<xsl:when test="not($pointsto)">
									<xsl:element name="Information">
										<xsl:text>ID does not point to a statement in the current message instance. This is not an error ONLY if the referenced
											statement is known to exist in some other globally-available repository.</xsl:text>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="classCodeCheck">
										<xsl:variable name="targetclasscode" select="$pointsto/@classCode"/>
										<xsl:choose>
											<xsl:when test="./@classCode = $targetclasscode">
												<xsl:text>OK:</xsl:text>
												<xsl:value-of select="$targetclasscode"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>actRef classCode: </xsl:text>
												<xsl:value-of select="./@classCode"/>
												<xsl:text>, but target Act classCode: </xsl:text>
												<xsl:value-of select="$targetclasscode"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
									<xsl:element name="moodCodeCheck">
										<xsl:variable name="targetmoodcode" select="$pointsto/@moodCode"/>
										<xsl:choose>
											<xsl:when test="./@moodCode = $targetmoodcode">
												<xsl:text>OK:</xsl:text>
												<xsl:value-of select="$targetmoodcode"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>actRef moodCode: </xsl:text>
												<xsl:value-of select="./@moodCode"/>
												<xsl:text>, but target Act moodCode: </xsl:text>
												<xsl:value-of select="$targetmoodcode"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="$referrals">
						<xsl:variable name="thisId" select="./@root"/>
						<xsl:variable name="pointedby" select="//*[(name() = 'actRef')]/hl7:id[@root = $thisId]"/>
						<xsl:choose>
							<xsl:when test="not($pointedby)">
								<xsl:element name="Reason">
									<xsl:attribute name="Type">Warning</xsl:attribute>
									<xsl:element name="ID">
										<xsl:value-of select="$thisId"/>
									</xsl:element>
									<xsl:element name="Information">
										<xsl:text>Orphaned referral component not referenced by any actRefs.</xsl:text>
									</xsl:element>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
