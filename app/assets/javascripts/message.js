$(function(){
  function buildHTML(message){
    var insertImage = " ";
     if (message.image.url) {
       insertImage = `<img src="${message.image.url}" width="300" height=nil>`;
     }
    var html =
    `<div class = chat-main__body__messageslist>
      <div class = chat-main__body__messageslist__name>
        ${message.name}</div>
      <div class = chat-main__body__messageslist__time>
        ${message.created_at}</div>
      <div class = chat-main__body__messageslist__text>
               ${message.text}
               ${insertImage}
      </div>
    </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-main__body').append(html)
      $('.input').val('')
      $('.btn').val('')
      $('.html,body').animate({scrollTop: $('.chat-main__body')[0].scrollHeight}, 'fast');
    })
    .fail(function() {
      alert('投稿できませんでした')
    })
    return false;
  });

    var interval = setInterval(function() {
      if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      url: location.href,
      datatype: 'json',
    })
    .done(function(json) {
      var id = $('.chat').data('messageId');
      var insertHTML = '';
      json.messages.forEach(function(message) {
        if (message.id > id ) {
          insertHTML += buildHTML(message);
        }
      });
      $('.chat-wrapper').prepend(insertHTML);
    })
    .fail(function(json) {
      alert('自動更新に失敗しました');
    });
  } else {
    clearInterval(interval);
   }} , 5 * 1000 );
});
