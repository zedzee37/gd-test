extends Test

func run() -> TestBuilder:
	var builder := TestBuilder.new()

	builder.expect(true)
	builder.expect_equal(1, 2, TestBuilder.TestInfo.new("1 == 2", "one does not equal two :("))

	return builder
