<?xml version="1.0"  encoding="UTF-8" standalone="no"?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg"
    xmlns:conf="http://tilman.rassy/config">
  
  <xsl:output method="xml"/>

  <config xmlns="http://tilman.rassy/config">
    <linearGradient id="linearGradient3913-5">
      <stop color="#E3F1F1" opacity="1"/>
      <stop color="#E3F1F1" opacity="0"/>
    </linearGradient>
    <linearGradient id="linearGradient3897-7">
      <stop color="#E3F1F1" opacity="1"/>
      <stop color="#ECFBFB" opacity="1"/>
      <stop color="#DAE7E7" opacity="1"/>
      <stop color="#C0CCCC" opacity="1"/>
      <stop color="#AAB5B5" opacity="1"/>
    </linearGradient>
    <linearGradient id="linearGradient4518-3">
      <stop color="#D2DFDF" opacity="1"/>
      <stop color="#E3F1F1" opacity="1"/>
      <stop color="#ECFBFB" opacity="1"/>
    </linearGradient>
    <linearGradient id="linearGradient5982-7">
      <stop color="#E3F1F1" opacity="1"/>
      <stop color="#E3F1F1" opacity="0"/>
    </linearGradient>
    <path id="path34">
      <fill color="#E3F1F1" opacity="1"/>
    </path>
    <path id="path6122">
      <fill color="#E3F1F1" opacity="1" stroke="none"/>
    </path>
  </config>

  <xsl:variable name="config" select="document('')/xsl:stylesheet/conf:config"/>

  <!-- See http://www.w3.org/TR/xslt#copying: -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template name="linearGradientStop">
    <xsl:variable name="id" select="../@id"/>
    <xsl:variable name="n" select="count(preceding-sibling::svg:stop) + 1"/>
    <xsl:copy>
      <xsl:copy-of select="@*[name() != 'style']"/>
      <xsl:attribute name="style">
        <xsl:text>stop-color:</xsl:text>
        <xsl:value-of select="$config/conf:linearGradient[@id = $id]/conf:stop[$n]/@color"/>
        <xsl:text>;stop-opacity:</xsl:text>
        <xsl:value-of select="$config/conf:linearGradient[@id = $id]/conf:stop[$n]/@opacity"/>
        <xsl:text>;</xsl:text>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <xsl:template name="path">
    <xsl:variable name="id" select="@id"/>
    <xsl:copy>
      <xsl:copy-of select="@*[name() != 'style']"/>
      <xsl:attribute name="style">
        <xsl:text>fill:</xsl:text>
        <xsl:value-of select="$config/conf:path[@id = $id]/conf:fill/@color"/>
        <xsl:text>;fill-opacity:</xsl:text>
        <xsl:value-of select="$config/conf:path[@id = $id]/conf:fill/@opacity"/>
        <xsl:if test="$config/conf:path[@id = $id]/conf:fill/@stroke">
          <xsl:text>;stroke:</xsl:text>
          <xsl:value-of select="$config/conf:path[@id = $id]/conf:fill/@stroke"/>
        </xsl:if>
        <xsl:text>;</xsl:text>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:linearGradient[@id = 'linearGradient3913-5']/svg:stop">
    <xsl:call-template name="linearGradientStop"/>
  </xsl:template>
  
  <xsl:template match="svg:linearGradient[@id = 'linearGradient3897-7']/svg:stop">
    <xsl:call-template name="linearGradientStop"/>
  </xsl:template>
    
  <xsl:template match="svg:linearGradient[@id = 'linearGradient4518-3']/svg:stop">
    <xsl:call-template name="linearGradientStop"/>
  </xsl:template>
    
  <xsl:template match="svg:linearGradient[@id = 'linearGradient5982-7']/svg:stop">
    <xsl:call-template name="linearGradientStop"/>
  </xsl:template>

  <xsl:template match="svg:path[@id = 'path34']">
    <xsl:call-template name="path"/>
  </xsl:template>

  <xsl:template match="svg:path[@id = 'path6122']">
    <xsl:call-template name="path"/>
    </xsl:template>

</xsl:stylesheet>
