function _init()
	cls()
	--variables
	sprspeed=10
	points=0
	things={}
	add_things={}
	del_things={}
	patterns = {}
	gameover=false
	
	--constants
	ghstredspr=5
	ghstredplus=5
	pillspr=18
	bpillspr=19
	up_line=44
	dw_line=76
	row1y=52
	row2y=60
	row3y=68
	pill_type=0
	ghost_type=1
	pac.init()
	
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
		pac.update()
		ghstredspr=alternate(ghstredplus, sprspeed, 2)
		
		button_selection()

		if(#del_things > 0) then
			for i=#del_things,1,-1 do
				deli(things, del_things[i])
			end
		end

		for at in all(add_things) do
			add(things, at)
		end

		add_things = {}
		del_things = {}
		
		for i=1,#things do
			t=things[i]
			t.x-=1
			
			if (t.x == 95) then
				if(irndb(1,5) == 1) then
					add(add_things,{x=irndb(120,128),y=t.y,s=ghstredspr,t=ghost_type,w=7,h=8})
				else
					add(add_things,{x=irndb(120,128),y=t.y,s=pillspr,t=pill_type,w=3,h=2})
				end
			end
			
			if (t.x < 0) then
				add(del_things, i)
			else
				if (pac.collide(t)) then
					if (t.t == pill_type) then
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
		pac.draw()	
		draw_map()
		for t in all(things) do
			if (t.t == pill_type) then
				spr(t.s,t.x,t.y)
			else
				spr(ghstredspr,t.x,t.y)
			end
		end
		print_values()
	end												
end

function initialstate()
	points=0
	add(things,{x=irndb(100,120),y=row1y,s=pillspr,t=0,w=2,h=2})
	add(things,{x=irndb(100,120),y=row2y,s=pillspr,t=0,w=2,h=2})
	add(things,{x=irndb(100,120),y=row3y,s=pillspr,t=0,w=2,h=2})
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
		pac.moveUp()
	else
		if (btnp(⬇️) and pac.y<(dw_line-8)) then
			pac.moveDown()
		end 
	end
end
