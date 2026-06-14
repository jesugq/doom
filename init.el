(doom! :input

       :completion
       (corfu +orderless)
       vertico

       :ui
       doom
       dashboard
       hl-todo
       modeline
       ophints
       (popup +defaults)
       tabs
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       snippets
       (whitespace +guess +trim)

       :emacs
       dired
       electric
       tramp
       undo
       vc

       :term

       :checkers
       syntax

       :tools
       (eval +overlay)
       lookup
       magit

       :os
       (:if (featurep :system 'macos) macos)

       :lang
       emacs-lisp
       markdown
       org
       sh

       :email

       :app

       :config
       (default +bindings +smartparens))

