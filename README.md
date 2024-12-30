# Laugh A Little
Laugh a little application is a personal project which consists of a simple application developed to showcase my skill of working with Flutter. This application can run either on mobile device or web browser. The idea behind this application was to build a platform that will provide a joke with a punchline to the user. The user can further use the joke(s) as an ice breaker, to enhance sense of humor, to spread laughter or to simply enjoy by themselves. Thus, reminding the user to ‘Laugh a little’!

* Application details and functionality :
  * Cross-Platform Compatibility: The app can run on both mobile devices and web browsers.
  * Joke API: The app fetches jokes using an open-source API that delivers random jokes with punchlines.
  * Navigation: The app features a simple navigation bar on the left side, with icons for "Home" (the main joke page) and "Favorites" (the list of user-saved jokes). On smaller screens (e.g., mobile devices in portrait mode), only icons are displayed, while on larger screens (e.g., tablets, laptops, or horizontal phone orientations), the full text labels are shown alongside the icons.
  * Main Page: The home tab displays a random joke with a "Punchline" extender. When clicked or tapped, the punchline is revealed.
  * Favorites: If a user finds a joke particularly funny, they can save it to their "Favorites" list by tapping the heart-shaped favorite button beneath the punchline. The favorite jokes can be accessed through the "Favorites" tab, represented by a laughter emoji.
  * Next Joke: Users can easily navigate to the next joke by tapping the "Next" button, which loads another random joke.
  * Favorites Page: The favorites page displays a list of all saved jokes, complete with their punchlines, for easy access.
* Technical Stack:
  * Programming Language : Dart
  * Tools : Flutter, Android Studio, Git bash
* Scripts:
  <table>
  <thead>
      <th>Script Name</th>
      <th>Purpose</th>
  </thead>
  <tbody>
    <tr>
      <td>favoritejokespage.dart</td>
      <td>Script that lays the favorite page widget.</td>
    </tr>
    <tr>
      <td>joke.dart</td>
      <td>Script that makes the API call and lays the joke card along with punchline extender widget.</td>
    </tr>
    <tr>
      <td>jokegeneratorpage.dart</td>
      <td>Script that consits of the joke card, puncline, favorite and next buttobn.</td>
    </tr>
    <tr>
      <td>main.dart</td>
      <td>Script that includes the stateful widget and chnagenotifier used to update and notify other widgets. This scripts also includes the Nav Bar implementation.</td>
    </tr>
  </tbody>
</table>
