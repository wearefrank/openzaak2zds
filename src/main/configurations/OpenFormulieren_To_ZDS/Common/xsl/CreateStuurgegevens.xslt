<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="BerichtCode"/>
    <xsl:param name="ZenderOrganisatie"/>
    <xsl:param name="ZenderApplicatie"/>
    <xsl:param name="OntvangerOrganisatie"/>
    <xsl:param name="OntvangerApplicatie"/>
    <xsl:param name="Referentienummer"/>
    <xsl:param name="EntiteitType"/>
    <xsl:param name="Functie"/>

    <xsl:template match="/">
        <ZKN:stuurgegevens>
            <StUF:berichtcode><xsl:value-of select="$BerichtCode"/></StUF:berichtcode>
            <StUF:zender>
                <StUF:organisatie><xsl:value-of select="$ZenderOrganisatie"/></StUF:organisatie>
                <StUF:applicatie><xsl:value-of select="$ZenderApplicatie"/></StUF:applicatie>
            </StUF:zender>
            <StUF:ontvanger>
                <StUF:organisatie><xsl:value-of select="$OntvangerOrganisatie"/></StUF:organisatie>
                <StUF:applicatie><xsl:value-of select="$OntvangerApplicatie"/></StUF:applicatie>
            </StUF:ontvanger>
            <StUF:referentienummer><xsl:value-of select="$Referentienummer"/></StUF:referentienummer>
            <StUF:tijdstipBericht><xsl:value-of select="format-dateTime(current-dateTime(), '[Y0001][M01][D01][H01][m01][s01]')"/></StUF:tijdstipBericht>
            <xsl:choose>
                <xsl:when test="$EntiteitType != ''">
                    <StUF:entiteittype><xsl:value-of select="$EntiteitType"/></StUF:entiteittype>
                </xsl:when>
                <xsl:otherwise>
                    <StUF:functie><xsl:value-of select="$Functie"/></StUF:functie>
                </xsl:otherwise>
            </xsl:choose>
        </ZKN:stuurgegevens>
    </xsl:template>
</xsl:stylesheet>
