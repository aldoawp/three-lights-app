class ScrollPositionUtils {
  double scrollPosition = 0.0;

  void saveScrollPosition(double position) {
    scrollPosition = position;
  }

  double get currentScrollPosition => scrollPosition;
}
