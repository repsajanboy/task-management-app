String greetingMessage() {
    final timeNow = DateTime.now().toLocal().hour;

    if (timeNow <= 12) {
      return 'Good morning,';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good afternoon,';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good evening,';
    } else {
      return 'Good night,';
    }
  }