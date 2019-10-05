$(function() {
  $('#new_room_message').on('ajax:success', function(a, b,c ) {
    $('#txt-message').val('');
  });
});