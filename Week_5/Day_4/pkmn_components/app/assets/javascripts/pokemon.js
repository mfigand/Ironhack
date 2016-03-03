
$(document).on("ready",function(){
  $(".js-show-pokemon").on("click", setUri);
});

var setUri = function (){
  var $button = $(event.currentTarget);
  var pokemonUri = $button.data("pokemon-uri");
  var pokemon = new PokemonApp.Pokemon(pokemonUri);
  pokemon.render();
};

PokemonApp.Pokemon = function (pokemonUri) {
  this.id = PokemonApp.Pokemon.idFromUri(pokemonUri);
};

PokemonApp.Pokemon.prototype.render = function(){
  // console.log("Rendering pokemon: #" + this.id);
  var self = this;

  $.ajax({
    url: "/api/pokemon/" + this.id,
    success: function (response){
      self.info = response;

      $(".js-pkmn-name").text(self.info.name);
      $(".js-pkmn-number").text(self.info.pkdx_id);
      $(".js-pkmn-height").text(self.info.height);
      $(".js-pkmn-weight").text(self.info.weight);
      $(".js-pkmn-hp").text(self.info.hp);
      $(".js-pkmn-attack").text(self.info.attack);
      $(".js-pkmn-defense").text(self.info.defense);
      $(".js-pkmn-sp_atk").text(self.info.sp_atk);
      $(".js-pkmn-sp_def").text(self.info.sp_def);
      $(".js-pkmn-speed").text(self.info.speed);
      $(".js-pokemon-image").attr('src','http://pokeapi.co/media/img/'+self.info.pkdx_id+'.png');
      $(".js-pkmn-types").empty();
      $(".imageArea").empty();
      $.each(self.info.types,function(index,val) {
          $(".js-pkmn-types").append(val.name+" ");
        })

      var evolutionsArray = self.info.evolutions;
      $(".modal-footer").empty();
      $.each(evolutionsArray,function(index,val) {
          $(".modal-footer").append('<button class="js-evolution" data-pokemon-uri="'+
          self.info.evolutions[index].resource_uri+'" >'+
          self.info.evolutions[index].to+'</button>'
          );
        })

      $(".js-evolution").on("click", setUri);

      self.evolution = new PokemonApp.PokemonEvolutions(self.id, self.info);

      $(".js-pokemon-modal").modal("show");
    }
  })
};

PokemonApp.Pokemon.idFromUri = function (pokemonUri){
  var uriSegments = pokemonUri.split("/");
  var secondLast = uriSegments.length - 2;
  return uriSegments[secondLast];
};

PokemonApp.PokemonEvolutions = function(id,info){
  this.id = id;
  this.info = info;
};

// PokemonApp.Pokemon.getImage  = function(){
//   var self = this;
//   $.ajax({
//     url: "/api/sprite/" + this.id,
//     success: function (response){
//       self.info = response;
//
//       $(".imageArea").append('<img class="js-pokemon-image" src="http://pokeapi.co'+
//       self.image+'" >'
//       );
//     }
//   });
// };

// PokemonApp.PokemonEvolutions.prototype.render = function () {
//   console.log("Rendering evolutions for: #" + this.id);
//   console.log(this);
//   console.log(this.info.evolutions);
//   console.log(this.info.evolutions[0].resource_uri);
//
//   var pokemon = new PokemonApp.Pokemon(this);
//   pokemon.render();
//
// };
