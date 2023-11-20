$(document).on('turbolinks:load', () => {
  $('#fileBox').on('change', (e) => {
    var files = $(e.target).prop('files');
    var fileNames = [];
    for (var i = 0; i < files.length; i++) {
      fileNames.push(files[i].name);
    }

    $('#fileBoxName').text(fileNames.join(', '));
  });
})

$(function() {
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('.scroll-top-btn').fadeIn();
    } else {
      $('.scroll-top-btn').fadeOut();
    }
  });

  $('.scroll-top-btn').click(function() {
    $('html, body').animate({scrollTop: 0}, 800);
    return false;
  });
});