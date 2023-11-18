$(document).on('turbolinks:load', () => {
  $('#fileBox').on('change', (e) => {
    console.log(e.target)
    var file = $(e.target).prop('files')[0];
    $('#fileBoxName').text(file.name);
  });
})
