
// Pre load images for rollover
if (document.images) {
  smile = new Image;
  nosmile = new Image;

  smile.src = "/assets/beaconslogop.png";
  nosmile.src = "/assets/zbeaconslogo.png";
}
function swapImage(thisImage,newImage) {
  if (document.images) {
    document[thisImage].src = eval(newImage + ".src");
  }
}
function logout_lms(url)
{ 
var logout_url=url+"logout"
myWindow =window.open(logout_url)
 $.ajax({
  url:logout_url,
      type: "GET",
      crossDomain: true,
      async:false,
    success: function(){

 }
   });
myWindow.close();

}
