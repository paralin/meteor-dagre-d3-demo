graphBuilt = false
transition = (selection)->
  selection.transition().duration(500)

global = @
# Create a new directed graph
Meteor.startup ->
  global.g = new ReactiveDagre("svg g")

buildGraph = ->
  if !graphBuilt
    graphBuilt = true
    g.layout.nodeSep(20).rankDir("LR")
    g.addNode "kspacey", {label: "Kevin Spacey"}, true
    g.addNode "awesome", {label: "Someone Awesome"}, true
    g.addEdge null, "kspacey", "awesome", {label: "Telling Lies in America"}, true

Template.dagre.rendered = ->
  buildGraph()
  g.render()
