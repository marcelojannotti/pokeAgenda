
function pokeagenda () {
  this.id = 1;
  
  this.set = function(id) {
    id = Math.min(151,Math.max(1,id));
    var elPoke = document.querySelectorAll('#pkmn'+('000'+this.id).substr(('000'+this.id).length-3, 3)+'.pokedados');
    elPoke[0].style['display'] = '';
    elPoke[1].style['display'] = '';
    this.id = id;
    var elPoke = document.querySelectorAll('#pkmn'+('000'+this.id).substr(('000'+this.id).length-3, 3)+'.pokedados')
    elPoke[0].style['display'] = 'block';
    elPoke[1].style['display'] = 'block';
    try {
    responsiveVoice.cancel();
    responsiveVoice.speak(elPoke[1].querySelector("#display_text").innerText.replace(/\n/g,''), "Brazilian Portuguese Female", {rate: 2});
    } catch(e) {}
  }
  
  this.next = function() {
    this.set(this.id+1);
  }
  
  this.prev = function() {
    this.set(this.id-1);
  }
  this.set(1);
}
oPokeAgenda = new pokeagenda();
