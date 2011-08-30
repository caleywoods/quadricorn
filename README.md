What Is This?
-------------

This code shows how to the [Unicorn](http://unicorn.bogomips.org/)
web server on [DotCloud](http://www.dotcloud.com/).

Unicorn is a fast HTTP web server written in Ruby, able to run Rack and Rails apps.

To run this code on DotCloud, you need to [get a DotCloud
account](https://www.dotcloud.com/accounts/register/). DotCloud has a
free tier, so you won't even need to draw your wallet!

Then clone this repository:

    $ git clone git://github.com/caleywoods/quadricorn.git

And push it to DotCloud:

    $ cd quadricorn
    $ dotcloud push unicorn

Happy hacking! Remember: each time you modify something, you need to
git add + git commit your changes before doing `dotcloud push`.


How Does It Work?
-----------------

Since DotCloud cannot run arbitrary web servers (yet!), we use a ruby
service (which uses the nginx web server to handle HTTP requests). Inside
this service, we setup Unicorn to run on port 8080 (default). Then, we add an nginx
configuration snippet to proxy all incoming HTTP requests to port 8080,
effectively routing them to Unicorn, instead of Passenger.

To streamline scaling and deployment, we use a Gemfile (to install the
unicorn gem automatically), as well as the god process manager (to start
unicorn automatically).

If you want to see how this sample app was built, we invite you to:

* see the big picture with GitHub's awesome [compare view](https://github.com/caleywoods/unicorn/compare/begin...master) --
  click on each individual commit to see detailed explanations for each step
* if you prefer text mode (or offline inspection), fallback on
  `git log --patch --reverse`
* dive into [DotCloud documentation](http://docs.dotcloud.com/), especially
  the one for the [Ruby service](http://docs.dotcloud.com/services/ruby/>)
  which is used by this app.


Is This A Hack?
---------------

Yes, in the positive acceptance of this word :-)


Is This Supported?
------------------

Not officially. However, since it uses only documented parts of DotCloud
(ruby service, postinstall script, nginx snippet...), there's a high
likelihood it will still work with future versions of DotCloud.

As a matter of fact, when DotCloud releases better support for Unicorn
and other evented web servers, the modifications required to update your
code will be very, very minor.
