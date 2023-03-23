road = object:new({
	create = function(level)
		local r = road:new({current_level=level})
		r:init()
		return r
	end,
	init = function(self)
		self.connectorGenerated=false
		--self.columns=self:generateColumns(self.current_level.connector)
		--add(self.columns, self:generateColumns(rnd(self.current_level.superblocks)))
	end,

	update = function(self)
		if (count(self.columns) == 0) then
			add(self.columns, self:generateColumns(rnd(self.current_level.superblocks)))
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
		if (sbkey == nil) then
			return {}
		end
		local superblock = superblocks[sbkey]

		for block in all(superblock.blocks) do			
			add(self:addBlock(block),columns)
		end
		
		for i=1,superblock.spaces do
			add(self:addPattern(EMPTY_COL),columns)
		end
	end,

	addBlock = function(self,aBlock)
		local columns = {}
		local initial_column = 1
		for e in all(aBlock) do
			for pdef in all(e) do
				local p = pattern.createWithPattern(patterns_definitions[pdef])

				add(self:addPattern(p,initial_column),columns)
			end
			initial_column+=1
		end
		return columns
	end,

	addPattern = function(self,aPattern,initialValue)
		local columns = {}

		local j = initialValue

		t=p.get_thing()
		while (t != nil) do
			local column = columns[j]
			if (column == nil) then
				column = {}
				add(column,columns)
			end
			
			if(t[rows.r1] != nil) then
				column[rows.r1] = t[rows.r1] 
				--add(column, t[rows.r1])
			end

			if(t[rows.r2] != nil) then
				column[rows.r2] = t[rows.r2] 
				--add(column, t[rows.r2])
			end

			if(t[rows.r3] != nil) then
				column[rows.r3] = t[rows.r3] 
				--add(column, t[rows.r3])
			end

			t=p.get_thing()
			j+=1
		end

		return columns
	end
})