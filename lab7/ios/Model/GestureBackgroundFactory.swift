import UIKit

// MARK: - Gesture backgrounds

/// The gesture task requires five background images.
/// The factory renders five soft gradient bitmaps at runtime so the project
/// does not depend on external image assets.
enum GestureBackgroundFactory {
    static func makeImage(index: Int, size: CGSize = CGSize(width: 540, height: 540)) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)

        return renderer.image { context in
            let colors: [(UIColor, UIColor)] = [
                (UIColor(red: 0.16, green: 0.42, blue: 0.95, alpha: 1.0), UIColor(red: 0.72, green: 0.88, blue: 1.0, alpha: 1.0)),
                (UIColor(red: 0.98, green: 0.34, blue: 0.38, alpha: 1.0), UIColor(red: 0.99, green: 0.82, blue: 0.77, alpha: 1.0)),
                (UIColor(red: 0.17, green: 0.72, blue: 0.57, alpha: 1.0), UIColor(red: 0.77, green: 0.96, blue: 0.85, alpha: 1.0)),
                (UIColor(red: 0.97, green: 0.62, blue: 0.18, alpha: 1.0), UIColor(red: 0.99, green: 0.91, blue: 0.62, alpha: 1.0)),
                (UIColor(red: 0.38, green: 0.39, blue: 0.48, alpha: 1.0), UIColor(red: 0.82, green: 0.84, blue: 0.90, alpha: 1.0))
            ]

            let pair = colors[index % colors.count]
            let cgColors = [pair.0.cgColor, pair.1.cgColor] as CFArray
            let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: cgColors, locations: [0.0, 1.0])
            context.cgContext.drawLinearGradient(
                gradient!,
                start: CGPoint(x: 0, y: 0),
                end: CGPoint(x: size.width, y: size.height),
                options: []
            )

            // Add a translucent pattern so the images feel distinct in the report.
            let patternColor = UIColor(white: 1.0, alpha: 0.12)
            patternColor.setFill()
            let spacing: CGFloat = 40
            var x: CGFloat = -size.height
            while x < size.width {
                context.cgContext.addEllipse(in: CGRect(x: x, y: size.height * 0.08, width: 14, height: 14))
                context.cgContext.fillPath()
                x += spacing
            }
        }
    }
}

