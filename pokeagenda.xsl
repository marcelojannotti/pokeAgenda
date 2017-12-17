<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
    <link rel="stylesheet" href="pokeagenda.css"/>
    <script src="//code.responsivevoice.org/responsivevoice.js"></script>
    <script src="pokeagenda.js"></script>
  </head>
  <body>
  <div id="pokeagenda">
  <img id="led_azul_grande" class="led grande" src="Led_azul_grande.png"/>
  <div id="led_vermelho_pequeno" class="led pequeno"></div>
  <div id="led_amarelo_pequeno" class="led pequeno"></div>
  <div id="led_verde_pequeno" class="led pequeno"></div>
    <div id="border_top">
      <div style="border-bottom:2px solid black;width:180px;height:100%;float:left;"></div>
      <div style="margin-top:-2px;padding-top:4px;width:40px;height:100%;float:left;background:linear-gradient(135deg, rgba(0,0,0,0) 29px,black 29px,black 31px,#b00 31px, #b00)"></div>
      <div style="background-color:#b00;border-top:2px solid black;border-right:1px solid black;width:180px;height:100%;float:left;"></div>
      <div style="background-color:#b00;border-top:2px solid black;width:180px;height:100%;float:left;"></div>
      <div style="margin-top:-2px;padding-top:4px;width:40px;height:100%;float:left;background:linear-gradient(-135deg, rgba(0,0,0,0) 29px,black 29px,black 31px,#b00 31px, #b00)"></div>
      <div style="border-bottom:2px solid black;width:180px;height:100%;float:left;"></div>
    </div>
    <div id="databox" class="open">
        <div id="box_left">
  <xsl:apply-templates select="pokeagenda/pokemon" mode="left"/>
        </div>
        <div id="box_right">
  <xsl:apply-templates select="pokeagenda/pokemon" mode="right"/>
        </div>
    </div>
    <!--div id="controls">
    <span onclick="oPokeAgenda.prev()">Prev</span><span onclick="oPokeAgenda.next()">Next</span>
    </div-->
  </div>
  </body>
  </html>
</xsl:template>
<xsl:template match="pokemon" mode="left">
<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
  <div id="pkmn{./@number}" class="pokedados">
    <div id="display">
      <div style="background-image:url('img/dream-world/{./@number}.svg');background-size:auto 100%;" class="display {name(types/*[1])}"></div>
    </div>
    <div style="width:32px;height:32px;position:absolute;top:184px;left:45px;background:linear-gradient(45deg, #b00 21px,gray 21px,gray 23px,#eee 23px, #eee)"></div>
    <div id="display_name">
    #<xsl:value-of select="./@number"/><br/>
    <xsl:value-of select="./@name"/>
    </div>
    
    <div id="up" class="control"></div>
    <div id="left" class="control" onclick="oPokeAgenda.prev()"></div>
    <div id="center" class="control"></div>
    <div id="right" class="control" onclick="oPokeAgenda.next()"></div>
    <div id="down" class="control"></div>
  </div>
</xsl:template>


<xsl:template match="pokemon" mode="right">
  <xsl:variable name="id" select="./@number" />
  <div id="pkmn{./@number}" class="pokedados">

    <div id="display_text">
      <xsl:value-of select="./data"/>
    </div>

    <div id="buttons">
      <input id="1" class="button" type="button"/>
      <input id="2" class="button" type="button"/>
      <input id="3" class="button" type="button"/>
      <input id="4" class="button" type="button"/>
      <input id="5" class="button" type="button"/><br/>
      <input id="6" class="button" type="button"/>
      <input id="7" class="button" type="button"/>
      <input id="8" class="button" type="button"/>
      <input id="9" class="button" type="button"/>
      <input id="10" class="button" type="button"/>
    </div>

    <div id="display_evolution_from">
      <xsl:apply-templates select="../pokemon/evolution[@to = $id]/.." mode="evolution"/>
    </div>

    <div id="display_evolution">
      <xsl:apply-templates select="./evolution"/>
    </div>

  </div>

</xsl:template>

<xsl:template match="pokemon" mode="evolution">
<xsl:variable name="id" select="./@number" />
  <div onclick="oPokeAgenda.set('{$id}')"><img src="img/icons/{$id}.png" class="pokemini"/><span><xsl:value-of select="/pokeagenda/pokemon[@number = $id]/@name"/></span></div>
</xsl:template>

<xsl:template match="pokemon/evolution[@level]">
<xsl:variable name="id" select="./@to" />
  <div onclick="oPokeAgenda.set('{$id}')"><img src="img/icons/{$id}.png" class="pokemini"/> <xsl:value-of select="/pokeagenda/pokemon[@number = $id]/@name"/><br/><span>(Level <xsl:value-of select="./@level"/>)</span></div>
</xsl:template>

<xsl:template match="pokemon/evolution[@stone]">
<xsl:variable name="id" select="./@to" />
  <div onclick="oPokeAgenda.set('{$id}')"><img src="img/icons/{$id}.png" class="pokemini"/> <xsl:value-of select="/pokeagenda/pokemon[@number = $id]/@name"/><br/><span>(<xsl:value-of select="./@stone"/> Stone)</span></div>
</xsl:template>

<xsl:template match="pokemon/evolution[@how]">
<xsl:variable name="id" select="./@to" />
  <div onclick="oPokeAgenda.set('{$id}')"><img src="img/icons/{$id}.png" class="pokemini"/> <xsl:value-of select="/pokeagenda/pokemon[@number = $id]/@name"/><br/><span>(<xsl:value-of select="./@how"/>)</span></div>
</xsl:template>
</xsl:stylesheet>
