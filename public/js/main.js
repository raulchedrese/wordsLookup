$("#submit").click(function(event) {
  $('#col1').empty();
  $('#col2').empty();
  event.preventDefault();

  var nL = $('#numLetters').val();
  var fL = $('#firstLetter').val();
  var cL = $('#cLetter').val();
  var lL = $('#lastLetter').val();

  var jsonUrl = "json?numLetters="+nL+"&firstLetter="+fL+"&cLetter="+cL+"&lastLetter="+lL;

  $.getJSON(jsonUrl, function(data) {

    $('#col1').append("<ul></ul>");
    $('#col2').append("<ul></ul>");
    for (var i = 0; i < data.length; i++) {
      if ( i % 2 === 0) {
        $('#col1 ul').append("<li>"+data[i]+"</li>");
      } else {
        $('#col2 ul').append("<li>"+data[i]+"</li>");
      }
    }
    $('#col1 ul').slideDown(1000);
    $('#col2 ul').slideDown(1000);

  });
  //black magic ajax call
});

$(document).ajaxStart(function(){ 
  $('#ajaxBusy').show();
  $('#submit').hide();
}).ajaxStop(function(){ 
  $('#ajaxBusy').hide();
  $('#submit').show();
});


$("input").keyup(function (event) {
    var $this = $(this);
    $this.next().focus();
});

$("input").focusin(function(event) {
  $(this).attr('value', '');
  $(this).css({
    border:"3px solid #2962D5"
  });
});

$("input").focusout(function(event) {
  $(this).css({
    border:"none"
  });
});