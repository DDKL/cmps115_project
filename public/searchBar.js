if(searchClick==1){
                document.getElementById('searchBar').innerHTML= 'disable search bar';
              }else{
                document.getElementById('searchBar').innerHTML= 'enable search bar';
              }
          $('#searchBar').click(function(){
              console.log("Shield-bro was here");
              searchClick++;
              searchClick%=2;
              if(searchClick==1){
                document.getElementById('searchBar').innerHTML= 'disable search bar';
                document.getElementById('displaySearchBar').innerHTML= 'Search-bar has been enabled! Head back to Home to use';
              }else{
                document.getElementById('searchBar').innerHTML= 'enable search bar';
                document.getElementById('displaySearchBar').innerHTML= 'Search-bar is now disabled';
              }
              console.log(searchClick);
            $.ajax({
              type: "GET",
              url: '/',
              data: {"searchClick" : searchClick},
              async: false,
              success: function (data){
                  console.log("searchClick stored");
              },
              error: function (data){
                  console.log("searchClick failed");
              }
            });
          })   