var phrases = [
  'dogging anchovy',
  'pasty irritant',
  'seaside whitening',
  'tattling advancement',
  'tilted jobbing',
  'institutional fundamentalism',
  'positional cane',
  'pledged precursor',
]

$(document).ready(function(){
  rand_phrase()
  $('.btn-refresh').on('click', function(){
    rand_phrase()
  });
});

function rand_phrase() {
		$('.show-phrase').text(phrases[Math.floor((Math.random() * phrases.length) + 0)])
};

$(".input").keypress(function(eventTarget) {
  if(eventTarget.keyCode === 13){
    eventTarget.preventDefault();
    phrases.push($('[data-input="input"]').val());
  }
});

$('.anchor').click(function(){
  $('.show-phrase').toggle();
});
