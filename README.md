Cacho
=====

Cache aware, Redis based HTTP client.

Description
-----------

Cacho is a HTTP client that understands cache responses and stores results in Redis.

Usage
-----

When you try to GET a remote resource, Cacho proxies the request to the original server
and returns an array of status, headers and body. If possible, it will also store the
response and serve it in subsequent requests.

    status, headers, body = Cacho.get("http://localhost:4000/cacheable")

You can also supply custom headers:

    status, headers, body = Cacho.get("http://localhost:4000/echo", "Accept" => "text/plain")

Installation
------------

    $ gem install cacho

License
-------

Copyright (c) 2010 Damian Janowski  & Michel Martens

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
