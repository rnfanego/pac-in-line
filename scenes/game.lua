game = object:new({
    init = function(self)
        initialstate()
        cls()
	end,

	update = function(self)
        pac:update()
		current_road:update()
		
		button_selection()

		if(#del_things > 0) then
			for i=#del_things,1,-1 do
				deli(things, del_things[i])
			end
		end
		
		for at in all(add_things) do
			if(at[rows.r1] != nil) then
				add(things, at[rows.r1])
			end

			if(at[rows.r2] != nil) then
				add(things, at[rows.r2])
			end

			if(at[rows.r3] != nil) then
				add(things, at[rows.r3])
			end
		end

		add_things = {}
		del_things = {}
		
		local generated = false
		for i=1,#things do
			t=things[i]
			
			t:update()
			
			if (t.x >= 115 and t.x <= 116 and not generated) then
				add(add_things, current_road:getColumn())
				generated = true
			end
			
			if (t.x < 0) then
				add(del_things, i)
			else
				if (pac:collide(t)) then
					--printh("type"..t.t,"pac_in_line/log")
					if (t:isScorable()) then
						add(del_things, i)
						points+=t:getPoints()
						t:playSound()

						if(current_level:isFinished(points)) then
							current_level = current_level:next()
							current_road=road.create(current_level)
						end
					else
                        current_scene = gameover
                        gameover.init()
					end
				end
			end
		end
	end,

	draw = function(self)
        cls()
		pac:draw()
		draw_map()
		for t in all(things) do
			t:draw()
		end
		print_values()
	end
})

function draw_map()
	map()
end

function print_values()
	print("points: "..points)
	print(""..current_level.name,100,0)
end

function button_selection()
	if(btn(⬅️)) then
		stop()
	end

	if (btnp(⬆️) and pac.y>(up_line+8)) then
		pac:moveUp()
	elseif (btnp(⬇️) and pac.y<(dw_line-8)) then
		pac:moveDown()		
	end
end

function initialstate()
	things={}
	add_things={}
	del_things={}
	points=0
	current_level=level.create(2)
	sprspeed=10.0
	current_road=road.create(current_level)
	pac:init()
	add(add_things, current_road:getColumn())
end