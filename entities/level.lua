level = object:new({
    levels={
        {
            name="Level 1",
            speed=1.0,
            superblocks={"SB11","SB12","SB13"},
            connector="SBC1",
            finishable=true,
            finished_score=50,
            finished_col_count=20
        },
        {
            name="Level 2",
            speed=1.3,
            superblocks={"SB24"},
            --superblocks={"SB21","SB22","SB23","SB24"},
            connector="SBC2",
            finishable=true,
            finished_score=100,
            finished_col_count=250
        },
        {
            name="Level 3",
            speed=1.6,
            superblocks={"SB21","SB22"},
            connector="SBC2",
            finishable=false,
            finished_score=100,
            finished_col_count=350
        }
    },
	init = function(self)
        local l = level.levels[self.number]
        self.name=l.name
        self.speed=l.speed
        self.superblocks = l.superblocks
        self.connector=l.connector
        self.finishable = l.finishable
        self.finished_score = l.finished_score
        self.finished_col_count=l.finished_col_count
	end,

    create = function(number)
        local l = level:new({number=number})
        l:init()
        return l
    end,

    next = function(self)
        if (self.finishable) then
            return level.create(self.number+1)
        end
        return self
    end,

    isFinished = function(self,score,c_count)
        return self.finishable and c_count >= self.finished_col_count
    end,

    getSuperblocks = function(self)
        return self.superblocks
    end,

    getSpeed = function(self)
        return self.speed
    end,

	update = function(self)
	end,

	draw = function(self)
	end
})