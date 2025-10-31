class CustomWeatherIconsModel {
  static final Map<String, String> iconMap = {
    '01d': "https://i.postimg.cc/Gt95k42t/sunny.png",
    '01n': "https://i.postimg.cc/v8LrzY9m/crescent-moon-1.png",
    '02d': "https://i.postimg.cc/vmV96bb9/Group-650.png",
    '02n': "https://i.postimg.cc/JnRn4Lh2/Mid-snow-fastttt-winds.png",
    '03d': "https://i.postimg.cc/brJwk9kB/cloudy.png",
    '03n': "https://i.postimg.cc/brJwk9kB/cloudy.png",
    '04d': "https://i.postimg.cc/ZKWqqjTN/Group-53.png",
    '04n': "https://i.postimg.cc/ZKWqqjTN/Group-53.png",
    '09d': "https://i.postimg.cc/MZFWgRyW/rain.png",
    '09n': "https://i.postimg.cc/MZFWgRyW/rain.png",
    '10d': "https://i.postimg.cc/W1PPP7tN/Weather-10-18.png",
    '10n': "https://i.postimg.cc/NfRjTFrN/Moon-cloud-mid-rain.png",
    '11d': "https://i.postimg.cc/sDP3xLkD/image-1.png",
    '11n': "https://i.postimg.cc/5trVDWCm/3431426.png",
    '13d': "https://i.postimg.cc/9fK6JP68/Big-snow-little-snow.png",
    '13n': "https://i.postimg.cc/9fK6JP68/Big-snow-little-snow.png",
    '50d': "https://i.postimg.cc/ZqGQrb3S/temp-icon.png",
    '50n': "https://i.postimg.cc/brTFc15J/Moon-fast-wind.png",
  };
  static String getWeatherIcon(String? iconCode) {
    return iconMap[iconCode] ??
        'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png';
  }
}
