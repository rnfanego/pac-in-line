magicpill = object:new({
    w=4,
    h=3,
    pill_type=0,
    init = function(self)
        self.spr=19
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
        powerup_timer=flr(lerp(7,0,time()/4%1))
        powerup_on=true
        return 10
    end,

    playSound = function(self)
        sfx(3,1)
    end,

    create = function(x,y)
        p = magicpill:new({x=x,y=y})
        p:init()
        return p
    end
})