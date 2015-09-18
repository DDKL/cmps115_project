function displayInstagram(boxId){
    
  
    window.onload = function init() {
              
              $(function () {
                  var form = $('#tagsearch');
                  form.on('submit', function(ev) {
                    var q = this.tag.value;
                    if(q.length) {
                        location.reload();
                    }
                    ev.preventDefault();
                  });
                  $.ajax({
                      type: "GET",
                      dataType: "jsonp",
                      cache: false,
                      url: "https://api.instagram.com/v1/tags/"+document.getElementById("tag").value+"/media/recent/?access_token=16741082.1b07669.121a338d0cbe4ff6a5e04543158a4f82&count=33",
                      success: function (data) {
                          console.log(data);
                          if (data.meta.code == 200) {
                              var photos = data.data;
                              if (photos.length > 0) {
                                  for (var i = 0; i < photos.length; i++) {
                                      var date = new Date(data.data[i].created_time * 1000);
                                      var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                                      var year = date.getFullYear();
                                      var month = months[date.getMonth()];
                                      var day = date.getDate();
                                      var hours = date.getHours();
                                      var minutes = date.getMinutes();
                                      var seconds = date.getSeconds();
                                      var ap;
                                      if (hours == 10) {ap=" AM";hours=12;}
                                      else if (hours <= 11) {ap=" AM";}
                                      else if (hours == 12) {ap=" PM";}
                                      else if (hours >= 13) {ap=" PM";hours -= 12;}
                                      if (minutes < 10) {minutes="0"+minutes;}
                                      if (seconds < 10) {seconds="0"+seconds;}
                                    var time = month + ', ' + day + ' ' + year + ' at ' + hours + ':' + minutes + ':' + seconds + ' ' + ap;

                                      $(".instagram-feed").append("<div class='instagram'><hr class='top'>\
                                                             <a class='pic' href='"+data.data[i].link+"' target='_blank'>\
                                                             <img src='"+data.data[i].images.standard_resolution.url+"' /></a>\
                                                             <p><span class='info'>posted by: </span><a href='http://instagr.am/"+data.data[i].user.username+"' target='_blank'>"+data.data[i].user.username+"</a>\
                                                             <br><span class='info'>posted on: </span>"+time+"\
                                                             <br><span class='symbolHeart'>&hearts;</span> <span class='info'>"+data.data[i].likes.count+"</span>\
                                                             <span class='symbolComment'>&#9776;</span> <span class='info'>"+data.data[i].comments.count+"</span></p>\
                                                             <hr></div>\
                                                             ");                      
                                      date = null;
                                  }
                              }
                              else {
                                $(".instagram-feed").append("<span style='color:red;'>No Pictures were found for #"+document.getElementById("tag").value+"</span>");
                              }
                          }
                          else {
                            var igError = data.meta.error_message;
                            $(".instagram-feed").append("<span style='color:red;'>"+igError+"</span>");
                          }
                          $("#loading img").remove();
                      }
                  });
              }); 
      
    }
}
