<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	body {font-size: 1em}
	
	#container {max-width: 75em; margin: 0 auto;}
	
	#pdfviewer {
	    float:left;
	    width:54%;
	}
	
	#xmleditor1 {
	    float:left;
	    width:33%;
	}
	
	#footer {
	    clear:both;
	}
</style>

<style>
.tabs{
  overflow:hidden;
  clear:both;
 
}
.tabs ul{
  list-style-type:none;
  bottom: -1px;
  position:relative;
}
.tabs li{
  float:left;
}
 
.tabs a{
  display:block;
  padding:5px 10px;
  background-color: #EEE;
  color: #000;
  text-decoration: none;
  margin: 0 4px;
  border-top:1px solid #CCC;
  border-left:1px solid #DDD;
  border-right:1px solid #DDD;
  font:13px/18px verdana,arial,sans-serif;
  border-bottom:1px solid #CCC;
}
.tabs a.active{
  background-color: #fff;
  border-bottom:1px solid #fff;
}
.tabs div{
  clear: both;
  border:1px solid #CCC;
  padding:5px;
  font-family:verdana;
  font-size:13px;
  background-color: #fff;
  display:none;
}
</style>
<style>
	select {
	    opacity: 0.5;
	}
	ul#selectUl {
	    /* width: 8em; */
	    line-height: 2em;
	    list-style-type: none;
	}
	
	ul#selectUl li {
	    display: list-item;
	    width: 100%;
	    height: 2em;
	    border:1px solid #ccc;
	    border-top-width: 0;
	    text-indent: 1em;
	    background-color: #f90;
	}
	ul#selectUl li:first-child {
	    border-top-width: 1px;
	}
	
	ul#selectUl li.unselected {
	    display: none;
	    background-color: #fff;
	}
	ul#selectUl:hover li.unselected {
	    background-color: #fff;
	}
	ul#selectUl:hover  li,
	ul#selectUl:hover  li.unselected {
	    display: list-item;
	}
	ul#selectUl:hover li {
	    background-color: #fc0;
	}
	ul#selectUl li:hover,
	ul#selectUl li.unselected:hover {
	    background-color: #f90;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thomson Digital</title>
</head>
<body>
<div id="container">
	<div id="header">
        <p>${message}</p>
    </div>
  <div id="pdfviewer">
		<!-- <iframe id="pdfview" src="resources/sample.pdf" width="600" height="400" scrolling="yes"></iframe> -->
		<div class="tabs">
			 <ul>
			 <li><a href="#tab1" class="active">PDF VIEWER</a></li>
			 <li><a href="#tab2">DAT FILE</a></li>
			 </ul>
			 <div id="tab1">
			 <h1>PDF VIEWER</h1>
				 <iframe id="pdfview" src="resources/sample.pdf" width="600" height="400" scrolling="yes"></iframe>
			 </div>
			 
			 <div id="tab2">
			 <h1>DAT FILE</h1>
				  <iframe id="pdfview" src="resources/sample.dat" width="600" height="400" scrolling="yes"></iframe>
			 </div>	 
		 </div>
		
    </div>
    


    <div id="commandbutton" style="float: left; width:150px;">
		<select name="size">
		    <option value="small">_ref1</option>
		    <option value="medium">_ref1</option>
		    <option value="large">_ref1</option>
		</select>
		
		<ul id="selectUl">
		    <li>_ref1</li>
		    <li>_ref1</li>
		    <li>_ref1</li>
		</ul>
    </div>
     <div id="xmleditor1">	
			 <h1>DAT FILE</h1>
				  <iframe id="pdfview" src="resources/sample.dat" width="600" height="400" scrolling="yes" content-editable="true"></iframe>
		 </div>
		

    </div>
    <div id="footer">
        <p>Footer</p>
    </div>
</div>
</body>
 <script src="resources/js/jquery-1.8.0.min.js"></script>
 <script src="resources/ckeditor/ckeditor.js"></script>
 <script>
$(document).ready(function()
{
    $("#xmleditor").load("resources/sample.dat");
});

$(document).ready(function(){
    //autosave();
    editor = CKEDITOR.replace( 'xmleditor', {
         language: 'fr',
         uiColor: '#8d8d8d'
     });
});
</script>
  
  
  <!-- <script src="tabs.js" type="text/javascript"></script> -->
<script>
window.addEventListener("load", function() {
    makeTabs(".tabs");
});
</script>
<script>
function makeTabs(selector) {
 
    tab_lists_anchors = document.querySelectorAll(selector + " li a");
    divs = document.querySelector(selector).getElementsByTagName("div");
    for (var i = 0; i < tab_lists_anchors.length; i++) {
        if (tab_lists_anchors[i].classList.contains('active')) {
            divs[i].style.display = "block";
        }
 
    }
 
    for (i = 0; i < tab_lists_anchors.length; i++) {
 
        document.querySelectorAll(".tabs li a")[i].addEventListener('click', function(e) {
 
            for (i = 0; i < divs.length; i++) {
                divs[i].style.display = "none";
            }
 
            for (i = 0; i < tab_lists_anchors.length; i++) {
                tab_lists_anchors[i].classList.remove("active");
            }
 
            clicked_tab = e.target || e.srcElement;
 
            clicked_tab.classList.add('active');
            div_to_show = clicked_tab.getAttribute('href');
 
            document.querySelector(div_to_show).style.display = "block";
 
        });
    }
 
}
</script>

<script>

$('#selectUl li:not(":first")').addClass('unselected');
$('#selectUl').hover(
    function(){
        $(this).find('li').click(
            function(){
                $('.unselected').removeClass('unselected');
                $(this).siblings('li').addClass('unselected');
                var index = $(this).index();
                $('select[name=size]')
                    .find('option:eq(' + index + ')')
                    .attr('selected',true);
            });
    },
    function(){
    });
    
</script>

</html>
