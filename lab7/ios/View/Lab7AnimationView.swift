import UIKit

// MARK: - Animation demo view

final class Lab7AnimationView: UIView {
    private let container = UIView()
    private let segmentView = UIView()
    private let trapezoidView = UIView()
    private let infoLabel = UILabel()
    private let buttonsStack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = UIColor(red: 0.07, green: 0.08, blue: 0.12, alpha: 1.0)
        layer.cornerRadius = 28
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 24
        layer.shadowOffset = CGSize(width: 0, height: 12)

        container.backgroundColor = UIColor.white.withAlphaComponent(0.06)
        container.layer.cornerRadius = 22
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.white.withAlphaComponent(0.10).cgColor
        addSubview(container)

        segmentView.backgroundColor = UIColor(red: 0.47, green: 0.72, blue: 0.96, alpha: 1.0)
        segmentView.layer.cornerRadius = 22
        trapezoidView.backgroundColor = UIColor(red: 0.95, green: 0.69, blue: 0.34, alpha: 1.0)
        trapezoidView.layer.cornerRadius = 22

        let segmentPath = circleSegmentMaskPath()
        let trapezoidPath = rightTrapezoidMaskPath()
        segmentView.layer.mask = maskLayer(path: segmentPath.cgPath)
        trapezoidView.layer.mask = maskLayer(path: trapezoidPath.cgPath)

        [segmentView, trapezoidView].forEach {
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.22
            $0.layer.shadowRadius = 12
            $0.layer.shadowOffset = CGSize(width: 0, height: 8)
            container.addSubview($0)
        }

        infoLabel.font = .systemFont(ofSize: 15, weight: .medium)
        infoLabel.textColor = .white
        infoLabel.numberOfLines = 2
        infoLabel.textAlignment = .center
        infoLabel.text = "Task 2.3\nAnimation effects"
        addSubview(infoLabel)

        buttonsStack.axis = .vertical
        buttonsStack.alignment = .fill
        buttonsStack.distribution = .fillEqually
        buttonsStack.spacing = 10
        addSubview(buttonsStack)

        makeButtons()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let inset: CGFloat = 24
        let controlHeight: CGFloat = 170
        container.frame = CGRect(x: inset, y: 62, width: bounds.width - inset * 2, height: bounds.height - controlHeight - 78)
        infoLabel.frame = CGRect(x: inset, y: 16, width: bounds.width - inset * 2, height: 34)
        buttonsStack.frame = CGRect(x: inset, y: bounds.height - controlHeight, width: bounds.width - inset * 2, height: controlHeight)

        let contentWidth = container.bounds.width - 32
        segmentView.frame = CGRect(x: 16, y: 18, width: contentWidth, height: 90)
        trapezoidView.frame = CGRect(x: 16, y: 122, width: contentWidth, height: 90)

        segmentView.layer.shadowPath = UIBezierPath(roundedRect: segmentView.bounds, cornerRadius: 22).cgPath
        trapezoidView.layer.shadowPath = UIBezierPath(roundedRect: trapezoidView.bounds, cornerRadius: 22).cgPath
    }

    private func makeButtons() {
        let actions: [(String, Selector)] = [
            ("Move", #selector(animateMove)),
            ("Rotate", #selector(animateRotate)),
            ("Scale", #selector(animateScale)),
            ("Opacity", #selector(animateOpacity)),
            ("Combined", #selector(animateCombined))
        ]

        actions.forEach { title, selector in
            let button = makeButton(title: title, action: selector)
            buttonsStack.addArrangedSubview(button)
        }
    }

    private func makeButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
        button.heightAnchor.constraint(equalToConstant: 38).isActive = true
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    private func circleSegmentMaskPath() -> UIBezierPath {
        let path = UIBezierPath()
        let rect = CGRect(x: 8, y: 6, width: 120, height: 72)
        let center = CGPoint(x: rect.midX, y: rect.midY + 6)
        path.move(to: center)
        path.addArc(withCenter: center,
                    radius: 30,
                    startAngle: CGFloat.pi * 1.06,
                    endAngle: CGFloat.pi * 1.96,
                    clockwise: true)
        path.close()
        return path
    }

    private func rightTrapezoidMaskPath() -> UIBezierPath {
        let path = UIBezierPath()
        let rect = CGRect(x: 0, y: 0, width: 140, height: 72)
        path.move(to: CGPoint(x: rect.minX + 28, y: 10))
        path.addLine(to: CGPoint(x: rect.maxX - 12, y: 10))
        path.addLine(to: CGPoint(x: rect.maxX - 2, y: rect.maxY - 10))
        path.addLine(to: CGPoint(x: rect.minX + 14, y: rect.maxY - 10))
        path.close()
        return path
    }

    private func maskLayer(path: CGPath) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = path
        return layer
    }

    @objc private func animateMove() {
        UIView.animate(withDuration: 0.95,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.4,
                       options: [.curveEaseInOut]) {
            self.segmentView.transform = .identity.translatedBy(x: 26, y: 0)
            self.trapezoidView.transform = .identity.translatedBy(x: -18, y: 0)
        }
    }

    @objc private func animateRotate() {
        UIView.animate(withDuration: 0.9,
                       delay: 0,
                       options: [.curveEaseInOut]) {
            self.segmentView.transform = CGAffineTransform(rotationAngle: .pi / 11)
            self.trapezoidView.transform = CGAffineTransform(rotationAngle: -.pi / 16)
        }
    }

    @objc private func animateScale() {
        UIView.animate(withDuration: 0.9,
                       delay: 0,
                       options: [.curveEaseInOut]) {
            self.segmentView.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            self.trapezoidView.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }
    }

    @objc private func animateOpacity() {
        UIView.animate(withDuration: 0.9,
                       delay: 0,
                       options: [.curveEaseInOut]) {
            self.segmentView.alpha = 0.35
            self.trapezoidView.alpha = 1.0
        }
    }

    @objc private func animateCombined() {
        UIView.animate(withDuration: 1.05,
                       delay: 0,
                       usingSpringWithDamping: 0.65,
                       initialSpringVelocity: 0.4,
                       options: [.curveEaseInOut]) {
            self.segmentView.transform = CGAffineTransform(translationX: 18, y: -4).rotated(by: .pi / 14).scaledBy(x: 0.9, y: 0.9)
            self.trapezoidView.transform = CGAffineTransform(translationX: -18, y: 10).rotated(by: -.pi / 18).scaledBy(x: 1.04, y: 1.04)
            self.segmentView.alpha = 0.82
            self.trapezoidView.alpha = 0.92
        }
    }
}

