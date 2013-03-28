<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
/* Z-index of #mask must lower than #boxes .window */
#mask {
  position:absolute;
  z-index:9000;
  background-color:#000;
  display:none;
}
  
#boxes .window {
  position:fixed;
  width:440px;
  height:200px;
  display:none;
  z-index:9999;
  padding:20px;
}
/* Customize your modal window here, you can add background image too */
#boxes #dialog {
  width:375px; 
  height:203px;
}
</style>
<script>
$(document).ready(function() {    
    //select all the a tag with name equal to modal
    $('a[name=modal]').click(function(e) {
        //Cancel the link behavior
        e.preventDefault();
        //Get the A tag
        var id = $(this).attr('href');
    
        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
    
        //Set height and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight});
        
        //transition effect        
        $('#mask').fadeIn(1000);    
        $('#mask').fadeTo("slow",0.8);    
    
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();
              
        //Set the popup window to center
        $(id).css('top',  winH/2-$(id).height()/2);
        $(id).css('left', winW/2-$(id).width()/2);
    
        //transition effect
        $(id).fadeIn(2000); 
    
    });
    
    //if close button is clicked
    $('.window .close').click(function (e) {
        //Cancel the link behavior
        e.preventDefault();
        $('#mask, .window').hide();
    });        
    
    //if mask is clicked
    $('#mask').click(function () {
        $(this).hide();
        $('.window').hide();
    });            
    
});
</script>
</head>
<body>
<!-- #dialog is the id of a DIV defined in the code below -->
<a href="#dialog" name="modal">Simple Modal Window</a>
<div id="boxes">
    
    <!-- #customize your modal window here -->
    <div id="dialog" class="window">
        <b>Testing of Modal Window</b> | 
        
        <!-- close button is defined as close class -->
        <a href="#" class="close">Close it</a>
    </div>
    
    <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->    
     <div id="mask"></div>
</div>
</body>
</html>