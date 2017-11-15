
# theLott Technical Test


At Tatts we work in a very heavily regulated industry. If we were to ship an app that displayed incorrect information, the consequences would involve us preparing a submission to government bodies explaining why.

As a result, we value test automation, and write object oriented code in a way that we can test down to the unit level.

For an iOS or Android app, this means patterns such as MVVM.

In this assignment you will be using JSON feed to read lotteries Jurisdictions/Companies and display in the table as shown below.
Please ignore header icon for simplicity reasons

This is the first screen of ‘the Lott’ iOS App in the AppStore


## Requirements

- Swift for an iOS sample, Java or Kotlin for an Android sample
- Screen uses MVVM pattern for unit testability and OOD
- Have Unit tests, testing the View Model
- Isolate/Override network API invocation for Unit Tests
- You are free to use 3rd party libraries for Networking or View-ViewModel binding.


## What we are looking for:
Code Style, Language/Platform Command, Class Design, and Code testability.


Please see API endpoint details on the next page.
### HTTP GET
```https://api.tatts.com/svc/sales/vmax/web/data/lotto/companies```


Sample Response

```
{
"Companies": [
{
"CompanyId": "GoldenCasket",
"CompanyDisplayName": "Golden Casket",
"CompanyDescription": "QLD Residents",
"CompanyLogoUrl": "http://tim.media.tatts.com/TattsServices/Lotto/Companies/GoldenCasket_v1.png"
},
{
"CompanyId": "NSWLotteries",
"CompanyDisplayName": "NSW Lotteries",
"CompanyDescription": "NSW Residents",
"CompanyLogoUrl": "http://tim.media.tatts.com/TattsServices/Lotto/Companies/NSWLotteries_v1.png"
},
{
"CompanyId": "NTLotteries",
"CompanyDisplayName": "NT Lotteries",
"CompanyDescription": "NT, International Residents",
"CompanyLogoUrl": "http://tim.media.tatts.com/TattsServices/Lotto/Companies/Tatts_v1.png"
},
{
"CompanyId": "SALotteries",
"CompanyDisplayName": "SA Lotteries",
"CompanyDescription": "SA Residents",
"CompanyLogoUrl": "http://tim.media.tatts.com/TattsServices/Lotto/Companies/SALotteries_v1.png"
},
{
"CompanyId": "Tattersalls",
"CompanyDisplayName": "Tattersall's",
"CompanyDescription": "VIC, TAS, ACT Residents",
"CompanyLogoUrl": "http://tim.media.tatts.com/TattsServices/Lotto/Companies/Tatts_v1.png"
}
],
"ErrorInfo": null,
"Success": true
}
```
