import MobileCoreServices
import Social

final class ShareViewController: SLComposeServiceViewController {
  private let appGroupName = "group.com.example.linkvault"
  private let sharedUrlKey = "pendingSharedUrl"

  override func isContentValid() -> Bool {
    return true
  }

  override func didSelectPost() {
    guard let items = extensionContext?.inputItems as? [NSExtensionItem] else {
      finish()
      return
    }
    let providers = items.flatMap { $0.attachments ?? [] }
    guard let provider = providers.first(where: supportsUrl) else {
      finish()
      return
    }
    loadUrl(from: provider)
  }

  override func configurationItems() -> [Any]! {
    return []
  }

  private func supportsUrl(_ provider: NSItemProvider) -> Bool {
    provider.hasItemConformingToTypeIdentifier(kUTTypeURL as String) ||
      provider.hasItemConformingToTypeIdentifier(kUTTypeText as String)
  }

  private func loadUrl(from provider: NSItemProvider) {
    let type = provider.hasItemConformingToTypeIdentifier(kUTTypeURL as String)
      ? kUTTypeURL as String
      : kUTTypeText as String
    provider.loadItem(forTypeIdentifier: type, options: nil) { [weak self] item, _ in
      let value = (item as? URL)?.absoluteString ?? item as? String
      DispatchQueue.main.async {
        self?.storeAndOpen(value)
      }
    }
  }

  private func storeAndOpen(_ value: String?) {
    guard let value, let url = firstUrl(in: value) else {
      finish()
      return
    }
    let defaults = UserDefaults(suiteName: appGroupName)
    defaults?.set(url, forKey: sharedUrlKey)
    let encoded = url.addingPercentEncoding(
      withAllowedCharacters: .urlQueryAllowed
    ) ?? url
    if let callback = URL(string: "linkvault://capture?url=\(encoded)") {
      extensionContext?.open(callback)
    }
    finish()
  }

  private func firstUrl(in text: String) -> String? {
    let pattern = #"https?://[^\s]+"#
    guard let range = text.range(of: pattern, options: .regularExpression) else {
      return nil
    }
    return String(text[range])
  }

  private func finish() {
    extensionContext?.completeRequest(returningItems: nil)
  }
}
