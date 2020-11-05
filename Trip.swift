//
//  Trips.swift
//  Gait
//
//  Created by Joshua Bickett on 4/18/20.
//  Copyright © 2020 Joshua Bickett. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

struct Trip {

    var tripId: Int?
    var startCity: String?
    var startDatetime: Date?
    var startLocation: CLLocation?
    var startMapItem: MKMapItem?
    var endCity: String?
    var endDatetime: Date?
    var endLocation: CLLocation?
    var endMapItem: MKMapItem?
    var tripDuration: Duration?
    var accelerationScore: Float?
    var accelerationIncidents: Int?
    var brakeScore: Float?
    var brakeIncidents: Int?
    var speedScore: Float?
    var speedIncidents: Int?
    var overallScore: Float?
    var distance: Double?
}
