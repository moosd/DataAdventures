# What is the cheapest train to Manchester from a railway station 5km from the A1?

## The problem
I was visiting Edinburgh Fringe for a week with a group of friends. One person in said group of friends has a car and volunteered to drive us. Sounds great!

My parents wanted me to come home to Manchester the weekend afterwards from Fringe before I head back to Cambridge for my summer internship. Turns out that trains are expensive and that I have no idea when my friends will start heading back.

But the friend with the car offered to drop me off at a train station near the A1 to save money if I could find one. Now, how was I to do that?

## My solution
1. I began by obtaining a route from where we were staying in Edinburgh to Cambridge from osrm (an awesome project!) - http://map.project-osrm.org/ - as a gpx map
2. For every twenty gps coordinates, using ./foreachgpx.sh, I recursively queried wikidata for railway stations within 20km for each gps coordinate. This went into ```out20/```
3. I repeated this for within 5km of the A1 because it turns out that 20km is actually quite far. This went into ```out/```
4. I used firefox's inspector to copy the curl requests made by thetrainline.com when looking up prices. I implemented this into a script ```./getprices.sh``` to get the cheapest one. I then implemented ```./recursivegetprices.sh``` to run ```./getprices.sh``` for each unique station I found on wikidata. (My cookies have now expired, you will need to do this one yourself :P)
5. I tidied up the list. Turns out it includes stations that existed previously in the past and also stations that are planned to be built. Thetrainline.com seems to return the prices if the station does not exist. ```./cleanupprices.sh```, a naive solution that could be easily improved on was born. I did not bother since if two places have the same price it doesn't matter to me which one I go to.
6. ```./cleaned_5km_prices.csv``` contains the list of stations ordered by price. I manually checked the prices and turns out Newark Castle is only cheap if booked in advance. The other cheap ones appear to be cheap on the day too.

Success! Answers found to life's greatest problems and now I can move on with my life.
