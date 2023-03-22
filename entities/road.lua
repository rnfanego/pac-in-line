road = object:new({
	create = function(level)
		local r = road:new({current_level=level})
		r:init()
		return r
	end,
	init = function(self)
		self.connectorGenerated=false
		self.columns=self:generateColumns(self.current_level.connector)
		add(self.columns, rnd(self.current_level.superblocks))
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
			self:addPattern(compositions.EMPTY_COL)
		end
	end,

	addBlock = function(self,block)
	end,

	addPattern = function(self,block)
	end
})