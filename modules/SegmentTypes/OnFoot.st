TravelSegment subclass: OnFoot [
	time [
		^ distance / self speed * 60
	]

	cost [
		^ 0
	]

	speed [
		^ 4.8
	]

	transportTypeName [
		^ 'On Foot'
	]

	carbonDioxideEmission [
		^ 0
	]
]
