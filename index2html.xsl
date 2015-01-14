<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <xsl:output method="html"/>
  <xsl:template match="/index">
    <html>
      <head>
        <title><xsl:value-of select="@title"/></title>
        <style>
          h1 { font-size: large; }
          body { font-family: sans-serif; }
        </style>
      </head>
      <body>
        <h1><xsl:value-of select="@title"/></h1>
        <ul>
          <xsl:for-each select="page">
            <xsl:variable name="page_id" select="@id"/>
            <xsl:for-each select="document(concat($page_id,'.rdf'))">
              <xsl:choose>
                <xsl:when test="rdf:RDF/owl:Ontology/rdfs:label">
                  <li>
                    <a href="{$page_id}/"><xsl:value-of select="rdf:RDF/owl:Ontology/rdfs:label"/></a>
                  </li>
                </xsl:when>
                <xsl:when test="rdf:RDF/rdf:Description[1]/dcterms:title">
                    <a href="{$page_id}/"><xsl:value-of select="rdf:RDF/rdf:Description[1]/dcterms:title"/></a>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
