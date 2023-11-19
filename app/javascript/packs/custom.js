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
