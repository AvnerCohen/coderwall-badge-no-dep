	# Code snippet to embed Coderwall echivments with no dependencies (namly - Jquery)
  This is a very simple Javascript/CoffeScript code I used in a my online CV site so that I
  could easily embed coderwall badges with no dependency on Jquery.

The implementation is very simple to embed in your site:

The Javascrtip code, either in an external file or embedded in your HTML: 
```javascript
var badgeMaker = {
  u : "[USERNAME]", //**@ Set your coderwall username here 
  targetElement : "cw-container", //**@ Set the target container ID here.
  getTemplate: function(badge) {
    var alt, img;
    alt = badge.name + " : " + badge.description;
    img = "<img src='" + badge.badge + "' class='badge' title='" + alt +"'/>" ;
    return "<li><a href='http://coderwall.com/"+badgeMaker.u+"' target='_blank'>" + img + "</a></li>";
  },
  generateBadges: function(data) {
    var badge, badges = data.data.badges, html = "", _i, _len;
    for (_i = 0, _len = badges.length; _i < _len; _i++) {
      badge = badges[_i];
      html += badgeMaker.getTemplate(badge);
    }
    document.getElementById(badgeMaker.targetElement).innerHTML = html;
  }
};
var script = document.createElement("script");
script.src = "http://coderwall.com/"+badgeMaker.u+".json?callback=badgeMaker.generateBadges";

document.getElementsByTagName('head')[0].appendChild(script);
```

A suggested stylesheet:
```css
ul#cw-container{
	list-style-type:none;
	width:250px;
	}
ul#cw-container li{
	display:inline-block;
}
ul#cw-container li img.badge:hover{
  -webkit-transform: scale(1.5, 1.5);
  -moz-transform: scale(1.5, 1.5);
  -ms-transform: scale(1.5, 1.5);
  -o-transform: scale(1.5, 1.5);
  transform: scale(1.5, 1.5);
}
ul#cw-container li img.badge{
width:60px;
height:60px;
border:none;
zoom:1;
 -webkit-transition: all .3s ease-in;
	-moz-transition: all .3s ease-in;
		 transition: all .3s ease-in;
}
```

That's it. Enjoy!


Avner - https://twitter.com/avnerner