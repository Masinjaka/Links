import 'package:flutter_test/flutter_test.dart';
import 'package:linkvault/features/add_link/domain/normalized_url.dart';

void main() {
  const normalizer = UrlNormalizer();

  group('UrlNormalizer', () {
    test('normalizes equivalent mobile and tracked URLs identically', () {
      final first = normalizer.normalize(
        'http://m.Example.com:80/article/?utm_source=news#section',
      );
      final second = normalizer.normalize('https://example.com/article');

      expect(first.normalized, 'https://example.com/article');
      expect(first.hash, second.hash);
      expect(first.domain, 'example.com');
    });

    test('retains meaningful query values in stable key order', () {
      final result = normalizer.normalize(
        'example.com/search?z=last&q=flutter&gclid=tracking',
      );

      expect(result.normalized, 'https://example.com/search?q=flutter&z=last');
    });

    test('rejects values without a hostname', () {
      expect(() => normalizer.normalize('not a url'), throwsFormatException);
    });
  });
}
