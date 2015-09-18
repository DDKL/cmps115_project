function displayReddit(getSubR, boxId){
  $('#redditBox' + boxId).html('<center><img src="/gfx/redditLoader.gif" alt="loading..."></center>');

  var fullUrl = "http://www.reddit.com" + getSubR + ".json";

  $.getJSON(fullUrl, function(json){
  	var listing = json.data.children;
  	var html = '\n';

  	for(var i = 0; i < listing.length; i++){
  		var obj = listing[i].data;

  		var votes        = obj.ups;
  		var title        = obj.title;
  		var subTime      = obj.created_utc;
  		var thumb        = obj.thumbnail;
  		var subReddit    = "/r/" + obj.subreddit;
  		var redditUrl    = "http://www.reddit.com" + obj.permalink;
  		var subRedditUrl = "http://www.reddit.com/r/" + obj.subreddit + "/";
  		var extUrl       = obj.url;
  		var timeAgo      = timeSince(subTime);

      html += '<div class="reddit"><span><b>&#9650;<br>'+votes+'<br>&#9660;<br></b></span>';
      if(!thumb) {
        html += '<img src="/gfx/redditLogo.png">\n';
      }
      else if(thumb == "nsfw") {
        html += '<img src="/gfx/redditNSFW.png">\n';
      }
      else if((thumb.indexOf('http') === -1) && (thumb != "nsfw")) {
        html += '<img src="/gfx/redditSub.png">\n';
      }
      else {
        html += '<img src="'+thumb+'">\n';
      }
      html += '<h3><a href="'+extUrl+'" target="_blank">'+title+'</a></h3>\n';
      html += '<p class="subrdt">posted to <a href="'+subRedditUrl+'" target="_blank">'+subReddit+'</a> '+timeAgo+'</p>';
      html += '<p class="subrdt"><a href="'+redditUrl+'" target="_blank">view on reddit</a></p>';
      html += '</div></li><hr>\n';
  	}

  	htmlOutput(html, boxId);
  });
}

$('.subRForm').on('submit', function(event){
  var getSubRForm = $(event.currentTarget.firstElementChild).val();
  //replace multiple spaces with no space
  getSubRForm = getSubRForm.replace(/ +/g, ""); 
  
  if(getSubRForm == "/r/" || getSubRForm === "" || getSubRForm == "/r"){
    return false;
  }

  $.ajax({
      type: "GET",
      url: '/',
      data: {"redditId" : event.target.name, "subReddit" : getSubRForm},
      success: function (data){
          console.log("ajax in reddit.js success");
      },
      error: function (data){
          console.log("ajax in reddit.js failed");
      }
  });

  displayReddit(getSubRForm, event.target.name);
  event.preventDefault();
});

function htmlOutput(html, boxId){
	html += '</ul>';
	$('#redditBox' + boxId).html(html);
}

/**
* Return time since link was posted
* http://stackoverflow.com/a/3177838/477958
**/
function timeSince(date) {
    var seconds = Math.floor(((new Date().getTime()/1000) - date))

    var interval = Math.floor(seconds / 31536000);

    if (interval >= 1) {
      if(interval == 1) return interval + " year ago";
      else 
        return interval + " years ago";
    }
    interval = Math.floor(seconds / 2592000);
    if (interval >= 1) {
      if(interval == 1) return interval + " month ago";
      else
        return interval + " months ago";
    }
    interval = Math.floor(seconds / 86400);
    if (interval >= 1) {
      if(interval == 1) return interval + " day ago";
      else
        return interval + " days ago";
    }
    interval = Math.floor(seconds / 3600);
    if (interval >= 1) {
      if(interval == 1) return interval + " hour ago";
      else
        return interval + " hours ago";
    }
    interval = Math.floor(seconds / 60);
    if (interval >= 1) {
      if(interval == 1) return interval + " minute ago";
      else
        return interval + " minutes ago";
    }
    return Math.floor(seconds) + " seconds ago";
}

//hides the reddit text field if the user is not editing
function redditHide(){
  if(editBox == 1){
    if(redditBox){
        $('.subRField').attr("type", "text");
    }
  }
  else{
    if(redditBox){
        $('.subRField').attr("type", "hidden");
    }
  }
}

