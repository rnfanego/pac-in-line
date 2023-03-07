empty = object:new({
    --w=7,
    --h=8,
    --ghost_type=1,
    init = function(self)
        --self.spr=5
        --.t=ghost_type
	end,

	update = function(self)
        self.x-=1
	end,

	draw = function(self)
        --(self.spr,self.x,self.y)
	end,

    isScorable = function(self)
        return false
	end,

    isCollisionable = function(self)
        return false
	end,

    create = function(x,y)
        e = empty:new({x=x,y=y})
        e:init()
        return e
    end
})