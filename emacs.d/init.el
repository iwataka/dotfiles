(menu-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get-bundle auto-complete
  :url "http://github.com/auto-complete/auto-complete"
  :fetures auto-complete)

(el-get-bundle color-theme-solarized
  :url "https://github.com/sellout/emacs-color-theme-solarized"
  :fetures color-theme-solarized
  (load-theme 'solarized t))

;; use light frames in the GUI and dark frames in the terminal
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-frame-parameter frame
                                 'background-mode
                                 (if (display-graphic-p frame) 'light 'dark))
            (enable-theme 'solarized)))

(el-get-bundle evil
  (evil-mode 1)
  (define-key evil-normal-state-map "Y" (kbd "y$"))
  (define-key evil-normal-state-map "+" 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map "-" 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "<tab>") 'other-window)
  (define-key evil-normal-state-map (kbd "<backtab>") 'prev-window))

(defun prev-window ()
  (interactive)
  (other-window -1))

(el-get-bundle blank-mode
  (setq-default blank-space nil)
  (setq-default blank-indentation nil)
  (setq-default blank-hspace nil)
  (setq-default blank-chars '(tabs trailing newline))
  (setq-default blank-active-chars '(tabs trailing newline))
  (eval-and-compile
    (blank-mode 1)
    (global-blank-mode 1)))

(el-get-bundle evil-escape
  :url "https://github.com/syl20bnr/evil-escape"
  :fetures evil-escape
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  (evil-escape-mode 1))

(el-get-bundle evil-leader
  :url "https://github.com/cofi/evil-leader"
  :features evil-leader
  (global-evil-leader-mode 1)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
   "o" 'delete-other-windows
   "w" 'evil-write
   "q" 'evil-quit
   "sc" 'eval-current-buffer))

(el-get-bundle evil-surround
  :url "https://github.com/timcharper/evil-surround"
  :features evil-surround)

(el-get-bundle projectile
  :url "https://github.com/bbatsov/projectile"
  :features projectile
  (projectile-global-mode)
  (evil-leader/set-key
    "p" 'helm-projectile-find-file-dwim
    "f" 'helm-recentf
    "b" 'helm-buffers-list
    "ei" 'open-init-file))

(el-get-bundle helm
  :url "https://github.com/emacs-helm/helm"
  :features helm
  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-scroll-amount 8))

(el-get-bundle magit
  :url "https://github.com/magit/magit"
  :features magit
  (setq magit-last-seen-setup-instructions "1.4.0")
  (evil-define-key 'motion magit-commit-mode-map
    (kbd "<tab>") 'magit-toggle-section
    (kbd "RET") 'magit-visit-item)
  (evil-define-key 'motion magit-diff-mode-map
    (kbd "<tab>") 'magit-toggle-section
    (kbd "RET") 'magit-visit-item)
  (evil-leader/set-key
    "gs" 'magit-status
    "gc" 'magit-commit
    "gA" 'magit-stage-all
    "gw" 'stage-this-file
    "gr" 'revert-this-file
    "gL" 'magit-log
    "ga" 'magit-commit-amend
    "gd" 'magit-diff))

(el-get-bundle git-gutter
  :url "https://github.com/syohex/emacs-git-gutter"
  :features git-gutter
  (global-git-gutter-mode 1)
  (define-key evil-normal-state-map (kbd "[c") 'git-gutter:previous-hunk)
  (define-key evil-normal-state-map (kbd "]c") 'git-gutter:next-hunk)
  (setq-default git-gutter:deleted-sign "-")
  (setq-default git-gutter:modified-sign "~")
  (setq-default git-gutter:force t)
  (evil-leader/set-key
    "gG" 'git-gutter:toggle
    "hs" 'git-gutter:stage-hunk
    "hr" 'git-gutter:revert-hunk))

(el-get-bundle ensime
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  (add-hook 'java-mode-hook 'ensime-scala-mode-hook))

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; Use the system clipboard
(setq x-select-enable-clipboard t)

(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun rename-this-file (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "New name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file filename new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun stage-this-file ()
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (magit-stage-item (buffer-file-name))
  (git-gutter:update-all-windows))

(defun revert-this-file ()
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (magit-revert-item (buffer-file-name))
  (git-gutter:update-all-windows))

