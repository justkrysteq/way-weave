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

	print [
		Transcript show: 'Route'; cr.

		segments do: [ :segment |
			Transcript show: segment startPoint, ' -> '.
		].

		segments notEmpty ifTrue: [
			Transcript show: segments last endPoint; nl; cr.
		].
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
