import RealityKit

public enum Region: String, Codable{
     case yosemite  
    case catalina
}

// Ensure you register this component in your app’s delegate using:
// PointOfInterestComponent.registerComponent()
public struct PointOfInterestComponent: Component, Codable {
    // This is an example of adding a variable to the component.
    var region: Region = .yosemite

    public init() {
    }
}
