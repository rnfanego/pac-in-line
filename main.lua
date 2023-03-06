function _init()
	cls()
	--variables
	points=0
	things={}
	add_things={}
	del_things={}
	patterns = {}
	gameover=false
	
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

		--if (#add_things == 0) then
		--	add_things = patternGenerator:getThings()
		--end

		--if (#add_things > 0) then
		--	add(things, add_things[1])
		--	deli(add_things, 1)
		--end
		
		for at in all(add_things) do
			add(things, at)
		end

		add_things = {}
		del_things = {}
		
		for i=1,#things do
			t=things[i]
			
			t:update()
			
			if (t.x == 115) then
				--[[if(irndb(1,5) == 1) then
					add(add_things,ghost.create(irndb(127,127),t.y))
				else
					add(add_things,pill.create(irndb(127,127),t.y))
				end]]
				printh("type"..#patternGenerator:get_thing(),"pac_in_line/log")
				add(add_things, patternGenerator:get_thing())
			end
			
			if (t.x < 0) then
				add(del_things, i)
			else
				if (pac:collide(t)) then
					--printh("type"..t.t,"pac_in_line/log")
					if (t.isScorable()) then
						add(del_things, i)
						points+=1
					else
						gameover=true
					end
				end
			end
		end
	end
end

function _draw()
	if (gameover) then
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
	--add(add_things,pill.create(irndb(127,127),row1y))
	--add(add_things,pill.create(irndb(127,127),row2y))
	--add(add_things,pill.create(irndb(127,127),row3y))
end

function draw_map()
	for i=0,15 do
		spr(16,0+(i*8),up_line)
		spr(17,0+(i*8),dw_line)
	end
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
