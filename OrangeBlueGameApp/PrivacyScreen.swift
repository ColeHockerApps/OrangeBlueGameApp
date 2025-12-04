import Combine
import SwiftUI
import WebKit

struct PrivacyScreen: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var paths: RealmPaths

    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.gradientBackground
                    .ignoresSafeArea()

                PrivacyPageView(url: paths.tomeScroll)
                    .ignoresSafeArea()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Privacy")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(AppTheme.textMain)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(AppTheme.textMain)
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(AppTheme.surfaceStrong)
                            )
                    }
                }
            }
        }
    }
}

struct PrivacyPageView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: .zero)

        view.allowsBackForwardNavigationGestures = true
        view.scrollView.bounces = true
        view.scrollView.showsVerticalScrollIndicator = true
        view.scrollView.showsHorizontalScrollIndicator = false
        view.isOpaque = false
        view.backgroundColor = .clear
        view.scrollView.backgroundColor = .clear

        let request = URLRequest(url: url)
        view.load(request)

        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
