import SwiftUI
import WebKit

// WebView
struct WebViewContainer: UIViewRepresentable {
    @Binding var webView: WKWebView
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

// Основной экран
struct ContentView: View {
    let url = URL(string: "https://lissa.si")!
    @State private var webView = WKWebView()

    var body: some View {
        NavigationView {
            WebViewContainer(webView: $webView, url: url)
                .navigationTitle("Lissa")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            webView.reload()
                        }) {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
        }
    }
}
