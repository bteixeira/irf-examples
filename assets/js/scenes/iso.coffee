{ Camera, Sprite, Scene, Map, Vector } = @irf

class SceneIso extends Scene
    constructor: (@parent) ->
        @camera = new Camera {"projection": "iso", "vpWidth": @parent.params.width, "vpHeight": @parent.params.height}
        @camera.coor = new Vector(100, 100)

        beach3d = new Sprite
            "texture": "images/beach3d.png"
            "width": 107
            "height": 107
            "innerWidth": 87
            "innerHeight": 87
            "key":
                "dd00dddd": 0
                "00dddddd": 1
                "dddd00dd": 2
                "dddddd00": 3
                "dd00dd00": 4
                "0000dddd": 5
                "00dd00dd": 6
                "dddd0000": 7
                "0000dd00": 8
                "000000dd": 9
                "00dd0000": 10
                "dd000000": 11
                "dddddddd": 12
                "00000000": 13
                "dd0000dd": 14
                "00dddd00": 15

        @background = new Map
            "mapfile": "maps/map.png"
            "pattern": "square"
            "sprite": beach3d

    update: (delta) ->
        dif = 30
        if @parent.keyboard.key("right")
            @camera.coor.x += dif
            @camera.coor.y -= dif
        else if @parent.keyboard.key("left")
            @camera.coor.x -= dif
            @camera.coor.y += dif
        else if @parent.keyboard.key("up")
            @camera.coor.x -= dif
            @camera.coor.y -= dif
        else if @parent.keyboard.key("down")
            @camera.coor.x += dif
            @camera.coor.y += dif


    render: (ctx) ->
        # this is so not intuitive
        # you should only have to apply a camera once
        @camera.apply ctx, =>
            @background.render(ctx, @camera)


@astr.Asteroids.addScene SceneIso