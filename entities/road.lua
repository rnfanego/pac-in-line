road = object:new({
	create = function(level)
		local r = road:new({current_level=level})
		r:init()
		return r
	end,
	init = function(self)
		self.columns=self:generateColumns(self.current_level.connector)
		for c in all(self:generateColumns(rnd(self.current_level.superblocks))) do
			add(self.columns,c)
		end	
	end,

	update = function(self)
		if (count(self.columns) == 0) then
			self.columns=self:generateColumns(rnd(self.current_level.superblocks))
		end
	end,

	draw = function(self)
	end,

	getColumn = function(self)
		local c = self.columns[1]
        deli(self.columns,1)
        return c
	end,

	generateColumns=function(self,sbkey)
		local columns = {}
		if (sbkey == nil or sbkey == "") then
			return {}
		end
		local superblock = superblocks[sbkey]

		for block in all(superblock.blocks) do	
			for c in all(self:addBlock(blocks[block])) do
				add(columns,c)
			end
			
			for i=1,superblock.spaces do
				local e = self:addPattern(pattern.createWithPattern(patterns_definitions.EMPTY_COL),1)
				for c in all(e) do
					add(columns,c)
				end		
			end
		end

		return columns
	end,

	addBlock = function(self,aBlock)
		local columns = {}
		local initial_column = 1
		for e in all(aBlock) do
			if(#e > 0) then
				for pdef in all(e) do
					local p = pattern.createWithPattern(patterns_definitions[pdef])
					local j = initial_column
					t=p:get_thing()
					while (t != nil) do
						local column = columns[j]
						if (column == nil) then
							column = {}
						end
						
						if(t[rows.r1] != nil) then
							column[rows.r1] = t[rows.r1] 
						end

						if(t[rows.r2] != nil) then
							column[rows.r2] = t[rows.r2] 
						end

						if(t[rows.r3] != nil) then
							column[rows.r3] = t[rows.r3] 
						end

						if (columns[j] == nil) then
							add(columns,column,j)
						end

						t=p:get_thing()
						j+=1
					end
				end
			end
			
			initial_column+=1
		end
		return columns
	end,

	addPattern = function(self,aPattern,initialValue)
		local columns = {}

		local j = initialValue

		t=aPattern:get_thing()
		while (t != nil) do
			local column = columns[j]
			if (column == nil) then
				column = {}
			end
			
			if(t[rows.r1] != nil) then
				column[rows.r1] = t[rows.r1] 
			end

			if(t[rows.r2] != nil) then
				column[rows.r2] = t[rows.r2] 
			end

			if(t[rows.r3] != nil) then
				column[rows.r3] = t[rows.r3] 
			end

			if (columns[j] == nil) then
				add(columns,column)
			end

			t=aPattern:get_thing()
			j+=1
		end
		return columns
	end
})