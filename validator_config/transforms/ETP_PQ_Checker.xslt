<?xml version="1.0" encoding="UTF-8"?>
<!--
		Physical Qauntities -Checker
	
		Version 1.0H, 4th April 2007
		Damian Murphy
	
		Output rewritten to HTML fragment for OMVT2. All of Ravi's original logic retained.

		Version: 1.0, 30 August 2005
		Ravi Natarajan

		1) Added xpath to the node of interest, code borrowed from blank attrbute checkerr xslt. 01/09/2005

		NHS Connecting For Health NPfIT Comms & Messaging Team
		Checking physical quantities and transforming to correct flavour when translation is not provided
		2) Amended to reflect altered dmdUOM structure which includes CDPREV 17/03/2009 MP.
	-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<h3>PQ Checker</h3>
		<xsl:variable name="pqElements" select="//*[@unit]"/>
		<xsl:variable name="dmdref" select="document('./dmdUOM.xml')"/>
		<xsl:choose>
			<xsl:when test="$pqElements">
				<table border="0">
					<xsl:for-each select="$pqElements">
						<xsl:if test="name() = 'quantity'">
							<xsl:variable name="v_translation" select="./child::*[name()='translation']"/>
							<xsl:variable name="v_translation_display_name" select="$v_translation/@displayName"/>
							<xsl:variable name="v_translation_code" select="$v_translation/@code"/>
							<xsl:variable name="v_translation_value" select="$v_translation/@value"/>
							<xsl:variable name="v_quantity_value" select="./@value"/>
							<xsl:variable name="v_quantity_unit" select="./@unit"/>
							<xsl:variable name="v_code_check" select="$dmdref//INFO[DESC=$v_translation_display_name] and document('dmdUOM.xml')//INFO[CD=$v_translation_code or CDPREV=$v_translation_code]"/>
							<xsl:if test="not($v_code_check) or not($v_quantity_value = $v_translation_value) or not($v_translation)">
								<tr>
									<td>
										<xsl:text>ERROR: </xsl:text>
										<xsl:call-template name="plotPath">
											<xsl:with-param name="forNode" select="."/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="not($v_translation)">
										<tr>
											<td>
												<xsl:text>No translation given</xsl:text>
											</td>
										</tr>
										<tr>
											<td>
												<code>
													<xsl:text>&lt;translation&gt;</xsl:text>
													<!-- Provide the alternate translation -->
													<xsl:text>&lt;</xsl:text>
													<xsl:value-of select="name()"/>
													<xsl:text> </xsl:text>
													<xsl:text>value="</xsl:text>
													<xsl:value-of select="$v_quantity_value"/>
													<xsl:text>"</xsl:text>
													<xsl:text> </xsl:text>
													<xsl:text>unit="1"</xsl:text>
													<xsl:text>></xsl:text>
													<xsl:text>&lt;</xsl:text>
													<xsl:text>translation</xsl:text>
													<xsl:text> </xsl:text>
													<xsl:text>value="</xsl:text>
													<xsl:value-of select="$v_quantity_value"/>
													<xsl:text>"</xsl:text>
													<xsl:text> </xsl:text>
													<xsl:text>codeSystem="2.16.840.1.113883.2.1.3.2.4.15"</xsl:text>
													<xsl:text> </xsl:text>
													<xsl:text>displayName="</xsl:text>
													<xsl:value-of select="$v_quantity_unit"/>
													<xsl:text>"</xsl:text>
													<xsl:choose>
														<xsl:when test="$dmdref//INFO[DESC=$v_quantity_unit]">
															<xsl:text> </xsl:text>
															<xsl:text>code="</xsl:text>
															<xsl:value-of select="$dmdref//INFO[DESC=$v_quantity_unit]/CD"/>
															<xsl:text>"</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text> </xsl:text>
															<xsl:text>code="DM+D code"</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:text>></xsl:text>
													<xsl:text>&lt;/translation</xsl:text>
													<xsl:text>></xsl:text>
													<xsl:text>&lt;/</xsl:text>
													<xsl:value-of select="name()"/>
													<xsl:text>></xsl:text>
													<xsl:text>&#x0D;</xsl:text>
													<xsl:text>&lt;/translation&gt;</xsl:text>
												</code>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="not($v_code_check)">
											<tr>
												<td>
													<xsl:text>Attributes code and displayName do not match DM+D</xsl:text>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="not($v_quantity_value = $v_translation_value)">
											<tr>
												<td>
													<xsl:text>Amounts in value and translation do not match</xsl:text>
												</td>
											</tr>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
				</table>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td>
						<xsl:text>ERROR: Expected PQ elements, found none</xsl:text>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="serialise">
		<xsl:text>&lt;</xsl:text>
		<xsl:value-of select="name()"/>
		<xsl:for-each select="@*">
			<xsl:text> </xsl:text>
			<xsl:value-of select="name()"/>
			<xsl:text>="</xsl:text>
			<xsl:value-of select="."/>
			<xsl:text>"</xsl:text>
		</xsl:for-each>
		<xsl:text>></xsl:text>
		<xsl:apply-templates select="node()" mode="serialise"/>
		<xsl:text>&lt;/</xsl:text>
		<xsl:value-of select="name()"/>
		<xsl:text>></xsl:text>
	</xsl:template>
	<xsl:template name="plotPath">
		<xsl:param name="forNode"/>
		<xsl:if test="name($forNode)">
			<xsl:call-template name="plotPath">
				<xsl:with-param name="forNode" select="$forNode/.."/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="not(name($forNode) = '')">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="name($forNode)"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
