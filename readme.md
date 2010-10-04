CL Google Scholar
=================

This is a library that enables Common Lisp to retrieve and parse
Google Scholar search result.

Dependencies
------------

It depends on the following lovely libraries,
*    drakma
*    cl-ppcre
*    hunchentoot

hunchentoot should be optional, only url-encode is used.

Usage
-----
    (google-scholar:search-google-scholar "lisp")

This will return a list, each of which looks like
    (list :title title :authors ("Author A" "Author B") :year 1990 :publication "ACM SIGART Bulletin" :source "portal.acm.org")

