---@diagnostic disable: undefined-global
-- luasnip defines a lot of these already
return {
    s({
        trig = "fn",
        name = "function",
        desc = "Interactive function writing",
    },
        fmt([[
            {pub}fn {fname}({fargs}) {rtr}{{
                {body}
            }}
            ]],
            {
                fname = i(1, "name"),
                fargs = i(2, "args"),
                rtr  = c(3, {
                    t"",
                    sn(nil, { t"-> ", i(1), t" " }),
                }),
                pub = c(4, {
                    t"",
                    t"pub ",
                    t"pub(crate) ",
                    t"pub(super) ",
                }),
                body = i(5, "todo!()"),
            }
    )),
    s({
        trig = "@dict",
        name = "Dictionary Struct",
    },
        fmt([[
            {visibility}struct {sname} {{
                {body}
            }}
            ]],
            {
                sname = i(1, "Name"),
                visibility = c(2, {
                    t"",
                    t"pub ",
                    t"pub(crate) ",
                    t"pub(super) ",
                }),
                body = i(3, "// fields")
            }
    )),
}
