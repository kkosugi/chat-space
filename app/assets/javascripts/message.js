$(function(){
  function buildHTML(message){
    var html =
    `<div class = chat-main__body__messageslist>
      <div class = chat-main__body__messageslist__name>
        ${message.name}</div>
      <div class = chat-main__body__messageslist__time>
        ${message.created_at}</div>
      <div class = chat-main__body__messageslist__text>
               ${message.text}
               <img src = '${message.image.url}' width="300" height="nil"}>
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
});
