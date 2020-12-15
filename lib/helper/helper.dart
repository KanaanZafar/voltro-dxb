enum Item { Home, Search }

extension ActiveItem on Item {
  String get activeIcon {
    switch (this) {
      case Item.Home:
        return "assets/home_active.svg";
      case Item.Search:
        return "assets/search_active.svg";
      default:
        return null;
    }
  }
}

extension InactiveItem on Item {
  String get inactiveIcon {
    switch (this) {
      case Item.Home:
        return "assets/home_inactive.svg";
      case Item.Search:
        return "assets/search_inactive.svg";
      default:
        return null;
    }
  }
}


