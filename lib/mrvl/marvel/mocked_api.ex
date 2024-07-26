defmodule Mrvl.Marvel.MockedApi do
  @moduledoc false

  def get_characters(_params) do
    # Mrvl.Marvel.Api.get_characters(%{"limit" => 1})
    {:ok,
     %Tesla.Env{
       method: :get,
       url:
         "http://gateway.marvel.com/v1/public/characters?apikey=14b5bfa84fd22b2f3493844f90a9ca6a&hash=f5a84722cc2055af39a4e36370677e0b&limit=1&ts=2024-07-26T11%3A08%3A37.123431",
       query: [],
       headers: [
         {"connection", "keep-alive"},
         {"date", "Fri, 26 Jul 2024 11:22:51 GMT"},
         {"etag", "bde0f4477acc21704a64368e0e66bbfd5a624def"},
         {"content-length", "5877"},
         {"content-type", "application/json; charset=utf-8"}
       ],
       body: %{
         "attributionHTML" =>
           "<a href=\"http://marvel.com\">Data provided by Marvel. © 2024 MARVEL</a>",
         "attributionText" => "Data provided by Marvel. © 2024 MARVEL",
         "code" => 200,
         "copyright" => "© 2024 MARVEL",
         "data" => %{
           "count" => 1,
           "limit" => 1,
           "offset" => 0,
           "results" => [
             %{
               "comics" => %{
                 "available" => 12,
                 "collectionURI" =>
                   "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                 "items" => [
                   %{
                     "name" => "Avengers: The Initiative (2007) #14",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/21366"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/24571"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #15",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/21546"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #16",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/21741"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #17",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/21975"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #18",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/22299"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/22300"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #19",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/22506"
                   },
                   %{
                     "name" => "Deadpool (1997) #44",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/8500"
                   },
                   %{
                     "name" => "Marvel Premiere (1972) #35",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/10223"
                   },
                   %{
                     "name" => "Marvel Premiere (1972) #36",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/10224"
                   },
                   %{
                     "name" => "Marvel Premiere (1972) #37",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/comics/10225"
                   }
                 ],
                 "returned" => 12
               },
               "description" => "",
               "events" => %{
                 "available" => 1,
                 "collectionURI" =>
                   "http://gateway.marvel.com/v1/public/characters/1011334/events",
                 "items" => [
                   %{
                     "name" => "Secret Invasion",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/events/269"
                   }
                 ],
                 "returned" => 1
               },
               "id" => 1_011_334,
               "modified" => "2014-04-29T14:18:17-0400",
               "name" => "3-D Man",
               "resourceURI" => "http://gateway.marvel.com/v1/public/characters/1011334",
               "series" => %{
                 "available" => 3,
                 "collectionURI" =>
                   "http://gateway.marvel.com/v1/public/characters/1011334/series",
                 "items" => [
                   %{
                     "name" => "Avengers: The Initiative (2007 - 2010)",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/series/1945"
                   },
                   %{
                     "name" => "Deadpool (1997 - 2002)",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/series/2005"
                   },
                   %{
                     "name" => "Marvel Premiere (1972 - 1981)",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/series/2045"
                   }
                 ],
                 "returned" => 3
               },
               "stories" => %{
                 "available" => 21,
                 "collectionURI" =>
                   "http://gateway.marvel.com/v1/public/characters/1011334/stories",
                 "items" => [
                   %{
                     "name" => "Cover #19947",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/19947",
                     "type" => "cover"
                   },
                   %{
                     "name" => "The 3-D Man!",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/19948",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "Cover #19949",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/19949",
                     "type" => "cover"
                   },
                   %{
                     "name" => "The Devil's Music!",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/19950",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "Cover #19951",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/19951",
                     "type" => "cover"
                   },
                   %{
                     "name" => "Code-Name:  The Cold Warrior!",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/19952",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "AVENGERS: THE INITIATIVE (2007) #14",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/47184",
                     "type" => "cover"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #14 - Int",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/47185",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "AVENGERS: THE INITIATIVE (2007) #15",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/47498",
                     "type" => "cover"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #15 - Int",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/47499",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "AVENGERS: THE INITIATIVE (2007) #16",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/47792",
                     "type" => "cover"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #16 - Int",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/47793",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "AVENGERS: THE INITIATIVE (2007) #17",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/48361",
                     "type" => "cover"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #17 - Int",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/48362",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "AVENGERS: THE INITIATIVE (2007) #18",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/49103",
                     "type" => "cover"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #18 - Int",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/49104",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #18, Zombie Variant - Int",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/49106",
                     "type" => "interiorStory"
                   },
                   %{
                     "name" => "AVENGERS: THE INITIATIVE (2007) #19",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/49888",
                     "type" => "cover"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #19 - Int",
                     "resourceURI" => "http://gateway.marvel.com/v1/public/stories/49889"
                   },
                   %{
                     "name" => "Avengers: The Initiative (2007) #14, Spotlight Variant - Int"
                   }
                 ],
                 "returned" => 20
               },
               "thumbnail" => %{
                 "extension" => "jpg",
                 "path" => "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"
               },
               "urls" => [
                 %{
                   "type" => "detail",
                   "url" =>
                     "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=14b5bfa84fd22b2f3493844f90a9ca6a"
                 },
                 %{
                   "type" => "wiki",
                   "url" =>
                     "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=14b5bfa84fd22b2f3493844f90a9ca6a"
                 },
                 %{
                   "type" => "comiclink",
                   "url" =>
                     "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=14b5bfa84fd22b2f3493844f90a9ca6a"
                 }
               ]
             }
           ],
           "total" => 1564
         },
         "etag" => "bde0f4477acc21704a64368e0e66bbfd5a624def",
         "status" => "Ok"
       },
       status: 200,
       opts: [],
       __module__: Mrvl.Marvel.Api,
       __client__: %Tesla.Client{fun: nil, pre: [], post: [], adapter: nil}
     }}
  end
end
