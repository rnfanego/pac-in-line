level = object:new({
    levels={
        {
            name="level 1",
            speed=1.0,
            superblocks={"SB11","SB12","SB13"},
            connector="SBC1",
            finishable=true,
            finished_score=50,
            finished_col_count=60
        },
        {
            name="level 2",
            speed=1.3,
            superblocks={"SB21","SB22","SB23","SB24"},
            connector="SBC2",
            finishable=true,
            finished_score=100,
            finished_col_count=200
        },
        {
            name="level 3",
            speed=1.6,
            superblocks={"SB23","SB31","SB32","SB33"},
            connector="SBC3",
            finishable=false,
            finished_score=100,
            finished_col_count=300
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