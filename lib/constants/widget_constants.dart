const maxBoxWidth = 720.0;

const double verySmallSpacing = 2;
const double smallSpacing = 4;

const double defaultIconSize = 16;

enum Spacing {
  small(16),
  medium(24),
  large(32),
  giant(44),
  giant2(64),
  giant3(72),
  giant4(80),
  giant5(96),
  ;

  const Spacing(this.value);

  final double value;
}
