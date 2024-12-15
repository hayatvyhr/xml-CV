<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <link rel="stylesheet" href="cv.css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
                <title>
                    <xsl:value-of select="cv/entete/prenom"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="cv/entete/nom"/>
                </title>
                
                <style>
                    .section {
                    margin-bottom: 20px;
                    }
                    
                    .Div_Left_Entry {
                    margin-bottom: 20px;
                    }
                </style>
                
            </head>
            <body>
                <center>
                    <div class="CV">
                        <div class="LeftColumn">
                            <center>
                                <div id="Div_MyImage">
                                    <img src="Images/pic.png" alt="My photo"/>
                                </div>
                                <div id="Div_Content_Left">
                                    
                                    <div>
                                        <h2 style="color: white;">Contact</h2>
                                        <xsl:call-template name="Info"/>
                                    </div>
                                    
                                    <hr/>
                                    
                                    <div>
                                        <h2 style="color: white;">Compétences</h2>
                                        <xsl:call-template name="Skills"/>
                                    </div>
                                    <hr/>
                                    <div> 
                                        <h2 style="color: white;">Langues</h2>
                                        <xsl:call-template name="Languages"/>
                                    </div>
                                    
                                    <hr/>
                                    
                                    <div>
                                        <h2 style="color: white;">CENTRE D'INTÉRÊTS</h2>
                                        <xsl:call-template name="Hobbies"/>
                                    </div>
                                </div>
                            </center>
                        </div>
                        <div class="RightColumn">
                            <center>
                                <div id="Div_Me">
                                    <h1>
                                        <xsl:value-of select="cv/entete/prenom"/>
                                        <xsl:text> </xsl:text> 
                                        <xsl:value-of select="cv/entete/nom"/>
                                    </h1>
                                    <hr/>
                                    <div class="icon">    
                                        <h2><i class="fa-solid fa-user"></i> À propos de moi</h2>
                                    </div>
                                    <div class="paragraph">
                                        <xsl:call-template name="Bio"/>
                                        
                                    </div>
                                    <hr/>
                                </div>
                                
                                <div id="Div_Content">
                                    <div>
                                        <h2> <i class="fa-sharp fa-solid fa-graduation-cap"></i> Formation</h2>
                                        <xsl:call-template name="Education"/>
                                    </div>
                                    
                                    <hr/>
                                    
                                    <div>
                                        <h2><i class="fa-solid fa-code"></i> PROJETS ACADÉMIQUES</h2>
                                        <xsl:call-template name="Projects"/>
                                    </div>
                                    
                                    <hr/>
                                    
                                    <div>
                                        <h2> <i class="fa-solid fa-briefcase"></i> EXPÉRIENCES PROFESSIONNELLES</h2>
                                        <xsl:call-template name="Internship"/>
                                    </div>
                                    <div class="page-break"/>
                                </div>
                            </center>
                        </div>
                    </div>
                </center>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="Education">
        <xsl:for-each select="cv/Formations/diplome">
            <div class="Div_Entry">
                <label class="Label_TimeScale">
                    <xsl:value-of select="annee"/> :
                </label>
                <div class="Div_EntryContent">
                    <p class="Div_EducationEntryContentDescription">
                        <strong>
                            <xsl:value-of select="intitule"/>
                        </strong>
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Internship">
        <xsl:for-each select="cv/stages/stage">
            <div class="Div_Entry">
                <label class="Label_TimeScale">
                    <xsl:value-of select="date"/>:
                </label>
                <div class="Div_EntryContent">
                    <h3 class="H3_Entry">
                        <strong>
                            <xsl:value-of select="titre"/>
                        </strong>
                    </h3>
                    <div class="Div_EntryBody">
                        <img class="Logo" width="180" height="140" src="Images/logo1.png" alt="Organization Image"/>
                        <p class="Div_EntryContentDescrip1">
                            <xsl:value-of select="description"/>
                        </p>
                    </div>
                    <br/>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Projects">
        <xsl:for-each select="cv/projets/projet">
            <div class="Div_Entry">
                <div class="Div_EntryContent">
                    <h3 class="H3_EntrySubject">
                        <strong>
                            <xsl:value-of select="titre"/>
                        </strong>
                    </h3>
                    <p class="Div_EntryContentDescription">
                        <xsl:value-of select="description"/>
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Skills">
        <xsl:for-each select="cv/competences/competence">
            <div class="Div_Left_Entry">
                <div class="Div_EntryContent">
                    <h3 class="H3_EntrySubject_Left">
                        <strong>
                            <xsl:value-of select="titre"/>
                        </strong>
                    </h3>
                    <p class="Div_EntryContentDescription_Left">
                        <xsl:value-of select="description"/>
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Hobbies">
        <xsl:for-each select="cv/loisirs/loisir">
            <div class="Div_Left_Entry">
                <div class="Div_EntryContent">
                    <p class="Div_EntryContentDescription_Left">
                        <xsl:value-of select="."/>
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Languages">
        <xsl:for-each select="cv/langues/langue">
            <div class="Div_Left_Entry">
                <div class="Div_EntryContent">
                    <p class="Div_EntryContentDescription_Left">
                        <xsl:value-of select="intitule"/>: <xsl:value-of select="niveau"/>
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Info">
        <div class="Div_Info">
            <!-- Date de Naissance -->
            <strong>
                <i class="fa-solid fa-cake-candles"></i>
            </strong>
            <label class="Div_EntryContentDescription_Left">
                <xsl:value-of select="cv/entete/dateDeNaissance"/>
            </label>
            <br/>
            
            <!-- Nationalité -->
            <strong>
                <i class="fa-solid fa-earth-americas"></i>
            </strong>
            <label class="Div_EntryContentDescription_Left">
                <xsl:value-of select="cv/entete/nationalite"/>
            </label>
            <br/>
            
            <!-- Téléphone -->
            <strong>
                <i class="fa-solid fa-phone"></i>
            </strong>
            <label class="Div_EntryContentDescription_Left">
                <xsl:value-of select="cv/entete/telephone"/>
            </label>
            <br/>
            
            <!-- E-mail -->
            <strong>
                <i class="fa-solid fa-envelope"></i>
            </strong>
            <label class="Div_EntryContentDescription_Left">
                <xsl:value-of select="cv/entete/mail"/>
            </label>
            <br/>
            
            <!-- LinkedIn Profile -->
            <strong>
                <i class="fa-brands fa-linkedin"></i>
            </strong>
            <a class="Div_EntryContentDescription_Left" href="https://www.linkedin.com/in/hayat-roubakhi-97ba051b3/">
                <xsl:value-of select="cv/entete/linkedin"/>
            </a>
            <br/>
            
            <!-- GitHub Profile -->
            <strong>
                <i class="fa-brands fa-github"></i>
            </strong>
            <a class="Div_EntryContentDescription_Left" href="https://github.com/hayatvyhr">
                <xsl:value-of select="cv/entete/github"/>
            </a>
            <br/>
        </div>
    </xsl:template>
    
    <xsl:template name="Bio">
        <p>
            <xsl:value-of select="cv/entete/bio"/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>
