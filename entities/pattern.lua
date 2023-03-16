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

                if(e[1] == "magicpill") then
                    add(aux, magicpill.create(127,e[2]))
                end

                if(e[1] == "red") then
                    add(aux, red.create(127,e[2]))
                end

                if(e[1] == "pinky_up") then
                    add(aux, pinky.create(127,e[2],true))
                end

                if(e[1] == "pinky_down") then
                    add(aux, pinky.create(127,e[2],false))
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
        name = name,
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
        name = name,
        elements = {
            {{"pill", r1}},
            {{"pill", r1}},
            {{"pill", rows.r2},{"red", r1}},
            {{"pill", rows.r1},{"pill", rows.r2},{"pill", rows.r3}},
            {{"red", rows.r1},{"pill", rows.r2},{"red", rows.r3}}
        }
    }
end

local function f1(e1,e2,e3,name)
    return {
        name = name,
        elements = {
            {{e1, rows.r1},{e2, rows.r2},{e3, rows.r3}}
        }
    }
end

local function g1(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"pill", r}},
            {{"pill", r}},
            {{"pill", r}},
            {{"red", r}}
        }
    }
end

local function c1(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"red", r}},
            {{"red", r}},
            {{"red", r}},
            {{"red", r}}
        }
    }
end

local function b1(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"pill", r}},
            {{"red", r}},
            {{"red", r}},
            {{"red", r}}
        }
    }
end

local function b2(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"red", r}},
            {{"red", r}},
            {{"pill", r}},
            {{"red", r}}
        }
    }
end

local function a1(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"red", r}},
            {{"pill", r}},
            {{"red", r}},
            {{"red", r}}
        }
    }
end

local function h1(r1,r2,p,name)
    return {
        name = name,
        elements = {
            {{"pill", r1}},
            {{"pill", r1}},
            {{"pill", r1}},
            {{p, r2}},
            {{"pill", r1}}
        }
    }
end

local function i1(r1,r2,r3,p,name)
    return {
        name = name,
        elements = {
            {{"red", r1},{"red", r2},{"pill", r3}},
            {{"red", r1},{"pill", r2},{"pill", r3}},
            {{"magicpill", r1},{"pill", r2}},
            {{"red", r1},{p, r3}},
            {{"red", r1},{"pill", r2},{"pill", r3}}
        }
    }
end

compositions = {
    i1(rows.r1,rows.r2,rows.r3, "pinky_up","I11"),
    i1(rows.r3,rows.r2,rows.r1, "pinky_down","I12"),
    h1(rows.r1,rows.r2, "pinky_up","H11"),
    h1(rows.r3,rows.r2, "pinky_down","H12"),
    a1(rows.r1, "A11"),
    a1(rows.r2, "A12"),
    a1(rows.r3, "A13"),
    b2(rows.r1, "B21"),
    b2(rows.r2, "B22"),
    b2(rows.r3, "B23"),
    b1(rows.r1, "B11"),
    b1(rows.r2, "B12"),
    b1(rows.r3, "B13"),
    c1(rows.r1, "C11"),
    c1(rows.r2, "C12"),
    c1(rows.r3, "C13"),
    g1(rows.r1, "G11"),
    g1(rows.r2, "G12"),
    g1(rows.r3, "G13"),
    f1("magicpill","red","red","F21"),
    f1("red","magicpill","red","F22"),
    f1("red","red","magicpill","F23"),
    f1("pill","red","red","F11"),
    f1("red","pill","red","F12"),
    f1("red","red","pill","F13"),
    e1(rows.r1, "E11"),
    e1(rows.r2, "E12"),
    e1(rows.r3, "E13"),
    e2(rows.r1,rows.r2, "E21"),
    e2(rows.r3,rows.r2, "E22"),
    e3(rows.r3, "E31"),
    e3(rows.r1, "E32")
}