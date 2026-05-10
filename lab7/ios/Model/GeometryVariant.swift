import UIKit

// MARK: - Lab 7 variant model

/// Laboratory work 7, variant 17.
/// The self-study tasks use:
/// - circle segment
/// - right trapezoid
enum GeometryVariant {
    static let title = "Variant 17"

    /// Base colors used by the graphic screen.
    static let palette: [UIColor] = [
        UIColor(red: 0.96, green: 0.79, blue: 0.43, alpha: 1.0),
        UIColor(red: 0.46, green: 0.70, blue: 0.93, alpha: 1.0),
        UIColor(red: 0.72, green: 0.44, blue: 0.95, alpha: 1.0),
        UIColor(red: 0.95, green: 0.46, blue: 0.52, alpha: 1.0)
    ]
}

/// A simple helper that stores the geometry needed for both custom figures.
struct Lab7Geometry {
    let circleSegmentRect: CGRect
    let trapezoidRect: CGRect
}

