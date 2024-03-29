pill = object:new({
    w=3,
    h=2,
    pill_type=0,
    init = function(self)
        self.spr=18
        self.t=pill_type
	end,

	update = function(self)
        self.x-=(current_level:getSpeed())
	end,

	draw = function(self)
        spr(self.spr,self.x,self.y)
	end,

    isScorable = function(self)
        return true
	end,

    isCollisionable = function(self)
        return true
	end,

    getPoints = function(self)
        return 1
    end,

    playSound = function(self)
        sfx(1,1)
    end,

    create = function(x,y)
        p = pill:new({x=x,y=y})
        p:init()
        return p
    end
})