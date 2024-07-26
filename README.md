# Mrvl

##  Display comic stuff

## First-time setup (only do once)

``` shell
asdf install
mix deps.get
mix setup
```

## Run the server

``` shell
iex -S mix phx.server
```

## Stuff I would like to change as a priority

 1. Use streams with async loading for the characters page
 2. Persist the api call cache so restarting the server does not mean becoming slow again.

## Original Goals
1. Fetch the characters from the Marvel API. Hint: You will use the URL http://gateway.marvel.com/v1/public/characters?[authenticated_params]

2. Render the characters in a grid view on the UI. We want to see a little CSS creativity here, so we intentionally did not provide designs. The grid view should be of the character thumbnail images with the character names overlayed on the bottom of the thumbnail. Since the text is hard to read in some cases, be sure to include a background on the text with a slightly transparent gradient overlaying the thumbnail to make the white text pop on the image while maintaining the visibility of the image. Feel free to choose LiveView or any SPA framework or library (Elm, React, Vue, Svelte, etc).

3. This is slow; every time we load the page, we need to fetch all the data again from the Marvel API. Let's implement a cache that stores this API call in memory so we don't need to keep fetching it on each page reload.

4. Upper management wants to know how often we are making requests to the Marvel API, so let's capture the timestamp of each successful API call into a database table.

5. You will notice that the API only gives us the first 20 results when we call it. Let's implement a pagination system to allow the users to see additional results in the UI. How does this affect our cache? Should we change anything?

6. Let's add more test coverage. We want to mock the API calls, test the front-end results, unit test the API authentication code, etc.

7. Returning to the UI, let's add a character details page. Users should be able to click on any thumbnail image in the characters index view and go to the details page. On this details page, the user should see the character's thumbnail image and the description of the character. Limit the description to 100 characters on the UI and truncate with an ellipsis (...) at the end of the sentence.

8. Now, implement a sub-tab system to display the comics and events tied to the character we are viewing the details for. The first tab is dedicated to displaying the list of comics. The second tab is dedicated to displaying the list of events. Just render the thumbnail images for both the comics and events in their respective tabs in a scrollable list; no pagination is required here, but the tab names should display the total count for the comics and events, respectively. We want to see a little CSS creativity here, so we intentionally did not provide designs.

9. What are some ways that we can improve the current code we just wrote? Think through the following:
	- Cache improvements (invalidation, pre-fetching, data optimization, handling API call failures, etc).
	- Improvements to the API interface.

## Handing in the solution

- Once you are done, ensure you committed and pushed all your changes, and then you can send your solution directly by email to [jobs@10ex.dev](mailto:jobs@10ex.dev?subject=10ex.dev%20Elixir%20Assignment), for example, as a zip archive. Please make sure the solution contains the entire project, including the `.git` directory, so we can have a look at your commits.

- [Schedule a follow up review call](https://meetings.hubspot.com/garrett-tacoronte/technical-review-call) to go over your final implementation.
