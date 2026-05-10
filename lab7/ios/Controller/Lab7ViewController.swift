import UIKit

// MARK: - Main controller

final class Lab7ViewController: UIViewController {
    private let segmentedControl = UISegmentedControl(items: ["2.2", "2.3", "2.4"])
    private let contentContainer = UIView()
    private let hintLabel = UILabel()

    private let graphicsView = Lab7CanvasView()
    private let animationView = Lab7AnimationView()
    private let gestureView = Lab7GestureView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.04, green: 0.05, blue: 0.08, alpha: 1.0)
        configureUI()
        showScreen(index: 0)
    }

    private func configureUI() {
        let titleLabel = UILabel()
        titleLabel.text = "Lab 7"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = .white

        let subtitleLabel = UILabel()
        subtitleLabel.text = GeometryVariant.title + " · circle segment and right trapezoid"
        subtitleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.72)

        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = UIColor(red: 0.48, green: 0.68, blue: 1.0, alpha: 1.0)
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.addTarget(self, action: #selector(screenChanged), for: .valueChanged)

        hintLabel.numberOfLines = 2
        hintLabel.textAlignment = .center
        hintLabel.font = .systemFont(ofSize: 13, weight: .medium)
        hintLabel.textColor = UIColor.white.withAlphaComponent(0.65)
        hintLabel.text = "Swipe between tasks with the control at the top.\nEach screen follows the MVC split."

        [titleLabel, subtitleLabel, segmentedControl, contentContainer, hintLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            segmentedControl.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            segmentedControl.heightAnchor.constraint(equalToConstant: 34),

            contentContainer.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 18),
            contentContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentContainer.bottomAnchor.constraint(equalTo: hintLabel.topAnchor, constant: -14),

            hintLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            hintLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            hintLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18)
        ])
    }

    @objc private func screenChanged() {
        showScreen(index: segmentedControl.selectedSegmentIndex)
    }

    private func showScreen(index: Int) {
        contentContainer.subviews.forEach { $0.removeFromSuperview() }

        let currentView: UIView
        switch index {
        case 1:
            currentView = animationView
        case 2:
            currentView = gestureView
        default:
            currentView = graphicsView
        }

        currentView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(currentView)
        NSLayoutConstraint.activate([
            currentView.topAnchor.constraint(equalTo: contentContainer.topAnchor),
            currentView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor),
            currentView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor),
            currentView.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor)
        ])
    }
}

