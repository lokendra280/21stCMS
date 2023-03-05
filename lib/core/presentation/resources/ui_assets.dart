class UIAssets {
  static const gifDir = "assets/gif";
  static const imageDir = "assets/images";
  static const animationDir = "assets/animation";
  static const shimmerEffectGif = "$gifDir/loading.gif";
  static const placeHolderImage = "$gifDir/loading.gif";
  static const logoLight = "$imageDir/logo_light.png";
  static const logo = "$imageDir/logo.png";
  static const svgDir = "assets/icons/svg";

  static String getImage(String imageName) {
    return imageDir + "/" + imageName;
  }

  static String getDummyImage(String imageName) {
    return imageDir + "/dummy/" + imageName;
  }

  static String getAnimation(String animationName) {
    return "$animationDir/$animationName";
  }

  static String getIcon(String icon) {
    return "assets/icons/$icon";
  }

  static String getSvg(String iconName) {
    return svgDir + "/" + iconName;
  }
}
