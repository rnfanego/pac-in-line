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
        blocks={
            {{"E11"},{},{},{},{}}
        }
    }
}

--block of compositions
block = {{},{},{},{},{}}

local function e1(r,name)
    return {
        name = name,
        elements = {
            {{"pill", r}},
            {{"pill", r}},
            {{"pill", r}},
            {{"pill", r}},
            {{"red", r}}
        }
    }
end

local function e2(r1,r2,name)
    return {
        name = "E21",
        elements = {
            {{"pill", r1}},
            {{"pill", r1}},
            {{"red", r1},{"pill", r2}},
            {{"pill", r1},{"pill", r2}},
            {{"pill", r1},{"red", r2}}
        }
    }
end

local function e3(r1,name)
    return {
        name = "E31",
        elements = {
            {{"pill", r1}},
            {{"pill", r1}},
            {{"pill", rows.r2},{"red", r1}},
            {{"pill", rows.r1},{"pill", rows.r2},{"pill", rows.r3}},
            {{"red", rows.r1},{"pill", rows.r2},{"red", rows.r3}}
        }
    }
end

compositions = {
    e1(rows.r1, "E11"),
    e1(rows.r2, "E12"),
    e1(rows.r3, "E13"),
    e2(rows.r1,rows.r2, "E21"),
    e2(rows.r3,rows.r2, "E22"),
    e3(rows.r3, "E31"),
    e3(rows.r1, "E32")
}