//document.getElementById('logoutbutton').style.display ="none";
//document.getElementById('course_library_menu_item').style.display ="inline";

function openWin()
{

	 $.ajax({
      url: "/logout",
      type: "POST",
      async:false,
      success: function(){
         success = true
      }
    });
    if(success){ //AND THIS CHANGED
     window.open("https://online.beaconlearning.in/sign_out","_self")
    }

}

$(document).ready(function(){
  // Identify the logout link in the top menu
  var logout_button = $('#calendar_menu_item'); 
  // Create the support button html string
  var support_button = "<li class='menu-item'><a href='https://online.beaconlearning.in/courses' class='menu-item-no-drop'>Course library</a></li>";
  $(support_button).insertAfter($(logout_button));
  
});
