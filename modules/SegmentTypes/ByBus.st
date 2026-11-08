TravelSegment subclass: ByBus [
	| delay |

	time [
		^ distance / self speed * 60 + delay
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

	delay [
		^ delay
	]

	delay: newDelay [
		delay := newDelay
	]

	" Initializer "
	startPoint: newStartPoint endPoint: newEndPoint distance: newDistance [
		super startPoint: newStartPoint endPoint: newEndPoint distance: newDistance.
		delay := 0.
	]
]
