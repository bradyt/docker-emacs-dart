
(setq dart-enable-analysis-server t)

(setq dart-debug t)
(toggle-debug-on-error)

(add-hook 'dart-mode-hook 'flycheck-mode)
