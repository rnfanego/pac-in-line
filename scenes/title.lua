title = object:new({
    init = function(self)
	end,

	update = function(self)
        if (btn(❎)) then
			current_scene = game
            current_scene.init()
		end 
	end,

	draw = function(self)
        spr(7, 30, 20, 8, 7)
        print("press ❎ to start",30,85,8)
	end
})