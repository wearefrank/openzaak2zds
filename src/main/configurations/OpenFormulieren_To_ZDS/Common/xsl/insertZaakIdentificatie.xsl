<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="zaakIdentificatie"/>

    <xsl:template match="/">
        <xsl:apply-templates select="*|@*"/>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="ZKN:identificatie">
        <xsl:copy>
            <xsl:value-of select="$zaakIdentificatie"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>