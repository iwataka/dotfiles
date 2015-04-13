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
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  ;; maps C-l to moving between multiple windows
  (define-key evil-normal-state-map (kbd "C-l") 'other-window))

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
   "q" 'evil-quit))

(el-get-bundle projectile
  :url "https://github.com/bbatsov/projectile"
  :features projectile
  (projectile-global-mode)
  (evil-leader/set-key
    "pf" 'helm-projectile-find-file-dwim
    "pb" 'helm-projectile-switch-to-buffer))

(el-get-bundle helm
  :url "https://github.com/emacs-helm/helm"
  :features helm)

(el-get-bundle ensime
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  (add-hook 'java-mode-hook 'ensime-scala-mode-hook))
