import UIKit

// MARK: - Graphics demo view

final class Lab7CanvasView: UIView {
    private let segmentLayer = CAShapeLayer()
    private let trapezoidLayer = CAShapeLayer()
    private let gradientLayer = CAGradientLayer()
    private let titleLabel = UILabel()

    var themeIndex: Int = 0 {
        didSet {
            applyTheme()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .clear
        layer.cornerRadius = 28
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 24
        layer.shadowOffset = CGSize(width: 0, height: 12)

        gradientLayer.colors = [
            UIColor(red: 0.09, green: 0.10, blue: 0.18, alpha: 1.0).cgColor,
            UIColor(red: 0.12, green: 0.18, blue: 0.30, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.addSublayer(gradientLayer)

        [segmentLayer, trapezoidLayer].forEach {
            $0.shadowColor = UIColor.black.cgColor
            $0.shadowOpacity = 0.22
            $0.shadowRadius = 10
            $0.shadowOffset = CGSize(width: 0, height: 7)
        }
        layer.addSublayer(segmentLayer)
        layer.addSublayer(trapezoidLayer)

        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.text = "Task 2.2\nCircle segment + right trapezoid"
        addSubview(titleLabel)

        applyTheme()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds

        let inset: CGFloat = 24
        let contentWidth = bounds.width - inset * 2
        let graphicsTop = inset + 34
        let shapeHeight = (bounds.height - graphicsTop - 46) / 2

        let segmentRect = CGRect(x: inset, y: graphicsTop, width: contentWidth, height: shapeHeight)
        let trapezoidRect = CGRect(x: inset, y: graphicsTop + shapeHeight + 18, width: contentWidth, height: shapeHeight)

        segmentLayer.frame = segmentRect
        trapezoidLayer.frame = trapezoidRect

        segmentLayer.path = circleSegmentPath(in: segmentRect).cgPath
        trapezoidLayer.path = rightTrapezoidPath(in: trapezoidRect).cgPath

        titleLabel.frame = CGRect(x: inset, y: 10, width: bounds.width - inset * 2, height: 34)
    }

    private func applyTheme() {
        let palette = GeometryVariant.palette
        let color = palette[themeIndex % palette.count]
        segmentLayer.fillColor = color.withAlphaComponent(0.88).cgColor
        trapezoidLayer.fillColor = color.withHueShifted(by: 0.10).cgColor
        segmentLayer.strokeColor = UIColor.white.withAlphaComponent(0.30).cgColor
        trapezoidLayer.strokeColor = UIColor.white.withAlphaComponent(0.30).cgColor
        segmentLayer.lineWidth = 1.2
        trapezoidLayer.lineWidth = 1.2
    }

    private func circleSegmentPath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let center = CGPoint(x: rect.midX, y: rect.midY + rect.height * 0.10)
        let radius = min(rect.width, rect.height) * 0.38
        let startAngle = CGFloat.pi * 1.08
        let endAngle = CGFloat.pi * 1.95

        path.move(to: center)
        path.addArc(withCenter: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: true)
        path.close()
        return path
    }

    private func rightTrapezoidPath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let topLeft = CGPoint(x: rect.minX + rect.width * 0.24, y: rect.minY + rect.height * 0.18)
        let topRight = CGPoint(x: rect.maxX - rect.width * 0.10, y: rect.minY + rect.height * 0.18)
        let bottomRight = CGPoint(x: rect.maxX - rect.width * 0.02, y: rect.maxY - rect.height * 0.12)
        let bottomLeft = CGPoint(x: rect.minX + rect.width * 0.10, y: rect.maxY - rect.height * 0.12)

        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.close()
        return path
    }
}

private extension UIColor {
    func withHueShifted(by amount: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        guard getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
            return self
        }

        let shifted = hue + amount
        return UIColor(hue: shifted.truncatingRemainder(dividingBy: 1.0),
                       saturation: saturation,
                       brightness: brightness,
                       alpha: alpha)
    }
}

