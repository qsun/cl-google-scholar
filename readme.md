CL Google Scholar
=================

This is a library that enables Common Lisp to retrieve and parse
Google Scholar search result.

Dependencies
------------

It depends on the following lovely libraries,
* drakma
* cl-ppcre
* hunchentoot

hunchentoot should be optional, only url-encode is used.

Usage
-----
    (google-scholar:search-google-scholar "lisp")

    (#S(GOOGLE-SCHOLAR:CITATION
        :TITLE " Common LISP: the language"
        :AUTHORS ("GL Steele")
        :YEAR 1990
        :PUBLICATION ""
        :SOURCE "books.google.com")
     #S(GOOGLE-SCHOLAR:CITATION
        :TITLE "The lisp machine manual"
        :AUTHORS ("D Weinreb" "D Moon")
        :YEAR 1981
        :PUBLICATION "ACM SIGART Bulletin"
        :SOURCE "portal.acm.org")
     #S(GOOGLE-SCHOLAR:CITATION
        :TITLE " LISP 1.5 programmer&#39;s manual"
        :AUTHORS ("J McCarthy")
        :YEAR 1965
        :PUBLICATION ""
        :SOURCE "books.google.com")
     #S(GOOGLE-SCHOLAR:CITATION
        :TITLE " Lisp"
        :AUTHORS ("PH Winston" "BKP Horn")
        :YEAR 1989
        :PUBLICATION ""
        :SOURCE "adsabs.harvard.edu")
     #S(GOOGLE-SCHOLAR:CITATION
        :TITLE "Reflection and semantics in Lisp"
        :AUTHORS ("BC Smith")
        :YEAR NIL
        :PUBLICATION ""
        :SOURCE "SIGPLAN  &hellip;, 1984")
     #S(GOOGLE-SCHOLAR:CITATION
        :TITLE "A LISP garbage-collector for virtual-memory computer systems"
        :AUTHORS ("RR Fenichel" "JC Yochelson")
        :YEAR 1969
        :PUBLICATION "Communications of the ACM"
        :SOURCE "portal.acm.org")
     #S(GOOGLE-SCHOLAR:CITATION
        :TITLE " The LISP tutor"
        :AUTHORS ("JR Anderson" "BJ Reiser")
        :YEAR 1985
        :PUBLICATION "Byte"
        :SOURCE "psychology.nottingham.ac.uk")
     #S(GOOGLE-SCHOLAR:CITATION
        :TITLE "Elements of Artificial Intelligence: An Introduction Using LISP."
        :AUTHORS ("SL Tanimoto")
        :YEAR 1987
        :PUBLICATION ""
        :SOURCE "csa.com")
     #S(GOOGLE-SCHOLAR:CITATION
        :TITLE " Common Lisp"
        :AUTHORS ("GL Steele Jr" "SE Fahlman" "RP Gabriel" "DA Moon"
                  "DL  &hellip;")
        :YEAR 1990
        :PUBLICATION "The language"
        :SOURCE NIL))

`citation` struct defined as,
           (defstruct citation
             title
             authors
             year
             publication
             source)

