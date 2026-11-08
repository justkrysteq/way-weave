TravelSegment subclass: ByBus [
	time [
		^ distance / self speed * 60
	]

	cost [
		| ticketPrice |
		ticketPrice := 3.20.

		^ (self time / 90) ceiling * ticketPrice
	]

	speed [
		^ 45
	]

	transportTypeName [
		^ 'By Bus'
	]

	carbonDioxideEmission [
		^ 1.2 * distance
	]
]
