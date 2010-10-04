(in-package :google-scholar)

(defstruct citation
  title
  authors
  year
  publication
  source)

(defun retrieve-url (url)
  (let ((content (drakma:http-request url)))
    content))

(defun get-scholar-search-url (keywords)
  ;; http://scholar.google.com/scholar?as_q=lisp&num=100&as_epq=&as_oq=&as_eq=&as_occt=title&as_sauthors=&as_publication=&as_ylo=&as_yhi=&as_sdt=1.&as_sdtp=on&as_sdts=5&btnG=Search+Scholar&hl=en
  (format nil "http://scholar.google.com/scholar?as_q=~A&num=100&as_epq=&as_oq=&as_eq=&as_occt=title&as_sauthors=&as_publication=&as_ylo=&as_yhi=&as_sdt=1.&as_sdtp=on&as_sdts=5&btnG=Search+Scholar&hl=en"
          (let ((keywords (if (listp keywords) keywords (list keywords))))
            (hunchentoot:url-encode (reduce (lambda (a b)
                                              (concatenate 'string a " " b))
                                            keywords
                                            :start 1 
                                            :initial-value (car keywords))))))

(defun get-search-content (keywords)
  (retrieve-url (get-scholar-search-url keywords)))

(defun get-title (thunk)
  (regex-replace-all "<.*?>" (regex-replace-all "<span.*</span>" (car (all-matches-as-strings "<h3>.*</h3>" thunk)) "") ""))

(defun get-meta-info (thunk)
  (regex-replace-all "<.*?>" (car (all-matches-as-strings "<span class=gs_a>.*?</span>" thunk)) ""))

(defun slice-entries (content)
  (cdr (split "<div class=gs_r><div class=gs_rt>" content)))

(defun parse-entry (thunk)
  (let* ((meta-info (split "\\s*-\\s*" (get-meta-info thunk)))
         (authors-str (car meta-info))
         (publication-info (split "\\s*,\\s*" (nth 1 meta-info)))
         (source (nth 2 meta-info)))
    (multiple-value-bind (publication year)
        (if (> (length publication-info) 1)
            (let ((publication (car publication-info))
                  (year (parse-integer (nth 1 publication-info) :junk-allowed 1)))
              (values publication year))
            (values "" (parse-integer (car publication-info) :junk-allowed 1)))
      (let ((authors (split "\\s*,\\s*" authors-str)))
        (make-citation :title (get-title thunk)
                       :year year
                       :publication publication
                       :source source
                       :authors authors)))))
                 
(defun search-google-scholar (keywords)
  "Retrieve and parse Google Scholar search result. keywords could be
either a list of keywords or a single word."
  (mapcar #'parse-entry 
          (slice-entries (get-search-content keywords))))
