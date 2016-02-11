$.ajax({
  url: "/home/posts.json",
  dataType: "script",
  beforeSend: function(){
    $('#loading').show();
  },
  complete: function(){
    $('#loading').hide();
  },
  success: function (html) {
    var r = $.parseJSON(html);
    for (i = 0; i < r.length; i++){
      var mydiv = $('#content').append($('<div/>', { id: r[i]['id'], 'class' : 'ansbox', 'html' : r[i]['id']}));

    }
  }
});
