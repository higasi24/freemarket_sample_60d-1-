$(document).on('turbolinks:load', function() {
  $(function(){
    var a = document.referrer;
    if (a.match(/\/users\/\d+\/save/))
      $('#first').hide();
    else
      $('#second').hide();
  });
});

// window.location.href