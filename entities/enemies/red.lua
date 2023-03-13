red = object:new({
	sprplus=5,
    w=7,
    h=8,
    ghost_type=1,
    init = function(self)
        self.spr=5
        self.t=ghost_type
	end,

	update = function(self)
        self.x-=1
        self.spr=alternate(self.sprplus, sprspeed, 2)
	end,

	draw = function(self)
        spr(self.spr,self.x,self.y)
	end,

    isScorable = function(self)
        return false
	end,

    isCollisionable = function(self)
        return true
	end,

    create = function(x,y)
        g = red:new({x=x,y=y})
        g:init()
        return g
    end
})