return {
	s(
		{ trig = "ps" },
		fmta([[Console.Write("<>");]], {
			i(1),
		})
	),
	s(
		{ trig = "psl" },
		fmta([[Console.WriteLine("<>");]], {
			i(1),
		})
	),
	s({ trig = "ple" }, fmta([[Console.WriteLine("==================================================");]], {})),
}
