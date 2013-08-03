
function openWin()
{
  $.ajax({
    url:"/logout",
    type:"POST",
    async:!1,
    success:function(){
      success=!0
    }
  }),success&&window.open("https://online.beaconlearning.in/sign_out","_self")
}

$(document).ready(function(){
  var n=$("#calendar_menu_item"),e="<li class='menu-item'><a href='https://online.beaconlearning.in/my_courses' class='menu-item-no-drop'>My Courses</a></li>";$(e).insertAfter($(n))});