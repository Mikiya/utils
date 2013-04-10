
(defun todaydir()
  ()
  (format-time-string "~/Job/%Y%m%d/")
  )

(defun goto-todaydir ()
  (interactive)
  (let
      ((datedir (todaydir))
       (link "~/Today"))
    (if (not (file-exists-p datedir))
	(and (make-directory datedir)
	     (if (file-exists-p link)
		 (delete-file link))
	     (make-symbolic-link datedir link)
	     ))
    (find-file datedir))
)

(defun insert-todaydir ()
  (interactive)
  (let* 
      ((datedir (todaydir)))
    (if (not (file-exists-p datedir))
	(make-directory datedir)
      )
    (insert (todaydir))
    )
  )

(define-key ctl-x-map "T" 'goto-todaydir)
(define-key ctl-x-map "t" 'insert-todaydir)

