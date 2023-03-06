patternGenerator = object:new({
    init = function(self)
		patterns = {}
		self:generatePatterns()
	end,

	update = function(self)
	end,

	generatePatterns = function(self)
		add(patterns, pattern.create())
		add(patterns, pattern.create())
		add(patterns, pattern.create())
	end,

	get_thing = function(self)
		local p = patterns[1]
		--printh("is_empty"..tostr(count(p:get_things()) == 0),"pac_in_line/log")
        --printh("is_empty"..(count(p:get_things())),"pac_in_line/log")
		if (p:is_empty()) then
			deli(patterns, 1)
			
			if (#patterns == 0) then
				self:generatePatterns()
			end
			
			p = patterns[1]
		end

		return p:get_thing()
	end,

	--[[getThings = function(self)
		things = {}
		if (#patterns == 0) then
			self.generatePatterns()
		end

		for p in patterns do
			for t in p.things do
				add(things,t)
			end
		end
		patterns = {}
		return things
	end]]
})