function _init()
	cls()
	--variables
	points=0
	things={}
	add_things={}
	del_things={}
	patterns = {}
	gameover=false
	current_scene=title
	
	--constants
	bpillspr=19
	up_line=44
	dw_line=76
	sprspeed=10
	
	initialstate()
end

function _update()
	if (gameover) then
		if (btn(❎)) then
			things={}
			add_things={}
			del_things={}
			initialstate()
			cls()
			gameover = false
		end 
	else
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
						gameover=true
						sfx(2,1)
					end
				end
			end
		end
	end
end

function _draw()
	if (gameover) then
		sfx(-1,0)
		rectfill(23,47,105,67,12)
		print("game over",45,50,8)
		print("press ❎ to continue",25,60,8)
	else
		cls()
		pac:draw()
		draw_map()
		for t in all(things) do
			t:draw()
		end
		print_values()
	end												
end

function initialstate()
	points=0
	pac:init()
	patternGenerator:init()
	add(add_things, patternGenerator:get_thing())
end

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
