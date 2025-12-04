import Combine
import SwiftUI
import UIKit

final class HapticsManager: ObservableObject {
    static let shared = HapticsManager()

    private let impactLight = UIImpactFeedbackGenerator(style: .light)
    private let impactMedium = UIImpactFeedbackGenerator(style: .medium)
    private let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    private let selection = UISelectionFeedbackGenerator()
    private let notification = UINotificationFeedbackGenerator()

    func tap() {
        impactLight.prepare()
        impactLight.impactOccurred()
    }

    func press() {
        impactMedium.prepare()
        impactMedium.impactOccurred()
    }

    func strong() {
        impactHeavy.prepare()
        impactHeavy.impactOccurred()
    }

    func select() {
        selection.prepare()
        selection.selectionChanged()
    }

    func success() {
        notification.prepare()
        notification.notificationOccurred(.success)
    }

    func warning() {
        notification.prepare()
        notification.notificationOccurred(.warning)
    }

    func error() {
        notification.prepare()
        notification.notificationOccurred(.error)
    }
}
