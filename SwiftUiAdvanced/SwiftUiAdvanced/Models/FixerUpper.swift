import Foundation
import SwiftUI
import CoreLocation

@Observable
class FixerUpper: Codable, Identifiable {
    internal init(id: Int, name: String, imageName: String, coordinates: Coordinates, city: String, state: String, askingPrice: Double, category: FixerUpper.Category, isFeatured: Bool, isFavorite: Bool, isBookmarked: Bool, renovationCost: Double, potentialValueAfterRenovation: Double, renovationDifficulty: FixerUpper.RenovationDifficulty, renovationPriorityAreas: [String], condition: FixerUpper.Condition, needsInspection: Bool, lastRenovationDate: Date? = nil, renovationHistory: [Renovation], rentalIncomePotential: Double, expectedROI: Double, schoolDistrictRating: Double, walkabilityScore: Double, crimeRate: Double, plannedVisitDate: Date) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.coordinates = coordinates
        self.city = city
        self.state = state
        self.askingPrice = askingPrice
        self.category = category
        self.isFeatured = isFeatured
        self.isFavorite = isFavorite
        self.isBookmarked = isBookmarked
        self.renovationCost = renovationCost
        self.potentialValueAfterRenovation = potentialValueAfterRenovation
        self.renovationDifficulty = renovationDifficulty
        self.renovationPriorityAreas = renovationPriorityAreas
        self.condition = condition
        self.needsInspection = needsInspection
        self.lastRenovationDate = lastRenovationDate
        self.renovationHistory = renovationHistory
        self.rentalIncomePotential = rentalIncomePotential
        self.expectedROI = expectedROI
        self.schoolDistrictRating = schoolDistrictRating
        self.walkabilityScore = walkabilityScore
        self.crimeRate = crimeRate
        self.plannedVisitDate = plannedVisitDate
    }
    
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var city: String
    var state: String
    var askingPrice: Double
    var category: Category
    var isFeatured: Bool
    var isFavorite: Bool
    var isBookmarked: Bool
    
    // Renovation-related properties
    var renovationCost: Double
    var potentialValueAfterRenovation: Double
    var renovationDifficulty: RenovationDifficulty
    var renovationPriorityAreas: [String]
    
    // Property condition
    var condition: Condition
    var needsInspection: Bool
    
    // Property history
    var lastRenovationDate: Date?
    var renovationHistory: [Renovation]

    // Investment potential
    var rentalIncomePotential: Double
    var expectedROI: Double
    
    // Environmental and neighborhood information
    var schoolDistrictRating: Double
    var walkabilityScore: Double
    var crimeRate: Double
    
    // Planned visit information
    var plannedVisitDate: Date?

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    var featureImage: Image {
        guard isFeatured else { return Image(
                ImageStore.loadImage(name: "placeholder_feature"),
                scale: 2,
                label: Text(verbatim: name)
            )
        }
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(verbatim: name))
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case neighborhood = "Neighborhood"
        case rural = "Rural"
        case waterfront = "Waterfront"
    }
    
    enum Condition: String, CaseIterable, Codable, Hashable {
        case poor = "Poor"
        case fair = "Fair"
        case good = "Good"
    }
    
    enum RenovationDifficulty: String, CaseIterable, Codable, Hashable {
        case easy = "Easy"
        case moderate = "Moderate"
        case difficult = "Difficult"
    }
}

extension FixerUpper {
    @MainActor var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

extension FixerUpper {
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _name = "name"
        case _imageName = "imageName"
        case _coordinates = "coordinates"
        case _city = "city"
        case _state = "state"
        case _askingPrice = "askingPrice"
        case _category = "category"
        case _isFeatured = "isFeatured"
        case _isFavorite = "isFavorite"
        case _isBookmarked = "isBookmarked"
        case _renovationCost = "renovationCost"
        case _potentialValueAfterRenovation = "potentialValueAfterRenovation"
        case _renovationDifficulty = "renovationDifficulty"
        case _renovationPriorityAreas = "renovationPriorityAreas"
        case _condition = "condition"
        case _needsInspection = "needsInspection"
        case _lastRenovationDate = "lastRenovationDate"
        case _renovationHistory = "renovationHistory"
        case _rentalIncomePotential = "rentalIncomePotential"
        case _expectedROI = "expectedROI"
        case _schoolDistrictRating = "schoolDistrictRating"
        case _walkabilityScore = "walkabilityScore"
        case _crimeRate = "crimeRate"
        case _plannedVisitDate = "plannedVisitDate"
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct Renovation: Hashable, Codable {
    var date: Date
    var description: String
    var cost: Double
}
