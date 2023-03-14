pattern = object:new({
    init = function(self)
        self.things = {}
        self:initialize(rnd(compositions))
	end,

    create = function()
        local p = pattern:new({})
        p:init()
        return p
    end,

    initialize = function(self, composition)
        local elements = composition.elements
        for i=1,#elements do
            local es = elements[i]
            --printh("composition elements"..#b.elements,"pac_in_line/log")
            local aux = {}
            for e in all(es) do
                if(e[1] == "pill") then
                    add(aux, pill.create(127,e[2]))
                end

                if(e[1] == "red") then
                    add(aux, red.create(127,e[2]))
                end

                if(e[1] == "pinky") then
                    add(aux, pinky.create(127,e[2],true))
                end

                if (e[1] == "empty") then
                    add(aux, empty.create(127,e[2]))
                end
            end

            add(self.things, aux)
        end
    end,

    get_thing = function(self)
        local t = self.things[1]
        deli(self.things,1)
        return t
    end,

    is_empty = function(self)
        return count(self.things) == 0
    end,

    get_things = function(self)
        return self.things
    end
})

rows = {
    r1=52,
	r2=60,
	r3=68,
}

levels={
    {
        speed= 1.0,
        compositions={

        }
    }
}

--block of compositions
block = {
    {},
    {},
    {},
    {},
    {}
}

compositions = {
    {
        name = "E11",
        elements = {
            {{"pill", rows.r1}},
            {{"pill", rows.r1}},
            {{"pill", rows.r1}},
            {{"pill", rows.r1}},
            {{"red", rows.r1}}
        }
    },
    {
        name = "E12",
        elements = {
            {{"pill", rows.r2}},
            {{"pill", rows.r2}},
            {{"pill", rows.r2}},
            {{"pill", rows.r2}},
            {{"red", rows.r2}}
        }
    },
    {
        name = "E13",
        elements = {
            {{"pill", rows.r3}},
            {{"pill", rows.r3}},
            {{"pill", rows.r3}},
            {{"pill", rows.r3}},
            {{"red", rows.r3}}
        }
    },
    {
        name = "E21",
        elements = {
            {{"pill", rows.r1}},
            {{"pill", rows.r1}},
            {{"red", rows.r1},{"pill", rows.r2}},
            {{"pill", rows.r1},{"pill", rows.r2}},
            {{"pill", rows.r1},{"red", rows.r2}}
        }
    },
    {
        name = "E22",
        elements = {
            {{"pill", rows.r3}},
            {{"pill", rows.r3}},
            {{"red", rows.r3},{"pill", rows.r2}},
            {{"pill", rows.r3},{"pill", rows.r2}},
            {{"pill", rows.r3},{"red", rows.r2}}
        }
    },
    {
        name = "E31",
        elements = {
            {{"pill", rows.r3}},
            {{"pill", rows.r3}},
            {{"red", rows.r3},{"pill", rows.r2}},
            {{"pill", rows.r3},{"pill", rows.r2},{"pill", rows.r1}},
            {{"red", rows.r1},{"pill", rows.r2},{"red", rows.r3}}
        }
    },
    {
        name = "E32",
        elements = {
            {{"pill", rows.r1}},
            {{"pill", rows.r1}},
            {{"red", rows.r1},{"pill", rows.r2}},
            {{"pill", rows.r3},{"pill", rows.r2},{"pill", rows.r1}},
            {{"red", rows.r2},{"pill", rows.r3},{"red", rows.r2}}
        }
    }
}