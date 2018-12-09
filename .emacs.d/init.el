
(add-to-list 'load-path "/root/.emacs.d/lisp/dart-mode/")
(add-to-list 'load-path "/root/.emacs.d/lisp/dash.el/")
(add-to-list 'load-path "/root/.emacs.d/lisp/s.el/")

(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))
(require 'subr-x)
(require 'dart-mode)

(setq dart-enable-analysis-server t)

(setq dart-debug t)
(toggle-debug-on-error)

(add-hook 'after-init-hook
          (lambda ()
            (unless noninteractive
              (view-echo-area-messages))
            (find-file "main.dart")
            (when (search-forward-regexp "^[\s]*void initState() {$" nil t)
              (goto-char (point-at-eol))
              (insert "\n"))))
