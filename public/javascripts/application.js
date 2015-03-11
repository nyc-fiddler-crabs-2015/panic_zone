// Javascript Goes Here~
$(document).ready(function(){

  // listener
  $('#button').click(function(event) {

    event.preventDefault();
      $.ajax({
        url: '/',
        type: 'GET',
        success: function(response) {
          $('.container').append(response)
        }
        failure: function() {
          alert("something went wrong");
        }

      })

    })
  })
    // ajax GET route

  // listener
    // ajax POST route

});
//
