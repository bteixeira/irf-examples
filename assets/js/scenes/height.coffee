
Scene = window.irf.Scene
Sprite = window.irf.Sprite
Map = window.irf.Map
Camera = window.irf.Camera

sceneclass = window.astr.sceneclass

sceneclass["height"] = class SceneHeight extends Scene
  constructor: (@parent) ->
    simple = new Sprite
      "texture": "images/beach3d.png"
      "width": 107
      "height": 107
      "innerWidth": 87
      "innerHeight": 87
      "key":
        "00": 12
        "dd": 12
    @background = new Map
      "mapfile": "maps/minimap.png"
      "pattern": "simple"
      "sprite": simple
    @camera = new Camera {"projection": "normal", "vpWidth": @parent.width, "vpHeight": @parent.height}

  update: (delta) ->

  render: (ctx) ->
    @background.render(ctx, @camera)
