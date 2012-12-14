<?xml version='1.0'?>
<!--
License     : This code is released under the GPL. [http://www.gnu.org/copyleft/gpl.html]
Document    : mm2latexbeamer_richcontent.xsl based on mm2latexbeamer 
Description : Transforms freemind mm format to latex Documents following the latex beamer approach

Orginal idea created by Joerg Feuerhake [joerg.feuerhake@free-penguin.org]
(original stylesheet) and Robert Ladstaetter [robert@ladstaetter.info] 
(small adaptions to fit into latex beamer scheme)
Bug fixing and features added by: Igor G. Olaizola [igor.go@gmail.com]
Richcontent adaptations made by: Igor G. Olaizola

ChangeLog : 
Created on  : 01 February 2004
Updated    : 30 December 2006
Modified	: 29 November 2007
Modified    : 21 October 2008 (iolaizola, some new modifications to 
		support images);
Modified    : 23 October 2008, cleanup
Modified    : 23 October 2008: Extension to more richcontent "notes"
Modified    : 28 October: some minor format changes
Modified    : 07 December 2008: Including text in richcontent mode (v1.5)
Modified    : 09 December 2008: Bug fixing in richcontent mode (v1.6)
Modified    : 01 January 2009: Notes in the third level accepted as 
		main text for the slide (v.1.7) (iolaizola)
Modified    : 01 January 2009: Bug fixing: Notes were not fully compatible
		 with "items" richcontent, some html spacing issues solved (v.1.71) (iolaizola) 
Modified    : 07 January 2009: HTML code of images can be now directly 
		edited in freemind (<p> effect) (v.1.72) (iolaizola)
Modified   : 04 May 2009: Fixing some bugs detected in version 1.72
Modified   : 02/07/2009: Redirecting the output to Latex.
Modified   : 23/07/2009: Chapter, section bug fixed (v.1.02)
	 
Thanks to: Gorka Marcos and Myriam Alustiza for giving the xsl syntax support 			  


See: http://freemind.sourceforge.net/
-->

<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>  
<xsl:output omit-xml-declaration="yes" encoding="UTF-8"/>

<xsl:template match="map">

<!-- ==== HEADER ==== -->
<xsl:text>
%Graph Name: {</xsl:text><xsl:value-of select="node/@TEXT"/><xsl:text>}
</xsl:text>

<!-- <xsl:apply-templates select="node"/> -->
<xsl:apply-templates/>
</xsl:template>


<!-- ======= Body ====== -->

<!-- Sections Processing -->


<xsl:template match="richcontent">
</xsl:template> <!--Avoids to write notes contents at the end of the document-->

<xsl:template match="node">

	<xsl:if test="(count(ancestor::node())-2)=0">
		<xsl:apply-templates/>
	</xsl:if>
	
	<xsl:if test="(count(ancestor::node())-2)=1">
		<xsl:text>\part{</xsl:text><xsl:value-of select="@TEXT"/><xsl:text>}</xsl:text>
		<xsl:if test = "contains(current()/richcontent/@TYPE,'NOTE') ">
			<xsl:call-template name="richtext"></xsl:call-template>
		</xsl:if>
		<xsl:if test="current()/richcontent/html/body/img">
			<xsl:call-template name="figures"></xsl:call-template>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:if>

		
	<xsl:if test="(count(ancestor::node())-2)=2">
		<xsl:text>\chapter{</xsl:text><xsl:value-of select="@TEXT"/><xsl:text>}</xsl:text>
		<xsl:if test = "contains(current()/richcontent/@TYPE,'NOTE') ">
			<xsl:call-template name="richtext"></xsl:call-template>
		</xsl:if>
		<xsl:if test="current()/richcontent/html/body/img">
			<xsl:call-template name="figures"></xsl:call-template>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:if>
	
	<xsl:if test="(count(ancestor::node())-2)=3">
		<xsl:text>\section{</xsl:text><xsl:value-of select="@TEXT"/><xsl:text>}</xsl:text>
		<xsl:if test = "contains(current()/richcontent/@TYPE,'NOTE') ">
			<xsl:call-template name="richtext"></xsl:call-template>
		</xsl:if>
		<xsl:if test="current()/richcontent/html/body/img">
			<xsl:call-template name="figures"></xsl:call-template>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:if>
	
	
	<xsl:if test="(count(ancestor::node())-2)=4">
		<xsl:text>\subsection{</xsl:text><xsl:value-of select="@TEXT"/><xsl:text>}</xsl:text>
		<xsl:if test = "contains(current()/richcontent/@TYPE,'NOTE') ">
			<xsl:call-template name="richtext"></xsl:call-template>
		</xsl:if>
		<xsl:if test="current()/richcontent/html/body/img">
			<xsl:call-template name="figures"></xsl:call-template>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:if>	

	<xsl:if test="(count(ancestor::node())-2)=5">
		<xsl:text>\subsubsection{</xsl:text><xsl:value-of select="@TEXT"/><xsl:text>}</xsl:text>
		<xsl:if test = "contains(current()/richcontent/@TYPE,'NOTE') ">
			<xsl:call-template name="richtext"></xsl:call-template>
		</xsl:if>
		<xsl:if test="current()/richcontent/html/body/img">
			<xsl:call-template name="figures"></xsl:call-template>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:if>		
	

	<xsl:if test="(count(ancestor::node())-2)=6">
		<xsl:text>\paragraph{</xsl:text><xsl:value-of select="@TEXT"/><xsl:text>}</xsl:text>
		<xsl:if test = "contains(current()/richcontent/@TYPE,'NOTE') ">
			<xsl:call-template name="richtext"></xsl:call-template>
		</xsl:if>
		<xsl:if test="current()/richcontent/html/body/img">
			<xsl:call-template name="figures"></xsl:call-template>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:if>		
	

	<xsl:if test="(count(ancestor::node())-2)=7">
		<xsl:text>\subparagraph{</xsl:text><xsl:value-of select="@TEXT"/><xsl:text>}&#xD;</xsl:text>
			<!--We look if there are images in the frame in order to put columns or not-->
			<!--<xsl:if test="current()/node/richcontent/html/body">
				<xsl:text> Note detected</xsl:text>
			</xsl:if>-->
			<xsl:if test = "contains(current()/richcontent/@TYPE,'NOTE') ">
				<xsl:call-template name="richtext"></xsl:call-template>
			</xsl:if>
			<xsl:if test="current()/node/richcontent/html/body/p/@text">
				<xsl:call-template name="itemization"></xsl:call-template>
			</xsl:if>
		<xsl:apply-templates/>
	</xsl:if>
</xsl:template>

<xsl:template name="itemization">
	<xsl:param name="i" select="current()/node"/>
	<xsl:text>		\begin{itemize}&#xD;</xsl:text>
	<xsl:for-each select="$i">
		<xsl:choose>
			<xsl:when test="@TEXT">
				<xsl:text>	\item </xsl:text><xsl:value-of select="@TEXT"/><xsl:text>&#xD;</xsl:text>
			</xsl:when>
			<xsl:when test="current()/richcontent/html/body/p/@text">
				<xsl:text>	\item </xsl:text><xsl:call-template name="richtext"></xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:if test="current()/node">
			<xsl:call-template name="itemization"></xsl:call-template>
		</xsl:if>
		<xsl:text>
		</xsl:text>	
	</xsl:for-each>

	<!--<xsl:if test="current()/richcontent">
			<xsl:call-template name="figures"></xsl:call-template>
		</xsl:if>-->
	<xsl:text>		\end{itemize}&#xD;</xsl:text>
</xsl:template>

<!-- template to parse and insert rich text (html, among <p> in Latex \item-s -->
<xsl:template name="richtext">
	<xsl:param name="i" select="current()/richcontent/html/body/p"/>
	<xsl:for-each select="$i">
		<xsl:text>&#xD;</xsl:text>
		<xsl:value-of select="normalize-space(translate(.,'&#x0d;&#x0a;', '  '))"/>
	</xsl:for-each>
</xsl:template>

						
<!-- template to parse and insert figures -->
<xsl:template name="figures">
	<xsl:text>
		\includegraphics[width=1.0\textwidth]{</xsl:text><xsl:value-of 
			select="current()/node/richcontent/html/body/img/@src"/><xsl:text>}
	</xsl:text>
</xsl:template>
<!-- template to parse and insert figures with manually edited html. (inside <p>)-->
<xsl:template name="figuresp">
	<xsl:text>
		\includegraphics[width=1.0\textwidth]{</xsl:text><xsl:value-of 
			select="current()/node/richcontent/html/body/p/img/@src"/><xsl:text>}
	</xsl:text>
</xsl:template>

<!--We look if there are images in the frame in order to put columns or not-->
				<!--<xsl:if test="current()/node/richcontent/html/body">
					<xsl:text> Note detected</xsl:text>
				</xsl:if>-->


<xsl:template match="text">
   <Notes><xsl:value-of select="text"/></Notes>
 </xsl:template>



<!-- End of LaTeXChar template -->

</xsl:stylesheet>

