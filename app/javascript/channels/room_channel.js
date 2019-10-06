import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("Connected to the room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('[data-channel-subscribe="room"]').each(function(index, element) {
      var $element = $(element),
      messageTemplate = $('[data-role="message-template"]');

      $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)        

      var content = messageTemplate.children().clone(true, true);
      content.find('[data-role="message-text"]').text(data.content.message);
      content.find('[data-role="message-date"]').text(data.content.name + " - " + data.content.updated_at);
      $element.append(content);
      $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
    });
  },

  speak: function() {
    return this.perform('speak');
  }
});
