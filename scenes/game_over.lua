gameover = object:new({
    init = function(self)
        sfx(2,1)
	end,

	update = function(self)
        if (btn(❎)) then
            current_scene = game
            current_scene.init()
		end 
	end,

	draw = function(self)
        sfx(-1,0)
		rectfill(23,47,105,67,12)
		print("game over",45,50,8)
		print("press ❎ to continue",25,60,8)
	end
})