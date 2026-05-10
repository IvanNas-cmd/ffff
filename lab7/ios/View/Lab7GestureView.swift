import UIKit

// MARK: - Gesture demo view

final class Lab7GestureView: UIView {
    private let backgroundCard = UIView()
    private let figureView = UIView()
    private let label = UILabel()
    private let controlStack = UIStackView()
    private let gestureNames = [
        "Rotation",
        "Pinch",
        "Tap",
        "Long press",
        "Swipe"
    ]
    private var backgroundImages: [UIImage] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = UIColor(red: 0.05, green: 0.07, blue: 0.11, alpha: 1.0)
        layer.cornerRadius = 28
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 24
        layer.shadowOffset = CGSize(width: 0, height: 12)

        backgroundCard.backgroundColor = UIColor.white.withAlphaComponent(0.06)
        backgroundCard.layer.cornerRadius = 22
        backgroundCard.layer.borderWidth = 1
        backgroundCard.layer.borderColor = UIColor.white.withAlphaComponent(0.10).cgColor
        addSubview(backgroundCard)

        figureView.layer.cornerRadius = 28
        figureView.layer.masksToBounds = true
        figureView.layer.borderWidth = 1
        figureView.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor
        figureView.layer.contentsGravity = .resizeAspectFill
        figureView.layer.contentsScale = UIScreen.main.scale
        backgroundCard.addSubview(figureView)

        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.text = "Task 2.4\nGesture controlled background"
        addSubview(label)

        controlStack.axis = .horizontal
        controlStack.alignment = .fill
        controlStack.distribution = .fillEqually
        controlStack.spacing = 8
        addSubview(controlStack)

        loadBackgrounds()
        applyBackground(index: 0, title: "Rotation")
        installGestures()
        makeButtons()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let inset: CGFloat = 24
        let controlHeight: CGFloat = 44

        backgroundCard.frame = CGRect(x: inset, y: 62, width: bounds.width - inset * 2, height: bounds.height - controlHeight - 88)
        label.frame = CGRect(x: inset, y: 16, width: bounds.width - inset * 2, height: 34)
        controlStack.frame = CGRect(x: inset, y: bounds.height - 58, width: bounds.width - inset * 2, height: controlHeight)

        let size = min(backgroundCard.bounds.width - 32, backgroundCard.bounds.height - 32)
        figureView.frame = CGRect(x: (backgroundCard.bounds.width - size) / 2,
                                  y: (backgroundCard.bounds.height - size) / 2,
                                  width: size,
                                  height: size)
    }

    private func loadBackgrounds() {
        backgroundImages = (0..<5).map { GestureBackgroundFactory.makeImage(index: $0) }
    }

    private func installGestures() {
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipe.direction = .left

        [rotation, pinch, tap, longPress, swipe].forEach { figureView.addGestureRecognizer($0) }
        figureView.isUserInteractionEnabled = true
    }

    private func makeButtons() {
        gestureNames.enumerated().forEach { index, name in
            let button = UIButton(type: .system)
            button.setTitle(name, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor.white.withAlphaComponent(0.08)
            button.layer.cornerRadius = 12
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
            button.tag = index
            button.addTarget(self, action: #selector(simulateGesture(_:)), for: .touchUpInside)
            controlStack.addArrangedSubview(button)
        }
    }

    private func applyBackground(index: Int, title: String) {
        guard let cgImage = backgroundImages[index % backgroundImages.count].cgImage else { return }
        figureView.layer.contents = cgImage
        label.text = "\(title)\nBackground preset \(index + 1)"
    }

    @objc private func simulateGesture(_ sender: UIButton) {
        applyBackground(index: sender.tag, title: gestureNames[sender.tag])
        animatePulse()
    }

    @objc private func handleRotation(_ gesture: UIRotationGestureRecognizer) {
        if gesture.state == .changed || gesture.state == .ended {
            applyBackground(index: 0, title: "Rotation")
            figureView.transform = figureView.transform.rotated(by: gesture.rotation / 2)
            gesture.rotation = 0
        }
    }

    @objc private func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        if gesture.state == .changed || gesture.state == .ended {
            applyBackground(index: 1, title: "Pinch")
            figureView.transform = figureView.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1
        }
    }

    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        applyBackground(index: 2, title: "Tap")
        animatePulse()
    }

    @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began else { return }
        applyBackground(index: 3, title: "Long press")
        animatePulse()
    }

    @objc private func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        applyBackground(index: 4, title: "Swipe")
        UIView.transition(with: figureView, duration: 0.35, options: .transitionCrossDissolve) {
            self.figureView.layer.contents = self.backgroundImages[4].cgImage
        }
    }

    private func animatePulse() {
        UIView.animate(withDuration: 0.18, animations: {
            self.figureView.transform = self.figureView.transform.scaledBy(x: 1.03, y: 1.03)
        }) { _ in
            UIView.animate(withDuration: 0.18) {
                self.figureView.transform = self.figureView.transform.scaledBy(x: 0.97, y: 0.97)
            }
        }
    }
}
