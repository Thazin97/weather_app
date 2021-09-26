class Helper{
  static String? mapStringToImage(String input){
    var name= "";
    switch(input){
      case"hr": name="heavyRain";
      break;
      case"sn": name="snow";
      break;
      case"lr": name="lightRain";
      break;
      case"hc": name="heavyCloud";
      break;
      case"lc": name="fewClouds";
      break;
      case"s": name="showers";
      break;
      case"c": name="sunny";
      break;
      case"t":name ="thunderStorm";
      break;
      default:
        name="sunny";
    }
    return name;

  }
}