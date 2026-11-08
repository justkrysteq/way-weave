FileStream fileIn: 'modules/TravelSegment.st'.
FileStream fileIn: 'modules/SegmentTypes/OnFoot.st'.
FileStream fileIn: 'modules/SegmentTypes/ByBike.st'.
FileStream fileIn: 'modules/SegmentTypes/ByBus.st'.
FileStream fileIn: 'modules/Route.st'.
FileStream fileIn: 'modules/Passenger.st'.
FileStream fileIn: 'modules/PassengerTypes/Student.st'.
FileStream fileIn: 'modules/PassengerTypes/Senior.st'.
FileStream fileIn: 'modules/PassengerTypes/Regular.st'.

| segment segmentOnFoot segmentByBike segmentByBus travelRoute route route2 route3 route4 route5 travelRoute2 route6 |

segment := TravelSegment new.
segment startPoint: 'Paris' endPoint: 'Lyon' distance: 465.0.

Transcript show: 'Start: ', segment startPoint; cr.
Transcript show: 'End: ', segment endPoint; cr.
Transcript show: 'Distance: ', segment distance printString, ' km'; nl; cr.

segmentOnFoot := OnFoot new.
segmentOnFoot startPoint: 'Warsaw' endPoint: 'Gdańsk' distance: 320.0.

Transcript show: segmentOnFoot description; cr.

segmentByBike := ByBike new.
segmentByBike startPoint: 'Berlin' endPoint: 'Hamburg' distance: 240.0.

Transcript show: segmentByBike description; cr.

segmentByBus := ByBus new.
segmentByBus startPoint: 'Hamburg' endPoint: 'Lisbon' distance: 560.0.

Transcript show: segmentByBus description; cr.

travelRoute := OrderedCollection with: segmentByBike with: segmentByBus.

route := Route new.
route segments: travelRoute.

route print.

travelRoute2 := OrderedCollection with: ((ByBus new) startPoint: 'Lisbon' endPoint: 'Warsaw' distance: 700.0) with: segmentOnFoot.

route2 := Route new.
route2 segments: travelRoute2.

route3 := route + route2.

route3 print.

route4 := route3 + ((ByBus new) startPoint: 'Gdańsk' endPoint: 'Berlin' distance: 700.0).

route4 print.

route5 := segmentByBike + segmentByBus.

route5 print.

route3 print.

route6 := segmentByBus + ((Route new) segments: (OrderedCollection with: ((ByBus new) startPoint: 'Lisbon' endPoint: 'Warsaw' distance: 700.0) with: segmentOnFoot)).

route6 print.

(route6 segments at: 1) delay: 20.

route6 print.

Transcript show: (segmentByBus costFor: (Regular new)) asString; cr.
Transcript show: (segmentByBus costFor: (Student new)) asString; cr.
Transcript show: (segmentByBus costFor: (Senior new)) asString; cr.

Transcript show: ''; cr.
Transcript show: (route6 costFor: (Regular new)) asString; cr.
Transcript show: (route6 costFor: (Senior new)) asString; cr.

(route6 carbonDioxideEmission < route4 carbonDioxideEmission) ifTrue: [
	Transcript show: 'Route 6 is better for environment'; cr.
	Transcript show: 'Route 6 emission: ', route6 carbonDioxideEmission asString, Character nl asString, 'Route 4 emission: ', route4 carbonDioxideEmission asString; cr.
] ifFalse: [
	Transcript show: 'Route 4 is better for environment'; cr.
	Transcript show: 'Route 6 emission: ', route6 carbonDioxideEmission asString, Character nl asString, 'Route 4 emission: ', route4 carbonDioxideEmission asString; cr.
]
