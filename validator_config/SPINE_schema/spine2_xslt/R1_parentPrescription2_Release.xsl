<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3"
    version="1.0">
    <xsl:output method="xml" indent="yes" />

    <xsl:param name="lowerAgeLimit"/>
    <xsl:param name="higherAgeLimit"/>
    <xsl:param name="priorPreviousIssueDate">false</xsl:param>

    <xsl:param name="prescriptionStatus"/>
    <xsl:param name="prescriptionStatusDisplayName"/>

    <xsl:param name="prescriptionCurrentInstance"/>
    <xsl:param name="prescriptionMaxRepeats"/>

    <xsl:param name="lineItem1Status"/>
    <xsl:param name="lineItem1StatusDisplayName"/>
    <xsl:param name="lineItem2Status"/>
    <xsl:param name="lineItem2StatusDisplayName"/>
    <xsl:param name="lineItem3Status"/>
    <xsl:param name="lineItem3StatusDisplayName"/>
    <xsl:param name="lineItem4Status"/>
    <xsl:param name="lineItem4StatusDisplayName"/>

    <xsl:param name="lineItem1CurrentInstance"/>
    <xsl:param name="lineItem2CurrentInstance"/>
    <xsl:param name="lineItem3CurrentInstance"/>
    <xsl:param name="lineItem4CurrentInstance"/>

    <xsl:param name="lineItem1MaxRepeats"/>
    <xsl:param name="lineItem2MaxRepeats"/>
    <xsl:param name="lineItem3MaxRepeats"/>
    <xsl:param name="lineItem4MaxRepeats"/>

    <xsl:template match="/">
        <pertinentInformation1 typeCode="PERT" contextConductionInd="true">
            <templateId root="2.16.840.1.113883.2.1.3.2.4.18.2" extension="CSAB_RM-NPfITUK10.pertinentInformation"/>
            <pertinentPrescription classCode="SBADM" moodCode="RQO">
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:id"/>
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:code"/>
                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:repeatNumber">
                    <repeatNumber>
                        <low>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$prescriptionCurrentInstance"/>
                            </xsl:attribute>
                        </low>
                        <high>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$prescriptionMaxRepeats"/>
                            </xsl:attribute>
                        </high>
                    </repeatNumber>
                </xsl:if>
                <xsl:copy-of select="/*/hl7:recordTarget"/>
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:author"/>
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:responsibleParty"/>
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation5"/>
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation6"/>
                <pertinentInformation8 typeCode="PERT" inversionInd="false" contextConductionInd="true" negationInd="false">
                    <seperatableInd value="true"/>
                    <pertinentHighPermanentExemptionInfo classCode="OBS" moodCode="EVN">
                        <code code="0004" codeSystem="2.16.840.1.113883.2.1.3.2.4.16.33" displayName="is 60 years of age or over"/>
                        <value>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$higherAgeLimit"/>
                            </xsl:attribute>
                        </value>
                    </pertinentHighPermanentExemptionInfo>
                </pertinentInformation8>
                <pertinentInformation9 typeCode="PERT" inversionInd="false" contextConductionInd="true" negationInd="false">
                    <seperatableInd value="true"/>
                    <pertinentLowPermanentExemptionInfo classCode="OBS" moodCode="EVN">
                        <code code="0002" codeSystem="2.16.840.1.113883.2.1.3.2.4.16.33" displayName="is under 16 years of age"/>
                        <value>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$lowerAgeLimit"/>
                            </xsl:attribute>
                        </value>
                    </pertinentLowPermanentExemptionInfo>
                </pertinentInformation9>
                <pertinentInformation10 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                    <seperatableInd updateMode="added" value="false"/>
                    <pertinentPrescriptionStatus type="Observation" classCode="OBS" moodCode="EVN">
                        <code code="PS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                        <value codeSystem="2.16.840.1.113883.2.1.3.2.4.16.35">
                            <xsl:attribute name="code">
                                <xsl:value-of select="$prescriptionStatus"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="$prescriptionStatusDisplayName"/>
                            </xsl:attribute>
                        </value>
                    </pertinentPrescriptionStatus>
                </pertinentInformation10>
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation1"/>
                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]">
                    <pertinentInformation2 contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                        <seperatableInd value="true"/>
                        <templateId root="2.16.840.1.113883.2.1.3.2.4.18.2" extension="CSAB_RM-NPfITUK10.sourceOf2"/>
                        <pertinentLineItem classCode="SBADM" moodCode="RQO">
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:id"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:code"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                            <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:repeatNumber">
                                <repeatNumber>
                                    <low>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="$lineItem1CurrentInstance"/>
                                        </xsl:attribute>
                                    </low>
                                    <high>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="$lineItem1MaxRepeats"/>
                                        </xsl:attribute>
                                    </high>
                                </repeatNumber>
                            </xsl:if>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:product"/>
                            <pertinentInformation5 typeCode="PERT" inversionInd="false" contextConductionInd="true" negationInd="false">
                                <seperatableInd value="true"/>
                                <pertinentItemStatus classCode="OBS" moodCode="EVN">
                                    <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                    <value codeSystem="2.16.840.1.113883.2.1.3.2.4.17.23">
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="$lineItem1StatusDisplayName"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="$lineItem1Status"/>
                                        </xsl:attribute>
                                    </value>
                                </pertinentItemStatus>
                            </pertinentInformation5>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:pertinentInformation4"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:inFulfillmentOf"/>
                        </pertinentLineItem>
                    </pertinentInformation2>
                </xsl:if>
                <!-- LINE ITEM 2 -->
                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]">
                    <pertinentInformation2 contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                        <seperatableInd value="true"/>
                        <templateId root="2.16.840.1.113883.2.1.3.2.4.18.2" extension="CSAB_RM-NPfITUK10.sourceOf2"/>
                        <pertinentLineItem classCode="SBADM" moodCode="RQO">
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:id"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:code"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                            <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:repeatNumber">
                                <repeatNumber>
                                    <low>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="$lineItem1CurrentInstance"/>
                                        </xsl:attribute>
                                    </low>
                                    <high>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="$lineItem1MaxRepeats"/>
                                        </xsl:attribute>
                                    </high>
                                </repeatNumber>
                            </xsl:if>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:product"/>
                            <pertinentInformation5 type="ActRelationship" typeCode="PERT" contextConductionInd="true" inversionInd="false" negationInd="false">
                                <seperatableInd value="false"/>
                                <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                    <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                    <value codeSystem="2.16.840.1.113883.2.1.3.2.4.17.23">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="$lineItem2Status"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="$lineItem2StatusDisplayName"/>
                                        </xsl:attribute>
                                    </value>
                                </pertinentItemStatus>
                            </pertinentInformation5>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:pertinentInformation4"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:inFulfillmentOf"/>
                        </pertinentLineItem>
                    </pertinentInformation2>
                </xsl:if>
                <!-- LINE ITEM 3 -->
                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]">
                    <pertinentInformation2 contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                        <seperatableInd value="true"/>
                        <templateId root="2.16.840.1.113883.2.1.3.2.4.18.2" extension="CSAB_RM-NPfITUK10.sourceOf2"/>
                        <pertinentLineItem classCode="SBADM" moodCode="RQO">
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:id"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:code"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                            <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:repeatNumber">
                                <repeatNumber>
                                    <low>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="$lineItem3CurrentInstance"/>
                                        </xsl:attribute>
                                    </low>
                                    <high>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="$lineItem3MaxRepeats"/>
                                        </xsl:attribute>
                                    </high>
                                </repeatNumber>
                            </xsl:if>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:product"/>
                            <pertinentInformation5 type="ActRelationship" typeCode="PERT" contextConductionInd="true" inversionInd="false" negationInd="false">
                                <seperatableInd value="false"/>
                                <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                    <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                    <value codeSystem="2.16.840.1.113883.2.1.3.2.4.17.23">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="$lineItem3Status"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="$lineItem3StatusDisplayName"/>
                                        </xsl:attribute>
                                    </value>
                                </pertinentItemStatus>
                            </pertinentInformation5>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:pertinentInformation4"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:inFulfillmentOf"/>
                        </pertinentLineItem>
                    </pertinentInformation2>
                </xsl:if>
                <!-- LINE ITEM 4 -->
                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]">
                    <pertinentInformation2 contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                        <seperatableInd value="true"/>
                        <templateId root="2.16.840.1.113883.2.1.3.2.4.18.2" extension="CSAB_RM-NPfITUK10.sourceOf2"/>
                        <pertinentLineItem classCode="SBADM" moodCode="RQO">
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:id"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:code"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                            <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:repeatNumber">
                                <repeatNumber>
                                    <low>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="$lineItem4CurrentInstance"/>
                                        </xsl:attribute>
                                    </low>
                                    <high>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="$lineItem4MaxRepeats"/>
                                        </xsl:attribute>
                                    </high>
                                </repeatNumber>
                            </xsl:if>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:product"/>
                            <pertinentInformation5 type="ActRelationship" typeCode="PERT" contextConductionInd="true" inversionInd="false" negationInd="false">
                                <seperatableInd value="false"/>
                                <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                    <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                    <value codeSystem="2.16.840.1.113883.2.1.3.2.4.17.23">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="$lineItem4Status"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="$lineItem4StatusDisplayName"/>
                                        </xsl:attribute>
                                    </value>
                                </pertinentItemStatus>
                            </pertinentInformation5>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:pertinentInformation4"/>
                            <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:inFulfillmentOf"/>
                        </pertinentLineItem>
                    </pertinentInformation2>
                </xsl:if>
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation4"/>
            </pertinentPrescription>
        </pertinentInformation1>
    </xsl:template>

</xsl:stylesheet>

