<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/">
		<xsl:apply-templates select="@*|node()"/>
	</xsl:template>

    <xsl:template match="*|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="comment()" />
</xsl:stylesheet>