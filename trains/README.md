# What is the cheapest train to Manchester from a railway station 5km from the A1?

## The problem
After finishing second year in Cambridge, I stuck around for a summer internship. I had a break in the middle of my internship (see the Cambridge-JIC iGEM project @ http://2015.igem.org/Team:Cambridge-JIC ) and I was planning to visit Edinburgh Fringe for a week with a group of uni friends. One person in said group of friends has a car and volunteered to drive us. Sounds great!

My parents wanted me to come home to Manchester the weekend afterwards from Fringe before I head back to Cambridge to resume my internship. Turns out that trains are expensive and that I have no idea when my friends will start heading back on the next Saturday.

Alas! A saving grace! The friend with the car offered to drop me off at a train station near the A1 to save money... If I could find one! Now, how was I to do that?

The challenge: to find the cheapest train station near the A1 to get back to Manchester from.

## My solution
1. I began by obtaining a route from where we were staying in Edinburgh to Cambridge from osrm (an awesome project!) - http://map.project-osrm.org/ - as a gpx map
2. For every twenty gps coordinates, using ./foreachgpx.sh, I recursively queried wikidata for railway stations within 20km for each gps coordinate. This went into ```out20/```
3. I repeated this for within 5km of the A1 because it turns out that 20km is actually quite far. This went into ```out/```
4. I used firefox's inspector to copy the curl requests made by thetrainline.com when looking up prices. I implemented this into a script ```./getprices.sh``` to get the cheapest one. I then implemented ```./recursivegetprices.sh``` to run ```./getprices.sh``` for each unique station I found on wikidata. (My cookies have now expired, you will need to do this one yourself :P)
5. I tidied up the list. Turns out it includes stations that existed previously in the past and also stations that are planned to be built. Thetrainline.com seems to return the prices if the station does not exist. ```./cleanupprices.sh```, a naive solution that could be easily improved on was born. I did not bother since if two places have the same price it doesn't matter to me which one I go to.
6. ```./cleaned_5km_prices.csv``` contains the list of stations ordered by price. I manually checked the prices and turns out Newark Castle is only cheap (£13) if booked in advance - otherwise the price bumps up to ~£30. The other cheap ones appear to be cheap on the day too. 

Turns out to be Retford/Doncaster/Conisbrough/Adwick. Leeds was included in the 20km radius search, but turned out to result in far too much time lost in the trip and was the reason for the reduction in search radius.

Note: all prices were calculated without a railcard. As I have one, my fare will be slightly cheaper (by the same fraction regardless of starting station) anyway!

Success! Answers found to life's greatest problems and now I can move on with my life.
