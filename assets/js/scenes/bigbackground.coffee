
Sprite = window.irf.Sprite
Background = window.irf.Background
Scene = window.irf.Scene

Spaceship = window.astr.Spaceship
sceneclass = window.astr.sceneclass

sceneclass["bigbg"] = class SceneBigBackground extends Scene

  constructor: (@parent) ->
    backgroundsprite = new Sprite
      "texture": "images/weltraum.jpg"
      "width": 500
      "height": 500
    @background = new Background backgroundsprite

    @spaceships = []
    for i in [0..3]
      @spaceships[i] = new Spaceship(@parent.eventManager)

  update: (delta) ->
    for spaceship in @spaceships
      spaceship.update delta

  render: (ctx) ->
    # HACK: otherwise background was not shown completly
    ctx.save()
    ctx.translate 250, 250
    @background.render(ctx)
    ctx.restore()

    for spaceship in @spaceships
      spaceship.render ctx

