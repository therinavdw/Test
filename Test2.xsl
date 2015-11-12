<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <lineup>
        
            <xsl:apply-templates/>
           
    </lineup>
</xsl:template>
  

<xsl:template match="band">
<artist>
     <xsl:attribute name="id">
        <xsl:apply-templates select="@id"/>
     </xsl:attribute>
    
     <name><xsl:apply-templates select="@name"/></name>
  
    <genres>
        <genre>
            <xsl:apply-templates select="@genre"/>
        </genre>
    </genres>
    
    <writeup><xsl:apply-templates select="description"/> </writeup>
    
   <gig><xsl:apply-templates select="timeslot"/></gig>  
    
   <photo><xsl:attribute name="format">
       <xsl:value-of select="substring-after(image/@src,'.')"/></xsl:attribute><xsl:value-of select="substring-before(image/@src,'.')"/>
    </photo>
</artist>
</xsl:template>

    
<xsl:template match="@id">
    <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="@name">
    <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="@genre">
   <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="description">
    <xsl:apply-templates select="line"/>
</xsl:template>

<xsl:template match="line">
    <xsl:value-of select="."/>
</xsl:template>
    
<xsl:template match="timeslot">
    <day><xsl:value-of select="upper-case(@day)"/></day>
    <time><xsl:apply-templates select="time"/></time>
</xsl:template>
    
<xsl:template match="time">
    <starts><xsl:value-of select="@start"/>:00</starts>
    <ends><xsl:value-of select="@end"/>:00</ends>
</xsl:template>
    
</xsl:stylesheet>
    

