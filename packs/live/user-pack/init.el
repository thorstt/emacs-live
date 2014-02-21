;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(setq live-disable-zone t)      ;; disable the silly putz with case thing

;; My custom stuff
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/erlang")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ocaml-mode")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/csharp-mode")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/fsharp-mode")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/git-commit-mode")
;; (require 'inf-haskell)
(require 'haskell-session)
(require 'haskell-indentation)
(require 'inf-caml)
(require 'erlang)
(require 'csharp-mode)
(require 'inf-fsharp-mode)
(require 'git-commit)
;; (add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.ml$" . caml-mode))
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))
(add-hook 'python-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'c-mode-common-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'cperl-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'perl-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'java-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'js-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'csharp-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'caml-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'nxml-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'html-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))
(add-hook 'erlang-load-hook 'my-erlang-load-hook)
(defun my-erlang-load-hook ()
  (setq exec-path(cons "/opt/otp/bin" exec-path))
  (setq erlang-root-dir "/opt/otp"))
(add-hook 'erlang-mode-hook (lambda () (local-set-key "\r" 'reindent-then-newline-and-indent)))

(add-hook 'git-commit-mode-hook 'turn-on-flyspell)

;; some whitespace stuff
(global-whitespace-mode 1)

(setq whitespace-line-column 80
      whitespace-style '(face tabs trailing lines-tail))

(set-face-attribute 'whitespace-line nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)

(set-face-attribute 'whitespace-tab nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)
