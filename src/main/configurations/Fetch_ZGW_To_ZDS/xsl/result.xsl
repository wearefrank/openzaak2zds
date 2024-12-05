<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.egem.nl/StUF/sector/zkn/0310"
                xmlns:StUF="http://www.egem.nl/StUF/StUF0301"
                xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:param name="storeRollenJson" />
  <xsl:param name="storeZaakTypeResponse" />
  <xsl:param name="storeStatusResponse" />
  <xsl:param name="storeResultaat" />
  <xsl:param name="uuid" />
  <xsl:param name="zkt_code" />
  <xsl:template match="/">
    <zakLk01>
      <stuurgegevens>
        <StUF:berichtcode>Lk01</StUF:berichtcode>
        <StUF:zender>
          <StUF:organisatie>Roxit</StUF:organisatie>
          <StUF:applicatie>INPROCES</StUF:applicatie>
        </StUF:zender>
        <StUF:ontvanger>
          <StUF:organisatie>0080</StUF:organisatie>
          <StUF:applicatie>GWS4all</StUF:applicatie>
        </StUF:ontvanger>
        <StUF:referentienummer><xsl:value-of select="$uuid" /></StUF:referentienummer>
        <StUF:tijdstipBericht>
          <xsl:value-of
            select="format-dateTime(current-dateTime(), '[Y0001][M01][D01][h01][m01][s01][f001]')" />
        </StUF:tijdstipBericht>
        <StUF:entiteittype>ZAK</StUF:entiteittype>
      </stuurgegevens>
      <parameters>
        <StUF:mutatiesoort>T</StUF:mutatiesoort>
        <StUF:indicatorOvername>V</StUF:indicatorOvername>
      </parameters>
      <object StUF:entiteittype="ZAK" StUF:verwerkingssoort="T">
        <xsl:attribute name="StUF:sleutelVerzendend">
          <xsl:value-of select="root/identificatie" />
        </xsl:attribute>
        <identificatie>
          <xsl:value-of select="root/identificatie" />
        </identificatie>
        <omschrijving>
          <xsl:value-of select="root/omschrijving" />
        </omschrijving>
        <toelichting>
          <xsl:value-of select="root/toelichting" />
        </toelichting>
        <xsl:if test="exists($storeResultaat/root/toelichting)">
          <resultaat>
            <omschrijving>
              <xsl:value-of select="$storeResultaat/root/toelichting" />
            </omschrijving>
          </resultaat>
        </xsl:if>
        <startdatum>
          <xsl:value-of select="format-date(root/startdatum,'[Y0001][M01][D01]')" />
        </startdatum>
        <xsl:if test="string-length(root/einddatum) &gt; 0">
          <einddatum>
            <xsl:value-of select="format-date(root/einddatum,'[Y0001][M01][D01]')" />
          </einddatum>
        </xsl:if>
        <xsl:if test="string-length(root/einddatumGepland) &gt; 0">
          <einddatumGepland>
            <xsl:value-of select="format-date(root/einddatumGepland,'[Y0001][M01][D01]')" />
          </einddatumGepland>
        </xsl:if>
        <isVan xsi:nil="true" StUF:noValue="waardeOnbekend" StUF:entiteittype="ZAKZKT"
               StUF:verwerkingssoort="T" />
        <heeftAlsInitiator StUF:entiteittype="ZAKBTRINI" StUF:verwerkingssoort="T">
          <gerelateerde>
            <natuurlijkPersoon StUF:entiteittype="NPS" StUF:verwerkingssoort="I">
              <BG:inp.bsn>
                <xsl:value-of select="$storeRollenJson/root/results/betrokkeneIdentificatie/inpBsn" />
              </BG:inp.bsn>
              <BG:authentiek StUF:metagegeven="true">J</BG:authentiek>
              <BG:geslachtsnaam>
                <xsl:value-of
                  select="$storeRollenJson/root/results/betrokkeneIdentificatie/geslachtsnaam" />
              </BG:geslachtsnaam>
              <BG:voorvoegselGeslachtsnaam>
                <xsl:value-of
                  select="$storeRollenJson/root/results/betrokkeneIdentificatie/voorvoegselGeslachtsnaam" />
              </BG:voorvoegselGeslachtsnaam>
              <BG:voorletters>
                <xsl:value-of
                  select="$storeRollenJson/root/results/betrokkeneIdentificatie/voorletters" />
              </BG:voorletters>
              <BG:voornamen>
                <xsl:value-of
                  select="$storeRollenJson/root/results/betrokkeneIdentificatie/voornamen" />
              </BG:voornamen>
              <BG:geslachtsaanduiding>
                <xsl:value-of
                  select="upper-case($storeRollenJson/root/results/betrokkeneIdentificatie/geslachtsaanduiding)" />
              </BG:geslachtsaanduiding>
              <BG:geboortedatum>
                <xsl:value-of
                  select="format-date($storeRollenJson/root/results/betrokkeneIdentificatie/geboortedatum,'[Y0001][M01][D01]')" />
              </BG:geboortedatum>
            </natuurlijkPersoon>
          </gerelateerde>
          <code xsi:nil="true" StUF:noValue="geenWaarde" />
          <omschrijving>Initiator</omschrijving>
          <toelichting xsi:nil="true" StUF:noValue="geenWaarde" />
          <heeftAlsAanspreekpunt StUF:entiteittype="ZAKBTRINICTP" StUF:verwerkingssoort="T">
            <gerelateerde StUF:entiteittype="CTP" StUF:verwerkingssoort="I">
              <identificatie></identificatie>
              <isAanspreekpuntNamens StUF:entiteittype="CTPSUB" StUF:verwerkingssoort="T">
                <gerelateerde />
              </isAanspreekpuntNamens>
            </gerelateerde>
          </heeftAlsAanspreekpunt>
        </heeftAlsInitiator>
        <heeft StUF:entiteittype="ZAKSTT" StUF:verwerkingssoort="T">
          <gerelateerde StUF:entiteittype="STT" StUF:verwerkingssoort="I">
            <zkt.code>
              <xsl:value-of select="$zkt_code" />
            </zkt.code>
            <zkt.omschrijving>
              <xsl:value-of select="$storeZaakTypeResponse/root/omschrijving" />
            </zkt.omschrijving>
            <volgnummer xsi:nil="true" StUF:noValue="waardeOnbekend" />
            <code xsi:nil="true" StUF:noValue="waardeOnbekend" />
            <omschrijving>
              <xsl:value-of
                select="$storeStatusResponse/root/statustoelichting" />
            </omschrijving>    
            <ingangsdatumObject xsi:nil="true" StUF:noValue="waardeOnbekend" />
          </gerelateerde>
          <datumStatusGezet>
            <xsl:value-of
              select="substring(replace(replace(replace(replace($storeStatusResponse/root/datumStatusGezet,'T',''),'Z',''),':',''),'-',''), 0, 13)" />
          </datumStatusGezet>
        </heeft>
      </object>
    </zakLk01>
  </xsl:template>
</xsl:stylesheet>