badgeMaker  =
  u : "avnerner"  # Set your coderwall username here 
  targetElement : "cw-container"  # Set the target container ID here.
  getTemplate : (badge)  ->
    alt = badge.name + " : " + badge.description
    img = "<img src='" + badge.badge + "' class='badge' title='" + alt +"'/>" 
    return "<li><a href='http://coderwall.com/"+badgeMaker.u+"' target='_blank'>" + img + "</a></li>"

  generateBadges : (data) ->
    badges = data.data.badges
    html += badgeMaker.getTemplate badge  for badge in badges
    document.getElementById(badgeMaker.targetElement).innerHTML = html


script = document.createElement("script")
script.src = "http://coderwall.com/"+badgeMaker.u+".json?callback=badgeMaker.generateBadges"
document.getElementsByTagName('head')[0].appendChild(script)