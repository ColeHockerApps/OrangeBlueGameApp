import Combine
import SwiftUI

struct PlayButtonView: View {
    let isPressed: Bool
    let animatePulse: Bool
    let onPressDown: () -> Void
    let onPressUp: () -> Void

    @State private var pulse: Bool = false

    var body: some View {
        ZStack {
            if animatePulse {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                AppTheme.accentPrimary.opacity(0.25),
                                AppTheme.accentSecondary.opacity(0.05)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .scaleEffect(pulse ? StyleTokens.playPulseScale : 1.0)
                    .opacity(pulse ? 0.0 : 0.7)
                    .animation(
                        Animation
                            .easeInOut(duration: StyleTokens.playPulseDuration)
                            .repeatForever(autoreverses: true),
                        value: pulse
                    )
            }

            Circle()
                .fill(
                    LinearGradient(
                        colors: [AppTheme.accentPrimary, AppTheme.accentSecondary],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    Circle()
                        .stroke(
                            Color.white.opacity(0.28),
                            lineWidth: 2
                        )
                )
                .shadow(color: AppTheme.shadowSoft,
                        radius: StyleTokens.shadowRadius + 4,
                        x: 0,
                        y: StyleTokens.shadowYOffset + 2)
                .overlay(label)
                .scaleEffect(isPressed ? StyleTokens.playPressScale : 1.0)
                .animation(.easeOut(duration: 0.15), value: isPressed)
        }
        .frame(width: 180, height: 180)
        .contentShape(Circle())
        .onAppear {
            guard animatePulse else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                pulse = true
            }
        }
        .onLongPressGesture(
            minimumDuration: 0,
            maximumDistance: 80,
            pressing: { pressing in
                if pressing {
                    onPressDown()
                } else {
                    onPressUp()
                }
            },
            perform: { }
        )
    }

    private var label: some View {
        VStack(spacing: 10) {
            Image(systemName: "play.fill")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(.white)

            Text("Play")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}
