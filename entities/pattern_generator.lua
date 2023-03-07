patternGenerator = object:new({
    init = function(self)
		self.patterns = {}
		self:generatePatterns()
	end,

	update = function(self)
	end,

	generatePatterns = function(self)
		add(self.patterns, pattern.create())
		add(self.patterns, pattern.create())
		add(self.patterns, pattern.create())
	end,

	get_thing = function(self)
		local p = self.patterns[1]
		--printh("is_empty"..tostr(count(p:get_things()) == 0),"pac_in_line/log")
        --printh("is_empty"..(count(p:get_things())),"pac_in_line/log")
		if (p:is_empty()) then
			deli(self.patterns, 1)
			
			if (#self.patterns == 0) then
				self:generatePatterns()
			end
			
			p = self.patterns[1]
		end

		return p:get_thing()
	end
})