function _init()
	cls()
	--variables
	sprspeed=10
	pacx=24
	pacy=52
	points=0
	things={}
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
	pacspr=1
	pacsprplus=1
	pill_type=0
	ghost_type=1
	
	initialstate()
end

function _update()
	if (gameover) then
		if (btn(❎)) then
			things={}
			initialstate()
			cls()
			gameover = false
		end 
	else
		pacspr=alternate(pacsprplus, sprspeed, 2)
		ghstredspr=alternate(ghstredplus, sprspeed, 2)
		
		button_selection()
		
		for t in all(things) do
			printh("things size:"..count(things),"pac_in_line/log")
			t.x-=1
			
			if (t.x == 95) then
				if(irndb(1,5) == 1) then
					addghost(things,t)
				else
					addpill(things,t)
				end
			end
			
			if (t.x < 0) then
				del(things, t)
			else
				if (collide_pac(t)) then
					if (t.t == pill_type) then
						del(things, t)
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
		spr(pacspr,pacx,pacy)			
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

function addpill(things,t)
	add(things,{x=irndb(120,128),y=t.y,s=pillspr,t=pill_type,w=3,h=2})
end

function addghost(things,t)
	add(things,{x=irndb(120,128),y=t.y,s=ghstredspr,t=ghost_type,w=7,h=8})
end

function collide_pac(t)
	if (pacy == t.y and
	    t.x >= (pacx-t.w) and
	    t.x < (pacx+t.w)) then
		return true
	end
	return false
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
	if (btn(⬅️)) then
	 --[[pacx=max(0,pacx-1)
		pacfx=true
		pacfy=false
		pacsprplus=1]]
	else
		if (btn(➡️)) then
		 --[[pacx=min(120,pacx+1)
			pacfx=false
			pacfy=false
			pacsprplus=1--]]
		else
			 if (btnp(⬆️) and pacy>(up_line+8)) then
				 pacy=max(0,pacy-8) 
					pacfx=false
					pacfy=false
					pacsprplus=1 
				else
					if (btnp(⬇️) and pacy<(dw_line-8)) then
						pacy=min(120,pacy+8) 
						pacfx=false
						pacfy=false
						pacsprplus=1
					end 
				end
		end
	end
end
