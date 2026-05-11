<h1 align="center">
    <img src="./Screenshots/hero.png" alt="Do you even know me?">
</h1>

<p align="center">
  <i align="center">Create a quiz about yourself and find out how well your <b>friends and family</b> really know you</i>
</p>

<p align="center">
  <a href="https://apps.apple.com/us/app/do-you-even-know-me/id6753122279">
    <img src="https://img.shields.io/itunes/v/6753122279?label=App%20Store&logo=apple" alt="App Store Version">
  </a>
  <img src="https://img.shields.io/badge/Language-Swift-orange" alt="Swift">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="License">
  <img src="https://img.shields.io/github/stars/tagocms/DoYouEvenKnowMe" alt="GitHub Stars">
</p>

<p align="center">
  <a href="https://apps.apple.com/us/app/do-you-even-know-me/id6753122279">
    <img src="https://developer.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store.svg" alt="Download on the App Store" height="50">
  </a>
</p>

## Introduction

**Do you even know me?** is an **iOS app** built with UIKit that lets you build fully customized quizzes about yourself and challenge your friends and family to take them.

Define your own questions, add photos, pick a **custom color palette**, and see who scores highest on the leaderboard.

## Screenshots

<details open>
<summary>Screenshots</summary>
<br />

<p align="center">
    <img width="49%" src="./Screenshots/ss_1.png" alt="Home screen showing the list of saved quizzes"/>
&nbsp;
    <img width="49%" src="./Screenshots/ss_2.png" alt="Quiz creation screen with title, description and color palette options"/>
</p>
<p align="center">
    <img width="49%" src="./Screenshots/ss_3.png" alt="Question editor with multiple choice answers and optional photo"/>
&nbsp;
    <img width="49%" src="./Screenshots/ss_4.png" alt="Quiz answering screen with animated color transitions and score tracking"/>
</p>
<p align="center">
    <img width="49%" src="./Screenshots/ss_5.png" alt="End screen showing final score and name input for the leaderboard"/>
&nbsp;
    <img width="49%" src="./Screenshots/ss_6.png" alt="Leaderboard sheet displaying all respondents and their scores"/>
</p>

</details>

## Development

- **Architecture & Patterns**: MVC — each screen has a dedicated `UIViewController` paired with a programmatic `UIView`, keeping layout code out of controllers.
- **Frameworks**: UIKit for all UI; `UIColorWell` for the in-app color palette picker; `UISheetPresentationController` for the leaderboard bottom sheet; `PHPickerViewController` for photo selection.
- **Data persistence**: `QuizData` singleton encodes the quiz list as JSON to the Documents directory using `Codable`, with `.completeFileProtection` for on-device security.

## License

Do you even know me? is available under the [MIT License](./LICENSE).

The app is published on the [App Store](https://apps.apple.com/us/app/do-you-even-know-me/id6753122279).
