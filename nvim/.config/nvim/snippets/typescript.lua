return {
	s(
		{ trig = "ps" },
		fmta([[process.stdout.write("<>");]], {
			i(1),
		})
	),
	s(
		{ trig = "psl" },
		fmta([[console.log("<>");]], {
			i(1),
		})
	),
	s({ trig = "ple" }, fmta([[console.log('==================================================');]], {})),
}
