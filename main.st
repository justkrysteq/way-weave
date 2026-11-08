FileStream fileIn: 'modules/TravelSegment.st'.
FileStream fileIn: 'modules/SegmentTypes/OnFoot.st'.
FileStream fileIn: 'modules/SegmentTypes/ByBike.st'.
FileStream fileIn: 'modules/SegmentTypes/ByBus.st'.

| segment |
segment := TravelSegment new.
segment startPoint: 'Paris' endPoint: 'Lyon' distance: 465.0.

Transcript show: 'Start: ', segment startPoint; cr.
Transcript show: 'End: ', segment endPoint; cr.
Transcript show: 'Distance: ', segment distance printString, ' km'; nl; cr.

| segmentOnFoot |
segmentOnFoot := OnFoot new.
segmentOnFoot startPoint: 'Warsaw' endPoint: 'Gdańsk' distance: 320.0.

Transcript show: segmentOnFoot description; cr.

| segmentByBike |
segmentByBike := ByBike new.
segmentByBike startPoint: 'Berlin' endPoint: 'Hamburg' distance: 240.0.

Transcript show: segmentByBike description; cr.

| segmentByBus |
segmentByBus := ByBus new.
segmentByBus startPoint: 'Madrid' endPoint: 'Lisbon' distance: 560.0.

Transcript show: segmentByBus description; cr.
