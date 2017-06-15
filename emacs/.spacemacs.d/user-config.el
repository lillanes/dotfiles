;; ESC escapes from _everything_
(setq-default evil-escape-key-sequence "<ESC>")
;; Persistent undo:
(defvar undo-directory (concat spacemacs-cache-directory "undo"))
(unless (file-accessible-directory-p undo-directory)
  (make-directory undo-directory))
(setq undo-tree-auto-save-history t
      undo-tree-history-directory-alist (list (cons "." undo-directory)))

;; Text width column marker (fill-column-indicator)
(add-hook 'prog-mode-hook #'fci-mode)

;; Hack to get fill-column and trailing whitespace
;; We use whitespace mode to imitate Emacs's trailing whitespace feature
(add-hook 'prog-mode-hook #'whitespace-mode)
(setq whitespace-style '(face trailing))

;; Mapping '?' to help:
(defun apropos-under-cursor (&optional word)
  "Get documentation on symbol under cursor.
If WORD is positive, it gets docs on word under cursor."
  (interactive)
  (if word
      (apropos (word-at-point))
    (apropos (symbol-name (symbol-at-point)))))
(evil-define-key 'normal global-map (kbd "?")
  'apropos-under-cursor)
(evil-define-key 'normal global-map (kbd "C-?")
  (lambda () (interactive) (apropos-under-cursor 'word)))

;; Buffer switching with C-Tab
(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-iso-lefttab] 'previous-buffer)

;; SPC : is eval-expression
(spacemacs/set-leader-keys ":" 'eval-expression)

; SPC A switches between c++ file and header
(spacemacs/set-leader-keys
  "A" 'projectile-find-other-file)

;; Some useful keys
(spacemacs/set-leader-keys
  ;; Close buffer
  "d" 'kill-this-buffer
  ;; Remove trailing whitespace
  "W" 'delete-trailing-whitespace
  ;; Close other windows
  "o" 'delete-other-windows
  "+" 'evil-numbers/inc-at-pt
  "-" 'evil-numbers/dec-at-pt
  ;; run syntax/semantic checker
  "E" 'ycmd-parse-buffer
  ;; auto-fix error under pointer
  "ef" 'ycmd-fixit)

;; Org-mode stuff:
(with-eval-after-load 'org
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map [(control tab)] nil)))
  (setq default-major-mode 'org-mode
        org-todo-keywords '((sequence "TODO" "DOING" "|" "DONE" "CANCELLED"))
        org-todo-keyword-faces '(("DOING" . "#f0c674")))
  )

;; Layouts:
(spacemacs|define-custom-layout "TODO"
  :binding "t"
  :body
  (find-file "~/Sync/TODO.org"))

;; C++ Style:
(setq-default c-default-style "linux"
              c-basic-offset 4)
(c-set-offset 'innamespace 0)

;; PDDL as lisp:
(add-to-list 'auto-mode-alist '("\\.pddl\\'" . lisp-mode))

;; ;; TAB works as RET in helm:
;; (define-key helm-map [tab]
;;   'helm-maybe-exit-minibuffer)

;; YouCompleteMe uses my global conf (for default flags):
(setq ycmd-global-config "~/.spacemacs.d/ycm_global_conf.py")
