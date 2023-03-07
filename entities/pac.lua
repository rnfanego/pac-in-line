pac = object:new({
    x=24,
	y=52,
    spr=1,
	sprplus=1,

    init = function(self)
        self.x=24
	    self.y=52
        self.spr=1
    end,

    update = function(self)
        self.spr=alternate(self.sprplus, sprspeed, 2)
	end,

	draw = function(self)
        spr(self.spr,self.x,self.y)
	end,

    collide = function(self, t)
        if (t:isCollisionable() and
            self.y == t.y and 
            t.x >= (self.x-t.w) and 
            t.x < (self.x+t.w)) then
            return true
	    end
	    return false
    end,

    moveUp = function(self)
        self.y = max(0,self.y-8) 
		self.sprplus = 1 
    end,

    moveDown = function(self)
        self.y = min(120,self.y+8) 
		self.sprplus = 1
    end
})