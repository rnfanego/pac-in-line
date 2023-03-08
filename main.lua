function _init()
	cls()
	--variables
	points=0
	things={}
	add_things={}
	del_things={}
	patterns = {}
	current_scene=title
	current_scene.init()
	
	--constants
	bpillspr=19
	up_line=44
	dw_line=76
	sprspeed=10	
end

function _update()
	current_scene.update()
end

function _draw()
	current_scene.draw()											
end
