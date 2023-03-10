game = object:new({
    init = function(self)
        initialstate()
        cls()
	end,

	update = function(self)
        pac:update()
		
		button_selection()

		if(#del_things > 0) then
			for i=#del_things,1,-1 do
				deli(things, del_things[i])
			end
		end
		
		for at in all(add_things) do
			for a in all(at) do
				add(things, a)
			end
		end

		add_things = {}
		del_things = {}
		
		local generated = false
		for i=1,#things do
			t=things[i]
			
			t:update()
			
			if (t.x == 115 and not generated) then
				add(add_things, patternGenerator:get_thing())
				generated = true
			end
			
			if (t.x < 0) then
				add(del_things, i)
			else
				if (pac:collide(t)) then
					--printh("type"..t.t,"pac_in_line/log")
					if (t.isScorable()) then
						add(del_things, i)
						points+=1
						sfx(1,1)
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
	pac:init()
	patternGenerator:init()
	add(add_things, patternGenerator:get_thing())
end