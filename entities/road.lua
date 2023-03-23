road = object:new({
	create = function(level)
		local r = road:new({current_level=level})
		r:init()
		return r
	end,
	init = function(self)
		self.connectorGenerated=false
		--self.columns=self:generateColumns(self.current_level.connector)
		--add(self.columns, rnd(self.current_level.superblocks))
	end,

	update = function(self)
	end,

	draw = function(self)
	end,

	generateColumns=function(self,sbkey)
		if (sbkey == nil) then
			return {}
		end
		local superblock = superblocks[sbkey]

		for block in all(superblock.blocks) do			
			self:addBlock(block)
		end
		
		for i=1,superblock.spaces do
			self:addPattern(EMPTY_COL)
		end
	end,

	addBlock = function(self,block)
		local columns = {}
		local initial_column = 1
		for e in all(block) do
			for pdef in all(e) do
				local p = pattern.createWithPattern(patterns_definitions[pdef])
				local j = initial_column

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
			end
			initial_column+=1
		end
	end,

	addPattern = function(self,aPattern)
		--seguir aca
	end
})