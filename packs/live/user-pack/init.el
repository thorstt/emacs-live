;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(setq live-disable-zone t)      ;; disable the silly putz with case thing

;; My custom stuff
(add-to-list 'load-path "/usr/share/emacs/site-lisp/erlang")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ocaml-mode")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/csharp-mode")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/fsharp-mode")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/git-commit-mode")
(require 'inf-caml)
(require 'erlang)
;(require 'csharp-mode)
;(require 'inf-fsharp-mode)
;(require 'git-commit)
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
;;(add-hook 'erlang-load-hook 'my-erlang-load-hook)
;;(defun my-erlang-load-hook ()
;;  (setq exec-path(cons "/opt/otp/bin" exec-path))
;;  (setq erlang-root-dir "/opt/otp"))
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

;; fix keys inside tmux
;; put the following line in your ~/.tmux.conf:
;;   setw -g xterm-keys on
(if (getenv "TMUX")
  (progn
    (let ((x 2) (tkey ""))
      (while (<= x 8)
             ;; shift
             (if (= x 2)
               (setq tkey "S-"))
             ;; alt
             (if (= x 3)
               (setq tkey "M-"))
             ;; alt + shift
             (if (= x 4)
               (setq tkey "M-S-"))
             ;; ctrl
             (if (= x 5)
               (setq tkey "C-"))
             ;; ctrl + shift
             (if (= x 6)
               (setq tkey "C-S-"))
             ;; ctrl + alt
             (if (= x 7)
               (setq tkey "C-M-"))
             ;; ctrl + alt + shift
             (if (= x 8)
               (setq tkey "C-M-S-"))

             ;; arrows
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d A" x)) (kbd (format "%s<up>" tkey)))
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d B" x)) (kbd (format "%s<down>" tkey)))
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d C" x)) (kbd (format "%s<right>" tkey)))
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d D" x)) (kbd (format "%s<left>" tkey)))
             ;; home
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d H" x)) (kbd (format "%s<home>" tkey)))
             ;; end
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d F" x)) (kbd (format "%s<end>" tkey)))
             ;; page up
             (define-key key-translation-map (kbd (format "M-[ 5 ; %d ~" x)) (kbd (format "%s<prior>" tkey)))
             ;; page down
             (define-key key-translation-map (kbd (format "M-[ 6 ; %d ~" x)) (kbd (format "%s<next>" tkey)))
             ;; insert
             (define-key key-translation-map (kbd (format "M-[ 2 ; %d ~" x)) (kbd (format "%s<delete>" tkey)))
             ;; delete
             (define-key key-translation-map (kbd (format "M-[ 3 ; %d ~" x)) (kbd (format "%s<delete>" tkey)))
             ;; f1
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d P" x)) (kbd (format "%s<f1>" tkey)))
             ;; f2
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d Q" x)) (kbd (format "%s<f2>" tkey)))
             ;; f3
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d R" x)) (kbd (format "%s<f3>" tkey)))
             ;; f4
             (define-key key-translation-map (kbd (format "M-[ 1 ; %d S" x)) (kbd (format "%s<f4>" tkey)))
             ;; f5
             (define-key key-translation-map (kbd (format "M-[ 15 ; %d ~" x)) (kbd (format "%s<f5>" tkey)))
             ;; f6
             (define-key key-translation-map (kbd (format "M-[ 17 ; %d ~" x)) (kbd (format "%s<f6>" tkey)))
             ;; f7
             (define-key key-translation-map (kbd (format "M-[ 18 ; %d ~" x)) (kbd (format "%s<f7>" tkey)))
             ;; f8
             (define-key key-translation-map (kbd (format "M-[ 19 ; %d ~" x)) (kbd (format "%s<f8>" tkey)))
             ;; f9
             (define-key key-translation-map (kbd (format "M-[ 20 ; %d ~" x)) (kbd (format "%s<f9>" tkey)))
             ;; f10
             (define-key key-translation-map (kbd (format "M-[ 21 ; %d ~" x)) (kbd (format "%s<f10>" tkey)))
             ;; f11
             (define-key key-translation-map (kbd (format "M-[ 23 ; %d ~" x)) (kbd (format "%s<f11>" tkey)))
             ;; f12
             (define-key key-translation-map (kbd (format "M-[ 24 ; %d ~" x)) (kbd (format "%s<f12>" tkey)))
             ;; f13
             (define-key key-translation-map (kbd (format "M-[ 25 ; %d ~" x)) (kbd (format "%s<f13>" tkey)))
             ;; f14
             (define-key key-translation-map (kbd (format "M-[ 26 ; %d ~" x)) (kbd (format "%s<f14>" tkey)))
             ;; f15
             (define-key key-translation-map (kbd (format "M-[ 28 ; %d ~" x)) (kbd (format "%s<f15>" tkey)))
             ;; f16
             (define-key key-translation-map (kbd (format "M-[ 29 ; %d ~" x)) (kbd (format "%s<f16>" tkey)))
             ;; f17
             (define-key key-translation-map (kbd (format "M-[ 31 ; %d ~" x)) (kbd (format "%s<f17>" tkey)))
             ;; f18
             (define-key key-translation-map (kbd (format "M-[ 32 ; %d ~" x)) (kbd (format "%s<f18>" tkey)))
             ;; f19
             (define-key key-translation-map (kbd (format "M-[ 33 ; %d ~" x)) (kbd (format "%s<f19>" tkey)))
             ;; f20
             (define-key key-translation-map (kbd (format "M-[ 34 ; %d ~" x)) (kbd (format "%s<f20>" tkey)))

             (setq x (+ x 1))
             ))
    )
  )

