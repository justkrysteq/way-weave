Object subclass: TravelSegment [
	| startPoint endPoint distance |

	startPoint [
		^ startPoint
	]

	endPoint [
		^ endPoint
	]

	distance [
		^ distance
	]

	time [
		self subclassResponsibility
	]

	cost [
		self subclassResponsibility
	]

	speed [
		self subclassResponsibility
	]

	transportTypeName [
		self subclassResponsibility
	]

	carbonDioxideEmission [
		self subclassResponsibility
	]

	description [
		| newline |
		newline := Character nl asString.

		^ 'Travel Segment', newline,
			'Transport: ', self transportTypeName, newline,
			'From ', startPoint, ' to ', endPoint, newline,
			'Distance: ', distance asString, ' km', newline,
			'Time: ', self time rounded asString, ' min', newline,
			'Cost: ', ((self cost asScaledDecimal: 2) asString), '$', newline
	]

	" Initializer "
	startPoint: newStartPoint endPoint: newEndPoint distance: newDistance [
		startPoint := newStartPoint.
		endPoint := newEndPoint.
		distance := newDistance.
	]

	+ other [
		(other isKindOf: Route) ifTrue: [
			| combinedRoute |
			combinedRoute := Route new.
			combinedRoute segments: (OrderedCollection with: self), other segments.

			^ combinedRoute
		].

		(other isKindOf: TravelSegment) ifTrue: [
			| combinedRoute |
			combinedRoute := Route new.
			combinedRoute segments: (OrderedCollection with: self with: other).

			^ combinedRoute
		].

		self error: ('Can''t add object to class ', self class name, ' with an object of class ', other class name)
	]
]
