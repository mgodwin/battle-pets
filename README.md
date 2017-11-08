# Battle Pets Arena

## Getting Setup

Make sure you have ruby 2.4.0 installed, using the ruby version manager of your
choice.

Then get the app setup by running:

    gem install bundler
    bundle install
    # Ensure you have postgres installed
    rails db:setup

Now you're ready to boot up the API with the command `rails s`!

## Game

I included a script that has a simple CLI interface to simulate a game
experience for battle pets arena.  You can run this with the following command:

    bin/game

If all goes well it should be pretty straightforward to start a contest!

## Testing

There are not nearly as many tests as would be preferable, but I did write some
tests for some areas that were confusing or where I wasn't sure what Rails would
do in certain circumstances.  You can run the tests with the normal rails test
command, `rails test`.

## Other Notes

There was one requirement that I was unable to get to, due to lack of time: the viewing of historical contests.  The API endpoint actually
exists, but I was unable to surface it through the game interface.  I think a
great addition could be to show Contest Events through the `contests`
endpoint, or link to them, so you could see a play-by-play of past matches,
similar to what other contest based games like League of Legends do.

The game class is an area that could easily be refactored and tested more
thoroughly - towards the end I was moving pretty fast to get everything working.
Along those same lines, the clients - ArenaClient and PetsClient, are untested
and it'd be an interesting project to look into how to stub out HTTP
requests/data to write tests for those more thoroughly.

One area I think I really nailed was the STI for the contest types - it's really
easy to add new types in the future, which is specifically called out in the
docs.

This was a fun project, I appreciate the opportunity and your time!
