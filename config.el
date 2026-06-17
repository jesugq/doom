;; mods
(setq mac-command-modifier 'meta)

;; tabs
(if (eq system-type 'gnu/linux)
    (map! :gn "<C-prior>" #'centaur-tabs-backward
          :gn "<C-next>"  #'centaur-tabs-forward
    )
  (map! :gn "M-{"         #'centaur-tabs-backward
        :gn "M-}"         #'centaur-tabs-forward
  )
)

;; theme
(setq doom-theme 'kaolin-modo-dark)

;; font
(setq doom-font (font-spec :family "Office Code Pro" :size 30))

;; center
(add-hook 'text-mode-hook #'visual-fill-column-mode)
(setq-default visual-fill-column-center-text t)

;; lines
(setq display-line-numbers-type 'visual)
(setq line-move-visual t)

;; non-white selection
(custom-set-faces!
  `(region :background ,gray0 :foreground unspecified)
)

;; colors
(setq cerise0 "#e121b1"
      magenta0 "#c932c9"
      purple0 "#ab33eb"
      violet0 "#853ae1"

      cyan1 "#57bfc2"
      teal1 "#4d9391"
      aquamarine1 "#47ba99"
      spring-green1 "#35bf88"

      gray0 "#353b3c"
)

;; preload
(if (eq system-type 'gnu/linux)
    (setq org-directory "~/Sync/Apps/Orgmode")
  (setq org-directory "~/Development/orgmode")
)
(after! org
  ;; directory
  (setq org-default-notes-file (expand-file-name "@inbox.org" org-directory))
  (setq org-capture-templates
        '(("n" "Inbox" entry (file "@inbox.org") "* %?"))
  )
  (setq org-agenda-files
      (mapcar (lambda (path) (expand-file-name path org-directory))
              '("."
                "01 insights"
                "02 PROJECTS"
                "03 routines"
                "04 FEATURES"
                "05 outlines"
                "06 NOTEPADS"
               )
      )
  )

  ;; options
  (setq org-startup-folded t)
  (setq org-log-done 'time)
  (setq org-agenda-dim-blocked-tasks nil)
  (setq org-tags-match-list-sublevels nil)

  ;; tags
  (setq org-tag-alist
        '(("coder" . ?c)
          ("phone" . ?p)
          ("einks" . ?e)
         )
  )

  ;; prios
  (setq org-priority-highest ?A
        org-priority-lowest  ?D
        org-priority-default ?D)
  (setq org-priority-faces
        `((?A :foreground ,cerise0 :weight bold)
          (?B :foreground ,magenta0 :weight bold)
          (?C :foreground ,purple0 :weight bold)
          (?D :foreground ,violet0 :weight bold)
         )
  )

  ;; faces
  (setq org-todo-keywords '((sequence "TODO(t)" "FUZZY(f)" "READY(r)" "|" "DONE(d)")))
  (setq org-todo-keyword-faces
        `(("TODO" :foreground ,cyan1 :weight bold)
          ("FUZZY" :foreground ,teal1 :weight bold)
          ("READY" :foreground ,aquamarine1 :weight bold)
          ("DONE" :foreground ,spring-green1 :weight bold)
         )
  )

  ;; agenda
  (setq org-agenda-custom-commands
      '(("i" "Tags"
         ((tags-todo "+coder")
         )
        )
        ("o" "Faces"
         ((todo "READY")
          (todo "FUZZY")
         )
        )
        ("p" "Prios"
         ((tags-todo "+PRIORITY=\"A\"/TODO")
          (tags-todo "+PRIORITY=\"B\"/TODO")
         )
        )
        ("a" "Agenda"
         ((agenda ""
                  ((org-agenda-span 10)
                   (org-agenda-show-log nil)
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'done))
                  )
         ))
        )
        ("z" "Closed"
         ((agenda ""
                  ((org-agenda-span 31)
                   (org-agenda-start-day "-30d")
                   (org-agenda-show-all-dates nil)
                   (org-agenda-show-log 'closed)
                   (org-agenda-log-mode-items '(closed))
                   (org-agenda-entry-types '(:closed))
                  )
          ))
        )
       )
  )
)

