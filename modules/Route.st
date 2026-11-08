Object subclass: Route [
	| segments |

	segments [
		^ segments
	]

	" Initializer "
	segments: newSegments [
		| prevEndPoint |
		segments := OrderedCollection new.
		prevEndPoint := nil.

		newSegments do: [ :segment |
			(prevEndPoint notNil and: [ segment startPoint ~= prevEndPoint ]) ifTrue: [
				self error: 'Route segments are not connected'
			].

			segments add: segment.
			prevEndPoint := segment endPoint.
		]
	]

	totalOf: value [
		^ segments inject: 0 into: [ :sum :segment |
			sum + (value value: segment)
		]
	]

	distance [
		^ self totalOf: [ :segment | segment distance ]
	]

	time [
		^ self totalOf: [ :segment | segment time ]
	]

	cost [
		^ self totalOf: [ :segment | segment cost ]
	]

	carbonDioxideEmission [
		^ self totalOf: [ :segment | segment carbonDioxideEmission ]
	]

	print [
		| newline index |
		Transcript show: '------------- Route -------------'; cr.
		newline := Character nl asString.
		index := 0.

		segments do: [ :segment |
			index := index + 1.
			Transcript show: index asString, '. ', segment transportTypeName, newline,
				'   ', segment startPoint, ' -> ', segment endPoint, newline,
				'   ', segment distance asString, ' km | ', segment time rounded asString, ' min | ', (segment cost asScaledDecimal: 2) asString, '$ | ', (segment carbonDioxideEmission asScaledDecimal: 2) asString, ' kg'; cr.
		].

		Transcript show: '---------------------------------'; cr.
		Transcript show: 'Distance: ', self distance asString, ' km'; cr.
		Transcript show: 'Time: ', self time rounded asString, ' min'; cr.
		Transcript show: 'Cost: ', (self cost asScaledDecimal: 2) asString, '$'; cr.
		Transcript show: 'Carbon Dioxide Emission: ', (self carbonDioxideEmission asScaledDecimal: 2) asString, ' kg'; cr.
		Transcript show: '---------------------------------'; cr.
	]

	+ other [
		(other isKindOf: Route) ifTrue: [
			| combinedRoute |
			combinedRoute := Route new.
			combinedRoute segments: segments, other segments.

			^ combinedRoute
		].

		(other isKindOf: TravelSegment) ifTrue: [
			| combinedSegments combinedRoute |
			combinedSegments := segments copy.
			combinedSegments add: other.

			combinedRoute := Route new.
			combinedRoute segments: combinedSegments.
			^ combinedRoute
		].

		self error: ('Can''t add object to class ', self class name, ' with an object of class ', other class name)
	]
]
