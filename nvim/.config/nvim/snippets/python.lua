return {
	s(
		{ trig = "ps" },
		fmta([[print("<>", end="")]], {
			i(1),
		})
	),
	s(
		{ trig = "psl" },
		fmta([[print("<>")]], {
			i(1),
		})
	),
	s({ trig = "ple" }, fmta([[print("==================================================")]], {})),
}
