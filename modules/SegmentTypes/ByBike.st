TravelSegment subclass: ByBike [
	time [
		^ distance / self speed * 60
	]

	cost [
		^ 0
	]

	speed [
		^ 15
	]

	transportTypeName [
		^ 'By Bike'
	]
]

