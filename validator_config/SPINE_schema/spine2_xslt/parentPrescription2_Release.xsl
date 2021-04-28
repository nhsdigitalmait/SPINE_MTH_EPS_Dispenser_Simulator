<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3"
    version="1.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:param name="lowerAgeLimit">00000000</xsl:param>
    <xsl:param name="higherAgeLimit">00000000</xsl:param>
    <xsl:param name="priorPreviousIssueDate">false</xsl:param>

    <xsl:param name="prescriptionStatus">0000</xsl:param>
    <xsl:param name="prescriptionStatusDisplayName">None</xsl:param>

    <xsl:param name="prescriptionCurrentInstance">Not Set</xsl:param>
    <xsl:param name="prescriptionMaxRepeats">Not Set</xsl:param>

    <xsl:param name="lineItem1Status">0</xsl:param>
    <xsl:param name="lineItem1StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem2Status">0</xsl:param>
    <xsl:param name="lineItem2StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem3Status">0</xsl:param>
    <xsl:param name="lineItem3StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem4Status">0</xsl:param>
    <xsl:param name="lineItem4StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem5Status">0</xsl:param>
    <xsl:param name="lineItem5StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem6Status">0</xsl:param>
    <xsl:param name="lineItem6StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem7Status">0</xsl:param>
    <xsl:param name="lineItem7StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem8Status">0</xsl:param>
    <xsl:param name="lineItem8StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem9Status">0</xsl:param>
    <xsl:param name="lineItem9StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem10Status">0</xsl:param>
    <xsl:param name="lineItem10StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem11Status">0</xsl:param>
    <xsl:param name="lineItem11StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem12Status">0</xsl:param>
    <xsl:param name="lineItem12StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem13Status">0</xsl:param>
    <xsl:param name="lineItem13StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem14Status">0</xsl:param>
    <xsl:param name="lineItem14StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem15Status">0</xsl:param>
    <xsl:param name="lineItem15StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem16Status">0</xsl:param>
    <xsl:param name="lineItem16StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem17Status">0</xsl:param>
    <xsl:param name="lineItem17StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem18Status">0</xsl:param>
    <xsl:param name="lineItem18StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem19Status">0</xsl:param>
    <xsl:param name="lineItem19StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem20Status">0</xsl:param>
    <xsl:param name="lineItem20StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem21Status">0</xsl:param>
    <xsl:param name="lineItem21StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem22Status">0</xsl:param>
    <xsl:param name="lineItem22StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem23Status">0</xsl:param>
    <xsl:param name="lineItem23StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem24Status">0</xsl:param>
    <xsl:param name="lineItem24StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem25Status">0</xsl:param>
    <xsl:param name="lineItem25StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem26Status">0</xsl:param>
    <xsl:param name="lineItem26StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem27Status">0</xsl:param>
    <xsl:param name="lineItem27StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem28Status">0</xsl:param>
    <xsl:param name="lineItem28StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem29Status">0</xsl:param>
    <xsl:param name="lineItem29StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem30Status">0</xsl:param>
    <xsl:param name="lineItem30StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem31Status">0</xsl:param>
    <xsl:param name="lineItem31StatusDisplayName">None</xsl:param>
    <xsl:param name="lineItem32Status">0</xsl:param>
    <xsl:param name="lineItem32StatusDisplayName">None</xsl:param>

    <xsl:param name="lineItem1CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem2CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem3CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem4CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem5CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem6CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem7CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem8CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem9CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem10CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem11CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem12CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem13CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem14CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem15CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem16CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem17CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem18CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem19CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem20CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem21CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem22CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem23CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem24CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem25CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem26CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem27CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem28CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem29CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem30CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem31CurrentInstance">Not Set</xsl:param>
    <xsl:param name="lineItem32CurrentInstance">Not Set</xsl:param>

    <xsl:param name="lineItem1MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem2MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem3MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem4MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem5MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem6MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem7MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem8MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem9MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem10MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem11MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem12MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem13MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem14MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem15MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem16MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem17MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem18MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem19MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem20MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem21MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem22MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem23MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem24MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem25MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem26MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem27MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem28MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem29MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem30MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem31MaxRepeats">Not Set</xsl:param>
    <xsl:param name="lineItem32MaxRepeats">Not Set</xsl:param>


    <xsl:template match="/">
        <ParentPrescription classCode="INFO" moodCode="EVN" xmlns="urn:hl7-org:v3">
            <xsl:copy-of select="/*/hl7:id"/>
            <xsl:copy-of select="/*/hl7:code"/>
            <xsl:copy-of select="/*/hl7:effectiveTime"/>
            <typeId root="2.16.840.1.113883.2.1.3.2.4.18.7" extension="PORX_MT122003UK32" />
            <xsl:copy-of select="/*/hl7:recordTarget"/>
            <pertinentInformation1 typeCode="PERT" contextConductionInd="true">
                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:templateId"/>
                <pertinentPrescription classCode="SBADM" moodCode="RQO">
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:id"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:code"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:effectiveTime"/>
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
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:performer"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:author"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:legalAuthenticator"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:responsibleParty"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:component1"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation7"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation5"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation6"/>
                    <pertinentInformation10 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                        <seperatableInd updateMode="added" value="false"/>
                        <pertinentPrescriptionStatus type="Observation" classCode="OBS" moodCode="EVN">
                            <code code="PS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                            <value>
                                <xsl:attribute name="code">
                                    <xsl:value-of select="$prescriptionStatus"/>
                                </xsl:attribute>
                               <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.16.35</xsl:attribute>
                               <xsl:attribute name="displayName">
                                    <xsl:value-of select="$prescriptionStatusDisplayName"/>
                                </xsl:attribute>
                            </value>
                        </pertinentPrescriptionStatus>
                    </pertinentInformation10>
                    <pertinentInformation9 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
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
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation1"/>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
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
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem1Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem1StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[1]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem2CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem2MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem2Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem2StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[2]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
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
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem3Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem3StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[3]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
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
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem4Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem4StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[4]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem5CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem5MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem5Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem5StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[5]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem6CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem6MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem6Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem6StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[6]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem7CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem7MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem7Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem7StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[7]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem8CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem8MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem8Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem8StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[8]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem9CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem9MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem9Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem9StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[9]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem10CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem10MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem10Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem10StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[10]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem11CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem11MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem11Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem11StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[11]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem12CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem12MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem12Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem12StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[12]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem13CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem13MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem13Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem13StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[13]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem14CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem14MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem14Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem14StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[14]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem15CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem15MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem15Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem15StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[15]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem16CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem16MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem16Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem16StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[16]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem17CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem17MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem17Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem17StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[17]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem18CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem18MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem18Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem18StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[18]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem19CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem19MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem19Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem19StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[19]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem20CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem20MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem20Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem20StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[20]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem21CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem21MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem21Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem21StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[21]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem22CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem22MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem22Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem22StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[22]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem23CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem23MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem23Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem23StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[23]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem24CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem24MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem24Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem24StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[24]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem25CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem25MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem25Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem25StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[25]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem26CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem26MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem26Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem26StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[26]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem27CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem27MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem27Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem27StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[27]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem28CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem28MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem28Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem28StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[28]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem29CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem29MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem29Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem29StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[29]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem30CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem30MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem30Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem30StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[30]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem31CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem31MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem31Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem31StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[31]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>
                    <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]">
                        <pertinentInformation2  contextConductionInd="true" inversionInd="false" negationInd="false" typeCode="PERT">
                            <seperatableInd value="true"/>
                            <templateId extension="CSAB_RM-NPfITUK10.sourceOf2" root="2.16.840.1.113883.2.1.3.2.4.18.2"/>
                            <pertinentLineItem classCode="SBADM" moodCode="RQO">
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:id"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:code"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:effectiveTime"/>
                                <xsl:if test="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:repeatNumber">
                                    <repeatNumber>
                                        <low>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem32CurrentInstance"/>
                                            </xsl:attribute>
                                        </low>
                                        <high>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="$lineItem32MaxRepeats"/>
                                            </xsl:attribute>
                                        </high>
                                    </repeatNumber>
                                </xsl:if>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:doseQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:rateQuantity"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:product"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:component"/>
                                <pertinentInformation4 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                                    <seperatableInd value="false"/>
                                    <pertinentItemStatus type="Observation" classCode="OBS" moodCode="EVN">
                                        <code code="IS" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                        <value>
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="$lineItem32Status"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="codeSystem">2.16.840.1.113883.2.1.3.2.4.17.23</xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="$lineItem32StatusDisplayName"/>
                                            </xsl:attribute>
                                        </value>
                                    </pertinentItemStatus>
                                </pertinentInformation4>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:pertinentInformation1"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:pertinentInformation3"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:pertinentInformation2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:inFulfillmentOf2"/>
                                <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation2[32]/hl7:pertinentLineItem/hl7:inFulfillmentOf1"/>
                            </pertinentLineItem>
                        </pertinentInformation2>
                    </xsl:if>


                    <pertinentInformation11 type="ActRelationship" typeCode="PERT" contextConductionInd="true">
                        <seperatableInd value="true"/>
                        <pertinentHighPermanentExemptionInfo classCode="OBS" moodCode="EVN">
                            <code code="0004" codeSystem="2.16.840.1.113883.2.1.3.2.4.16.33" displayName="is 60 years of age or over"/>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="$higherAgeLimit"/>
                                </xsl:attribute>
                            </value>
                        </pertinentHighPermanentExemptionInfo>
                    </pertinentInformation11>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation8"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation3"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:pertinentInformation4"/>
                    <xsl:copy-of select="/*/hl7:pertinentInformation1/hl7:pertinentPrescription/hl7:inFulfillmentOf"/>
                    <xsl:if test="not($priorPreviousIssueDate='false')">
                        <predecessor type="ActRelationship" typeCode="PREV">
                            <seperatableInd value="false"/>
                            <priorPreviousIssueDate type="Observation" classCode="OBS" moodCode="EVN">
                                <code code="PRDT" codeSystem="2.16.840.1.113883.2.1.3.2.4.17.30"/>
                                <value>
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="$priorPreviousIssueDate"/>
                                    </xsl:attribute>
                                </value>
                            </priorPreviousIssueDate>
                        </predecessor>
                    </xsl:if>
                </pertinentPrescription>
            </pertinentInformation1>
        	<xsl:copy-of select="/*/hl7:pertinentInformation2"/>
        </ParentPrescription>
    </xsl:template>

</xsl:stylesheet>

