// Javascript Goes Here~
$(document).ready(function(){

  $('#community').click(function(event){
    event.preventDefault();

    $.ajax({

      url: '/users.json',
      type: 'get',
      dataType: "json",
      success: function(response) {
        var array = [];
        $.each(response, function(index, user) {
          var newUser = new userObject(user);
          array.push(newUser);
        });
           console.log(array);
        $.each(array, function(index, user){

          $(".community").append('<img class="#" src="'+user.image_url+'" alt=""><div>'+ user.name +'</div>')

        });

      },
      failure: function(response) {
        alert(ERROR);
      }

    });

  });

  $('.comment_box').submit(function(event) {

      event.preventDefault();

      var $target = $(event.target);
      var path = $target.attr("action")+".json";
      $.ajax({
        url: path,
        type: 'post',
        data: $target.serialize(),
        success: function(response) {
          $(".comment_list").append("<li>" + response.content + "</li>");
          $(".comment_list").append("<li>" + response + "</li>");
          $target.clear;
        },
        error: function(response) {
          alert(ERROR);
        }
      })
  })
});


var userObject = function(user) {
  this.name = user.name
  this.mantra = user.mantra
  this.image_url = user.image_url
}
