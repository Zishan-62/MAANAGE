void main() {
List<Map<String, Object>> allCountries = [
  {
    "name": "Afghanistan",
    "code": "AF",
    "capital": "Kabul",
    "region": "AS",
    "currency": {"code": "AFN", "name": "Afghan afghani", "symbol": "؋"},
    "language": {"code": "ps", "name": "Pashto"},
    "flag": "https://restcountries.eu/data/afg.svg",
    "dialling_code": "+93"
  },
  {
    "name": "Zimbabwe",
    "code": "ZW",
    "capital": "Harare",
    "region": "AF",
    "currency": {"code": "BWP", "name": "Botswana pula", "symbol": "P"},
    "language": {
      "code": "en",
      "iso639_2": "eng",
      "name": "English",
      "nativeName": "English"
    },
    "flag": "https://restcountries.eu/data/zwe.svg",
    "dialling_code": "+263"
  }

];
 List<Map<String, Object>>filterByCountry(List<Map<String, Object>> list, String value){
   return list.where((mapObject) => (mapObject["name"] as String).startsWith(value)).toList(); 
  }
   List country=["Zimbabwe","Afghanistan"];
 List names=[];
  for(var i =0;i<country.length;i++){
  names.add(filterByCountry(allCountries, country[i]));
    
  }
print(names);
}
