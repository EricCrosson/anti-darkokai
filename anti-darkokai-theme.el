;;; darkokai-theme.el --- A darker variant on Monokai.

;; URL: http://github.com/sjrmanning/darkokai
;; Package-Version: 20160803.2058
;; Version: 0.1.0

;;; Commentary:
;;
;; This theme and particular the structure of this file is entirely based
;; on the great work by `oneKelvinSmith' and his port of the monokai theme
;; found at https://github.com/oneKelvinSmith/monokai-emacs.
;;
;; Darkokai arose after I found myself making more and more small tweaks
;; to monokai via a separate theme overrides file. Eventually it made more
;; sense to create a new theme as it was diverging significantly from the
;; original theme.
;;
;; Pull requests, and suggestions are most welcome!
;;
;;; Code:

(unless (>= emacs-major-version 24)
  (error "The darkokai theme requires Emacs 24 or later!"))

(deftheme anti-darkokai "The Anti-Darkokai colour theme")

(defgroup anti-darkokai nil
  "Anti-Darkokai theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom anti-darkokai-mode-line-padding 8
  "Amount of padding around the mode-line text. Set to 1 for normal look."
  :type 'number
  :group 'anti-darkokai)

(defcustom anti-darkokai-distinct-fringe-background t
  "Make the fringe background different from the normal background color.
Also affects 'linum-mode' background."
  :type 'boolean
  :group 'anti-darkokai)

(defcustom anti-darkokai-use-variable-pitch t
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'anti-darkokai)

(defcustom anti-darkokai-high-contrast-mode-line nil
  "Make the active/inactive mode line stand out more."
  :type 'boolean
  :group 'anti-darkokai)

(defcustom anti-darkokai-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'anti-darkokai)

(defcustom anti-darkokai-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'anti-darkokai)

(defcustom anti-darkokai-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'anti-darkokai)

(defcustom anti-darkokai-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'anti-darkokai)

(defcustom anti-darkokai-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'anti-darkokai)

(defmacro anti-darkokai-with-color-vars (&rest body)
  (declare (indent 0))
  `(let* ((class '((class color) (min-colors 257)))
          ;; Primary colors
          (anti-darkokai-yellow           "#19248B")
          (anti-darkokai-orange           "#0053B5")
          (anti-darkokai-red              "#00FF99")
          (anti-darkokai-magenta          "#007100")
          (anti-darkokai-violet           "#548100")
          (anti-darkokai-blue             "#F92700")
          (anti-darkokai-cyan             "#AC0D23")
          (anti-darkokai-green            "#9C21A2")
          (anti-darkokai-gray             "#CAC6C4")
          ;; Darker and lighter accented colors
          (anti-darkokai-yellow-d         "#414DBB")
          (anti-darkokai-yellow-l         "#000857")
          (anti-darkokai-orange-d         "#2170D2")
          (anti-darkokai-orange-l         "#003D9F")
          (anti-darkokai-red-d            "#08FFA8")
          (anti-darkokai-red-l            "#019E5F")
          (anti-darkokai-magenta-d        "#009E00")
          (anti-darkokai-magenta-l        "#003B00")
          (anti-darkokai-violet-d         "#6DA800")
          (anti-darkokai-violet-l         "#365300")
          (anti-darkokai-blue-d           "#BF351B")
          (anti-darkokai-blue-l           "#6D1808")
          (anti-darkokai-cyan-d           "#FF4D53")
          (anti-darkokai-cyan-l           "#440810")
          (anti-darkokai-green-d          "#793CF2")
          (anti-darkokai-green-l          "#4410AC")
          (anti-darkokai-gray-ld          "#C7C3C2")
          (anti-darkokai-gray-d           "#CAC6C4")
          (anti-darkokai-gray-dd          "#D4D0CE")
          (anti-darkokai-gray-l           "#AEA8A6")
          (anti-darkokai-green-plain      "#D52FBC")
          (anti-darkokai-red-plain        "#009EA6")
          ;; Adaptive colors
          (anti-darkokai-fg               "#070403")
          (anti-darkokai-bg               "#DBD8D7")
          (anti-darkokai-highlight-line   "#BDB8B7")
          (anti-darkokai-highlight        "#A29C9A")
          (anti-darkokai-emph             "#000000")
          (anti-darkokai-comments         "#95928F")
          ;; Adaptive higher/lower contrast accented colors
          (anti-darkokai-fg-hc            "#EBEBEB")
          (anti-darkokai-fg-lc            "#E8E5F4")
          ;; High contrast colors
          (anti-darkokai-yellow-hc        "#000531")
          (anti-darkokai-yellow-lc        "#6570DE")
          (anti-darkokai-orange-hc        "#00418B")
          (anti-darkokai-orange-lc        "#58A4FF")
          (anti-darkokai-red-hc           "#014F33")
          (anti-darkokai-red-lc           "#0DFFAA")
          (anti-darkokai-magenta-hc       "#013906")
          (anti-darkokai-magenta-lc       "#0CF620")
          (anti-darkokai-violet-hc        "#0F1800")
          (anti-darkokai-violet-lc        "#87CF03")
          (anti-darkokai-blue-hc          "#350A02")
          (anti-darkokai-blue-lc          "#E24B2F")
          (anti-darkokai-cyan-hc          "#2C0409")
          (anti-darkokai-cyan-lc          "#B44151")
          (anti-darkokai-green-hc         "#330B83")
          (anti-darkokai-green-lc         "#9C21A2")
          ;; customize based face properties
          (s-variable-pitch         (if anti-darkokai-use-variable-pitch
                                        'variable-pitch 'default))
          (s-fringe-bg              (if anti-darkokai-distinct-fringe-background
                                        anti-darkokai-gray-dd anti-darkokai-bg))
          (s-mode-line-fg           (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-bg anti-darkokai-fg))
          (s-mode-line-bg           (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-fg anti-darkokai-gray))
          (s-mode-line-buffer-id-fg (if anti-darkokai-high-contrast-mode-line
                                        'unspecified anti-darkokai-green-lc))
          (s-mode-line-inactive-fg  (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-fg anti-darkokai-comments))
          (s-mode-line-inactive-bg  (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-gray-dd anti-darkokai-bg))
          (s-mode-line-inactive-bc  (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-fg anti-darkokai-gray))

          ;; powerline
          (s-powerline-active1-bg   (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-gray-l anti-darkokai-gray))
          (s-powerline-active2-bg   (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-gray anti-darkokai-gray-l))
          (s-powerline-inactive1-bg (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-gray anti-darkokai-gray-d))
          (s-powerline-inactive2-bg (if anti-darkokai-high-contrast-mode-line
                                        anti-darkokai-bg anti-darkokai-gray))

          ;; Definitions for terminals that do not support 256 colors
          (terminal-class                    '((class color) (min-colors 89)))
          ;; Primary colors
          (terminal-anti-darkokai-yellow           "#32398C")
          (terminal-anti-darkokai-orange           "#0073FF")
          (terminal-anti-darkokai-red              "#00EB6C")
          (terminal-anti-darkokai-magenta          "#28FF28")
          (terminal-anti-darkokai-violet           "#507800")
          (terminal-anti-darkokai-blue             "#A02800")
          (terminal-anti-darkokai-cyan             "#A00000")
          (terminal-anti-darkokai-green            "#7828FF")
          (terminal-anti-darkokai-gray             "#C2C2C2")
          ;; Darker and lighter accented colors
          (terminal-anti-darkokai-yellow-d         "#7878FF")
          (terminal-anti-darkokai-yellow-l         "#000078")
          (terminal-anti-darkokai-orange-d         "#50A0FF")
          (terminal-anti-darkokai-orange-l         "#0050A0")
          (terminal-anti-darkokai-red-d            "#78FFFF")
          (terminal-anti-darkokai-red-l            "#00A078")
          (terminal-anti-darkokai-magenta-d        "#50FF78")
          (terminal-anti-darkokai-magenta-l        "#007820")
          (terminal-anti-darkokai-violet-d         "#A0FF50")
          (terminal-anti-darkokai-violet-l         "#507828")
          (terminal-anti-darkokai-blue-d           "#FF7878")
          (terminal-anti-darkokai-blue-l           "#782800")
          (terminal-anti-darkokai-cyan-d           "#A05050")
          (terminal-anti-darkokai-cyan-l           "#500000")
          (terminal-anti-darkokai-green-d          "#A078FF")
          (terminal-anti-darkokai-green-l          "#5028FF")
          (terminal-anti-darkokai-gray-d           "#CCCCCC")
          (terminal-anti-darkokai-gray-l           "#8F8F8F")
          ;; Adaptive colors
          (terminal-anti-darkokai-fg               "#0A0A0A")
          (terminal-anti-darkokai-bg               "#E4E1E3")
          (terminal-anti-darkokai-highlight-line   "#B8B8B8")
          (terminal-anti-darkokai-highlight        "#0B5B9F")
          (terminal-anti-darkokai-emph             "#000505")
          (terminal-anti-darkokai-comments         "#747787")
          ;; Adaptive higher/lower contrast accented colors
          (terminal-anti-darkokai-fg-hc            "#E8E5F4")
          (terminal-anti-darkokai-fg-lc            "#EBEBEB")
          ;; High contrast colors
          (terminal-anti-darkokai-yellow-hc        terminal-anti-darkokai-yellow-d)
          (terminal-anti-darkokai-yellow-lc        terminal-anti-darkokai-yellow-l)
          (terminal-anti-darkokai-orange-hc        terminal-anti-darkokai-orange-d)
          (terminal-anti-darkokai-orange-lc        terminal-anti-darkokai-orange-l)
          (terminal-anti-darkokai-red-hc           terminal-anti-darkokai-red-d)
          (terminal-anti-darkokai-red-lc           terminal-anti-darkokai-red-l)
          (terminal-anti-darkokai-magenta-hc       terminal-anti-darkokai-magenta-d)
          (terminal-anti-darkokai-magenta-lc       terminal-anti-darkokai-magenta-l)
          (terminal-anti-darkokai-violet-hc        terminal-anti-darkokai-violet-d)
          (terminal-anti-darkokai-violet-lc        terminal-anti-darkokai-violet-l)
          (terminal-anti-darkokai-blue-hc          terminal-anti-darkokai-blue-d)
          (terminal-anti-darkokai-blue-lc          terminal-anti-darkokai-blue-l)
          (terminal-anti-darkokai-cyan-hc          terminal-anti-darkokai-cyan-d)
          (terminal-anti-darkokai-cyan-lc          terminal-anti-darkokai-cyan-l)
          (terminal-anti-darkokai-green-hc         terminal-anti-darkokai-green-d)
          (terminal-anti-darkokai-green-lc         terminal-anti-darkokai-green-l)
          ;; customize based face properties
          (terminal-s-variable-pitch         (if anti-darkokai-use-variable-pitch
                                                 'variable-pitch 'default))
          (terminal-s-fringe-bg              (if anti-darkokai-distinct-fringe-background
                                                 terminal-anti-darkokai-gray terminal-anti-darkokai-bg))
          (terminal-s-mode-line-fg           (if anti-darkokai-high-contrast-mode-line
                                                 terminal-anti-darkokai-bg terminal-anti-darkokai-fg))
          (terminal-s-mode-line-bg           (if anti-darkokai-high-contrast-mode-line
                                                 terminal-anti-darkokai-fg terminal-anti-darkokai-gray))
          (terminal-s-mode-line-buffer-id-fg (if anti-darkokai-high-contrast-mode-line
                                                 'unspecified terminal-anti-darkokai-green))
          (terminal-s-mode-line-inactive-fg  (if anti-darkokai-high-contrast-mode-line
                                                 terminal-anti-darkokai-fg terminal-anti-darkokai-comments))
          (terminal-s-mode-line-inactive-bg  (if anti-darkokai-high-contrast-mode-line
                                                 terminal-anti-darkokai-highlight-line terminal-anti-darkokai-bg))
          (terminal-s-mode-line-inactive-bc  (if anti-darkokai-high-contrast-mode-line
                                                 terminal-anti-darkokai-fg terminal-anti-darkokai-gray))
          )
     ,@body))

(anti-darkokai-with-color-vars
 ;; Define faces
 (custom-theme-set-faces
  'anti-darkokai ;; font lock for syntax highlighting
  `(font-lock-builtin-face
    ((,class (:foreground ,anti-darkokai-red
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight normal))))

  `(font-lock-comment-delimiter-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(font-lock-comment-face
    ((,class (:foreground ,anti-darkokai-comments
                          :background nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(font-lock-constant-face
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(font-lock-doc-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(font-lock-function-name-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(font-lock-keyword-face
    ((,class (:foreground ,anti-darkokai-red
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight normal))))

  `(font-lock-negation-char-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(font-lock-preprocessor-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(font-lock-regexp-grouping-construct
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight normal))))

  `(font-lock-regexp-grouping-backslash
    ((,class (:foreground ,anti-darkokai-violet
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :weight normal))))

  `(font-lock-string-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(font-lock-type-face
    ((,class (:foreground ,anti-darkokai-blue
                          :italic nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :italic nil))))

  `(font-lock-variable-name-face
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(font-lock-warning-face
    ((,class (:foreground ,anti-darkokai-orange
                          :weight bold
                          :italic t
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :weight bold
                                   :italic t
                                   :underline t))))

  `(c-annotation-face
    ((,class (:inherit font-lock-constant-face))
     (,terminal-class (:inherit font-lock-constant-face))))

  ;; general colouring
  '(button ((t (:underline t))))

  `(default
     ((,class (:foreground ,anti-darkokai-fg
                           :background ,anti-darkokai-bg))
      (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                    :background ,terminal-anti-darkokai-bg))))

  `(highlight
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-highlight))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-highlight))))

  `(lazy-highlight
    ((,class (:inherit highlight
                       :background ,anti-darkokai-comments))
     (,terminal-class (:inherit highlight
                                :background ,terminal-anti-darkokai-comments))))

  `(region
    ((,class (:inherit highlight
                       :background ,anti-darkokai-highlight))
     (,terminal-class (:inherit highlight
                                :background ,terminal-anti-darkokai-highlight))))

  `(secondary-selection
    ((,class (:inherit region
                       :background ,anti-darkokai-blue))
     (,terminal-class (:inherit region
                                :background ,terminal-anti-darkokai-blue))))

  `(shadow
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(match
    ((,class (:foreground ,anti-darkokai-cyan-l
                          :background ,anti-darkokai-cyan-d
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-cyan-l
                                   :foreground ,terminal-anti-darkokai-cyan-d
                                   :weight bold))))

  `(cursor
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-fg
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-fg
                                   :inverse-video t))))

  `(mouse
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-fg
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-fg
                                   :inverse-video t))))

  `(escape-glyph
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(escape-glyph-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(fringe
    ((,class (:foreground ,anti-darkokai-fg
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :background ,terminal-s-fringe-bg))))

  `(link
    ((,class (:foreground ,anti-darkokai-blue
                          :underline t
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :underline t
                                   :weight bold))))

  `(link-visited
    ((,class (:foreground ,anti-darkokai-violet
                          :underline t
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :underline t
                                   :weight normal))))

  `(success
    ((,class (:foreground ,anti-darkokai-green ))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green ))))

  `(warning
    ((,class (:foreground ,anti-darkokai-yellow ))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow ))))

  `(error
    ((,class (:foreground ,anti-darkokai-red-plain))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(eval-sexp-fu-flash
    ((,class (:foreground ,anti-darkokai-cyan-l
                          :background ,anti-darkokai-cyan-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan-l
                                   :background ,terminal-anti-darkokai-cyan-d))))

  `(eval-sexp-fu-flash-error
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-red))))

  `(trailing-whitespace
    ((,class (:background ,anti-darkokai-red))
     (,terminal-class (:background ,terminal-anti-darkokai-red))))

  `(vertical-border
    ((,class (:foreground ,anti-darkokai-gray))
     (,terminal-class (:foreground ,terminal-anti-darkokai-gray))))

  `(menu
    ((,class (:foreground ,anti-darkokai-fg
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :background ,terminal-anti-darkokai-bg))))

  `(minibuffer-prompt
    ((,class (:foreground ,anti-darkokai-violet-l))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  ;; menus and mode line
  `(mode-line
    ((,class (:inverse-video unspecified
                             :underline unspecified
                             :foreground ,s-mode-line-fg
                             :background ,s-mode-line-bg
                             :box (:line-width ,anti-darkokai-mode-line-padding
                                               :color ,s-mode-line-bg
                                               :style unspecified)))
     (,terminal-class (:inverse-video unspecified
                                      :underline unspecified
                                      :foreground ,terminal-s-mode-line-fg
                                      :background ,terminal-s-mode-line-bg))))

  `(mode-line-buffer-id
    ((,class (:foreground ,s-mode-line-buffer-id-fg
                          :weight bold))
     (,terminal-class (:foreground ,terminal-s-mode-line-buffer-id-fg
                                   :weight bold))))

  `(mode-line-inactive
    ((,class (:inverse-video unspecified
                             :underline unspecified
                             :foreground ,s-mode-line-inactive-fg
                             :background ,s-mode-line-inactive-bg
                             :box (:line-width ,anti-darkokai-mode-line-padding
                                               :color ,s-mode-line-inactive-bg
                                               :style unspecified)))
     (,terminal-class (:inverse-video unspecified
                                      :underline unspecified
                                      :foreground ,terminal-s-mode-line-inactive-fg
                                      :background ,terminal-s-mode-line-inactive-bg))))

  `(header-line
    ((,class (:inverse-video unspecified
                             :underline unspecified
                             :foreground ,anti-darkokai-emph
                             :background ,anti-darkokai-highlight-line
                             :box (:line-width 1
                                               :color ,anti-darkokai-gray
                                               :style unspecified)))
     (,terminal-class (:inverse-video unspecified
                                      :underline unspecified
                                      :foreground ,terminal-anti-darkokai-emph
                                      :background ,terminal-anti-darkokai-highlight-line
                                      :box (:line-width 1
                                                        :color ,terminal-anti-darkokai-gray
                                                        :style unspecified)))))

  ;; cua
  `(cua-global-mark
    ((,class (:background ,anti-darkokai-yellow
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(cua-rectangle
    ((,class (:inherit region))
     (,terminal-class (:inherit region))))

  `(cua-rectangle-noselect
    ((,class (:inherit secondary-selection))
     (,terminal-class (:inherit secondary-selection))))

  ;; diary
  `(diary
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  ;; dired
  `(dired-directory
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(dired-flagged
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(dired-header
    ((,class (:foreground ,anti-darkokai-blue
                          :background ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :background ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  `(dired-ignored
    ((,class (:inherit shadow))
     (,terminal-class (:inherit shadow))))

  `(dired-mark
    ((,class (:foreground ,anti-darkokai-green
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :weight bold))))

  `(dired-marked
    ((,class (:foreground ,anti-darkokai-violet
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :inherit bold))))

  `(dired-perm-write
    ((,class (:foreground ,anti-darkokai-fg
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :underline t))))

  `(dired-symlink
    ((,class (:foreground ,anti-darkokai-cyan
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :slant italic))))

  `(dired-warning
    ((,class (:foreground ,anti-darkokai-orange
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :underline t))))

  ;; dropdown
  `(dropdown-list-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-blue))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-blue))))

  `(dropdown-list-selection-face
    ((,class (:background ,anti-darkokai-green
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-green
                                   :foreground ,terminal-anti-darkokai-bg))))

  ;; ecb
  `(ecb-default-highlight-face
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(ecb-history-bucket-node-dir-soure-path-face
    ((,class (:inherit ecb-history-bucket-node-face
                       :foreground ,anti-darkokai-yellow))
     (,terminal-class (:inherit ecb-history-bucket-node-face
                                :foreground ,terminal-anti-darkokai-yellow))))

  `(ecb-source-in-directories-buffer-face
    ((,class (:inherit ecb-directories-general-face
                       :foreground ,anti-darkokai-fg))
     (,terminal-class (:inherit ecb-directories-general-face
                                :foreground ,terminal-anti-darkokai-fg))))

  `(ecb-history-dead-buffer-face
    ((,class (:inherit ecb-history-general-face
                       :foreground ,anti-darkokai-comments))
     (,terminal-class (:inherit ecb-history-general-face
                                :foreground ,terminal-anti-darkokai-comments))))

  `(ecb-directory-not-accessible-face
    ((,class (:inherit ecb-directories-general-face
                       :foreground ,anti-darkokai-comments))
     (,terminal-class (:inherit ecb-directories-general-face
                                :foreground ,terminal-anti-darkokai-comments))))

  `(ecb-bucket-node-face
    ((,class (:inherit ecb-default-general-face
                       :weight normal
                       :foreground ,anti-darkokai-blue))
     (,terminal-class (:inherit ecb-default-general-face
                                :weight normal
                                :foreground ,terminal-anti-darkokai-blue))))

  `(ecb-tag-header-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(ecb-analyse-bucket-element-face
    ((,class (:inherit ecb-analyse-general-face
                       :foreground ,anti-darkokai-green))
     (,terminal-class (:inherit ecb-analyse-general-face
                                :foreground ,terminal-anti-darkokai-green))))

  `(ecb-directories-general-face
    ((,class (:inherit ecb-default-general-face
                       :height 1.0))
     (,terminal-class (:inherit ecb-default-general-face
                                :height 1.0))))

  `(ecb-method-non-semantic-face
    ((,class (:inherit ecb-methods-general-face
                       :foreground ,anti-darkokai-cyan))
     (,terminal-class (:inherit ecb-methods-general-face
                                :foreground ,terminal-anti-darkokai-cyan))))

  `(ecb-mode-line-prefix-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(ecb-tree-guide-line-face
    ((,class (:inherit ecb-default-general-face
                       :foreground ,anti-darkokai-gray
                       :height 1.0))
     (,terminal-class (:inherit ecb-default-general-face
                                :foreground ,terminal-anti-darkokai-gray
                                :height 1.0))))

  ;; ee
  `(ee-bookmarked
    ((,class (:foreground ,anti-darkokai-emph))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph))))

  `(ee-category
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(ee-link
    ((,class (:inherit link))
     (,terminal-class (:inherit link))))

  `(ee-link-visited
    ((,class (:inherit link-visited))
     (,terminal-class (:inherit link-visited))))

  `(ee-marked
    ((,class (:foreground ,anti-darkokai-magenta
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta
                                   :weight bold))))

  `(ee-omitted
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(ee-shadow
    ((,class (:inherit shadow))
     (,terminal-class (:inherit shadow))))

  ;; elixir
  `(elixir-atom-face
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(elixir-attribute-face
    ((,class (:foreground ,anti-darkokai-violet-l))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet-l))))

  ;; grep
  `(grep-context-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(grep-error-face
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold
                                   :underline t))))

  `(grep-hit-face
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(grep-match-face
    ((,class (:foreground ,anti-darkokai-green
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :weight bold))))

  ;; isearch
  `(isearch
    ((,class (:foreground ,anti-darkokai-cyan-l
                          :background ,anti-darkokai-cyan-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan-l
                                   :background ,terminal-anti-darkokai-cyan-d))))

  `(isearch-fail
    ((,class (:inherit isearch
                       :foreground ,anti-darkokai-red
                       :background ,anti-darkokai-bg
                       :bold t))
     (,terminal-class (:inherit isearch
                                :foreground ,terminal-anti-darkokai-red
                                :background ,terminal-anti-darkokai-bg
                                :bold t))))


  ;; ace-jump-mode
  `(ace-jump-face-background
    ((,class (:foreground ,anti-darkokai-comments
                          :background ,anti-darkokai-bg
                          :inverse-video nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :background ,terminal-anti-darkokai-bg
                                   :inverse-video nil))))

  `(ace-jump-face-foreground
    ((,class (:foreground ,anti-darkokai-yellow
                          :background ,anti-darkokai-bg
                          :inverse-video nil
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :background ,terminal-anti-darkokai-bg
                                   :inverse-video nil
                                   :weight bold))))

  ;; alchemist
  `(alchemist-test--failed-face
    ((,class (:foreground ,anti-darkokai-red-hc
                          :background ,anti-darkokai-red-lc
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red-hc
                                   :background ,terminal-anti-darkokai-red-lc
                                   :weight bold))))

  `(alchemist-test--success-face
    ((,class (:foreground ,anti-darkokai-fg
                          :background ,anti-darkokai-green-plain
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :background ,terminal-anti-darkokai-green-l
                                   :weight bold))))


  ;; auctex
  `(font-latex-bold-face
    ((,class (:inherit bold
                       :foreground ,anti-darkokai-emph))
     (,terminal-class (:inherit bold
                                :foreground ,terminal-anti-darkokai-emph))))

  `(font-latex-doctex-documentation-face
    ((,class (:background unspecified))
     (,terminal-class (:background unspecified))))

  `(font-latex-doctex-preprocessor-face
    ((,class
      (:inherit (font-latex-doctex-documentation-face
                 font-lock-builtin-face
                 font-lock-preprocessor-face)))
     (,class
      (:inherit (font-latex-doctex-documentation-face
                 font-lock-builtin-face
                 font-lock-preprocessor-face)))))

  `(font-latex-italic-face
    ((,class (:inherit italic :foreground ,anti-darkokai-emph))
     (,terminal-class (:inherit italic :foreground ,terminal-anti-darkokai-emph))))

  `(font-latex-math-face
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(font-latex-sectioning-0-face
    ((,class (:inherit font-latex-sectioning-1-face
                       :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:inherit font-latex-sectioning-1-face
                                :height ,anti-darkokai-height-plus-1))))

  `(font-latex-sectioning-1-face
    ((,class (:inherit font-latex-sectioning-2-face
                       :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:inherit font-latex-sectioning-2-face
                                :height ,anti-darkokai-height-plus-1))))

  `(font-latex-sectioning-2-face
    ((,class (:inherit font-latex-sectioning-3-face
                       :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:inherit font-latex-sectioning-3-face
                                :height ,anti-darkokai-height-plus-1))))

  `(font-latex-sectioning-3-face
    ((,class (:inherit font-latex-sectioning-4-face
                       :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:inherit font-latex-sectioning-4-face
                                :height ,anti-darkokai-height-plus-1))))

  `(font-latex-sectioning-4-face
    ((,class (:inherit font-latex-sectioning-5-face
                       :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:inherit font-latex-sectioning-5-face
                                :height ,anti-darkokai-height-plus-1))))

  `(font-latex-sectioning-5-face
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-yellow
                       :weight bold))
     (,terminal-class (:inherit ,terminal-s-variable-pitch :
                                foreground ,terminal-anti-darkokai-yellow
                                :weight bold))))

  `(font-latex-sedate-face
    ((,class (:foreground ,anti-darkokai-emph))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph))))

  `(font-latex-slide-title-face
    ((,class (:inherit (,s-variable-pitch font-lock-type-face)
                       :weight bold
                       :height ,anti-darkokai-height-plus-3))
     (,terminal-class (:inherit (,terminal-s-variable-pitch font-lock-type-face)
                                :weight bold
                                :height ,anti-darkokai-height-plus-3))))

  `(font-latex-string-face
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(font-latex-subscript-face
    ((,class (:height ,anti-darkokai-height-minus-1))
     (,terminal-class (:height ,anti-darkokai-height-minus-1))))

  `(font-latex-superscript-face
    ((,class (:height ,anti-darkokai-height-minus-1))
     (,terminal-class (:height ,anti-darkokai-height-minus-1))))

  `(font-latex-verbatim-face
    ((,class (:inherit fixed-pitch
                       :foreground ,anti-darkokai-fg
                       :slant italic))
     (,terminal-class (:inherit fixed-pitch
                                :foreground ,terminal-anti-darkokai-fg
                                :slant italic))))

  `(font-latex-warning-face
    ((,class (:inherit bold
                       :foreground ,anti-darkokai-orange))
     (,terminal-class (:inherit bold
                                :foreground ,terminal-anti-darkokai-orange))))

  ;; auto-complete
  `(ac-candidate-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-blue))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-blue))))

  `(ac-selection-face
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(ac-candidate-mouse-face
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(ac-completion-face
    ((,class (:foreground ,anti-darkokai-emph
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :underline t))))

  `(ac-gtags-candidate-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-blue))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-blue))))

  `(ac-gtags-selection-face
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(ac-yasnippet-candidate-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-yellow))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-yellow))))

  `(ac-yasnippet-selection-face
    ((,class (:background ,anti-darkokai-yellow
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow
                                   :foreground ,terminal-anti-darkokai-bg))))

  ;; auto highlight symbol
  `(ahs-definition-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-blue))))

  `(ahs-edit-mode-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-highlight))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-highlight))))

  `(ahs-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta
                                   :background unspecified))))

  `(ahs-plugin-bod-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-violet ))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-cyan ))))

  `(ahs-plugin-defalt-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-orange))))

  `(ahs-plugin-whole-buffer-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-green))))

  `(ahs-warning-face
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold))))

  ;; android mode
  `(android-mode-debug-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(android-mode-error-face
    ((,class (:foreground ,anti-darkokai-orange
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :weight bold))))

  `(android-mode-info-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(android-mode-verbose-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(android-mode-warning-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  ;; anzu-mode
  `(anzu-mode-line
    ((,class (:foreground ,anti-darkokai-violet
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :weight bold))))

  `(anzu-replace-to
    ((,class (:foreground ,anti-darkokai-magenta-l
                          :background ,anti-darkokai-violet-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta-l
                                   :background ,terminal-anti-darkokai-violet-d))))

  ;; bm
  `(bm-face
    ((,class (:background ,anti-darkokai-yellow-lc
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow-lc
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(bm-fringe-face
    ((,class (:background ,anti-darkokai-yellow-lc
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow-lc
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(bm-fringe-persistent-face
    ((,class (:background ,anti-darkokai-green-lc
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-green-lc
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(bm-persistent-face
    ((,class (:background ,anti-darkokai-green-lc
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-green-lc
                                   :foreground ,terminal-anti-darkokai-bg))))

  ;; calfw
  `(cfw:face-day-title
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(cfw:face-annotation
    ((,class (:inherit cfw:face-day-title
                       :foreground ,anti-darkokai-yellow))
     (,terminal-class (:inherit cfw:face-day-title
                                :foreground ,terminal-anti-darkokai-yellow))))

  `(cfw:face-default-content
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(cfw:face-default-day
    ((,class (:inherit cfw:face-day-title
                       :weight bold))
     (,terminal-class (:inherit cfw:face-day-title
                                :weight bold))))

  `(cfw:face-disable
    ((,class (:inherit cfw:face-day-title
                       :foreground ,anti-darkokai-comments))
     (,terminal-class (:inherit cfw:face-day-title
                                :foreground ,terminal-anti-darkokai-comments))))

  `(cfw:face-grid
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(cfw:face-header
    ((,class (:foreground ,anti-darkokai-blue-hc
                          :background ,anti-darkokai-blue-lc
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue-hc
                                   :background ,terminal-anti-darkokai-blue-lc
                                   :weight bold))))

  `(cfw:face-holiday
    ((,class (:background nil
                          :foreground ,anti-darkokai-red
                          :weight bold))
     (,terminal-class (:background nil
                                   :foreground ,terminal-anti-darkokai-red
                                   :weight bold))))

  `(cfw:face-periods
    ((,class (:foreground ,anti-darkokai-magenta))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta))))

  `(cfw:face-select
    ((,class (:background ,anti-darkokai-magenta-lc
                          :foreground ,anti-darkokai-magenta-hc))
     (,terminal-class (:background ,terminal-anti-darkokai-magenta-lc
                                   :foreground ,terminal-anti-darkokai-magenta-hc))))

  `(cfw:face-saturday
    ((,class (:foreground ,anti-darkokai-cyan-hc
                          :background ,anti-darkokai-cyan-lc))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan-hc
                                   :background ,terminal-anti-darkokai-cyan-lc))))

  `(cfw:face-sunday
    ((,class (:foreground ,anti-darkokai-red-hc
                          :background ,anti-darkokai-red-lc
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red-hc
                                   :background ,terminal-anti-darkokai-red-lc
                                   :weight bold))))

  `(cfw:face-title
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-yellow
                       :weight bold
                       :height ,anti-darkokai-height-plus-4))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-yellow
                                :weight bold
                                :height ,anti-darkokai-height-plus-4))))

  `(cfw:face-today
    ((,class (:weight bold
                      :background ,anti-darkokai-highlight-line
                      :foreground nil))
     (,terminal-class (:weight bold
                               :background ,terminal-anti-darkokai-highlight-line
                               :foreground nil))))

  `(cfw:face-today-title
    ((,class (:background ,anti-darkokai-yellow-lc
                          :foreground ,anti-darkokai-yellow-hc
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow-lc
                                   :foreground ,terminal-anti-darkokai-yellow-hc
                                   :weight bold))))

  `(cfw:face-toolbar
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(cfw:face-toolbar-button-off
    ((,class (:background ,anti-darkokai-yellow-lc
                          :foreground ,anti-darkokai-yellow-hc
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow-lc
                                   :foreground ,terminal-anti-darkokai-yellow-hc
                                   :weight bold))))

  `(cfw:face-toolbar-button-on
    ((,class (:background ,anti-darkokai-yellow-hc
                          :foreground ,anti-darkokai-yellow-lc
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow-hc
                                   :foreground ,terminal-anti-darkokai-yellow-lc
                                   :weight bold))))

  ;; cider
  `(cider-enlightened
    ((,class (:foreground ,anti-darkokai-yellow
                          :background nil
                          :box (:color ,anti-darkokai-yellow :line-width -1 :style nil)))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :background nil
                                   :box (:color ,terminal-anti-darkokai-yellow :line-width -1 :style nil))) ))

  `(cider-enlightened-local
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(cider-instrumented-face
    ((,class (:foreground ,anti-darkokai-violet
                          :background nil
                          :box (:color ,anti-darkokai-violet :line-width -1 :style nil)))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :background nil
                                   :box (:color ,terminal-anti-darkokai-violet :line-width -1 :style nil)))))

  `(cider-result-overlay-face
    ((,class (:foreground ,anti-darkokai-blue
                          :background nil
                          :box (:color ,anti-darkokai-blue :line-width -1 :style nil)))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :background nil
                                   :box (:color ,terminal-anti-darkokai-blue :line-width -1 :style nil)))))

  `(cider-test-error-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-orange))))

  `(cider-test-failure-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-red))))

  `(cider-test-success-face
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-green))))

  `(cider-traced-face
    ((,class :box (:color ,anti-darkokai-blue :line-width -1 :style nil))
     (,terminal-class :box (:color ,terminal-anti-darkokai-blue :line-width -1 :style nil))))

  ;; clojure-test
  `(clojure-test-failure-face
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold
                                   :underline t))))

  `(clojure-test-error-face
    ((,class (:foreground ,anti-darkokai-orange
                          :weight bold
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold
                                   :underline t))))

  `(clojure-test-success-face
    ((,class (:foreground ,anti-darkokai-green
                          :weight bold
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :weight bold
                                   :underline t))))

  ;; company-mode
  `(company-tooltip
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-emph))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-emph))))

  `(company-tooltip-selection
    ((,class (:background ,anti-darkokai-cyan-d
                          :foreground ,anti-darkokai-cyan-l))
     (,terminal-class (:background ,terminal-anti-darkokai-cyan-d
                                   :foreground ,terminal-anti-darkokai-cyan-l))))

  `(company-tooltip-mouse
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(company-tooltip-common
    ((,class (:foreground ,anti-darkokai-violet
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :underline t))))

  `(company-tooltip-common-selection
    ((,class (:foreground ,anti-darkokai-fg
                          :background ,anti-darkokai-cyan-d
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :background ,terminal-anti-darkokai-cyan-d
                                   :underline t))))

  `(company-preview
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-emph))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-emph))))

  `(company-preview-common
    ((,class (:foreground ,anti-darkokai-blue
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :underline t))))

  `(company-scrollbar-bg
    ((,class (:background ,anti-darkokai-gray))
     (,terminal-class (:background ,terminal-anti-darkokai-gray))))

  `(company-scrollbar-fg
    ((,class (:background ,anti-darkokai-comments))
     (,terminal-class (:background ,terminal-anti-darkokai-comments))))

  `(company-tooltip-annotation
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(company-template-field
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-blue))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-blue))))

  ;; compilation
  `(compilation-column-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :underline nil))))

  `(compilation-column-number
    ((,class (:inherit font-lock-doc-face
                       :foreground ,anti-darkokai-cyan
                       :underline nil))
     (,terminal-class (:inherit font-lock-doc-face
                                :foreground ,terminal-anti-darkokai-cyan
                                :underline nil))))

  `(compilation-enter-directory-face
    ((,class (:foreground ,anti-darkokai-green
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :underline nil))))

  `(compilation-error
    ((,class (:inherit error
                       :underline nil))
     (,terminal-class (:inherit error
                                :underline nil))))

  `(compilation-error-face
    ((,class (:foreground ,anti-darkokai-red
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :underline nil))))

  `(compilation-face
    ((,class (:foreground ,anti-darkokai-fg
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :underline nil))))

  `(compilation-info
    ((,class (:foreground ,anti-darkokai-comments
                          :underline nil
                          :bold nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :underline nil
                                   :bold nil))))

  `(compilation-info-face
    ((,class (:foreground ,anti-darkokai-blue
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :underline nil))))

  `(compilation-leave-directory-face
    ((,class (:foreground ,anti-darkokai-green
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :underline nil))))

  `(compilation-line-face
    ((,class (:foreground ,anti-darkokai-green
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :underline nil))))

  `(compilation-line-number
    ((,class (:foreground ,anti-darkokai-green
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :underline nil))))

  `(compilation-warning
    ((,class (:inherit warning
                       :underline nil))
     (,terminal-class (:inherit warning
                                :underline nil))))

  `(compilation-warning-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight normal
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight normal
                                   :underline nil))))

  `(compilation-mode-line-exit
    ((,class (:inherit compilation-info
                       :foreground ,anti-darkokai-green
                       :weight bold))
     (,terminal-class (:inherit compilation-info
                                :foreground ,terminal-anti-darkokai-green
                                :weight bold))))

  `(compilation-mode-line-fail
    ((,class (:inherit compilation-error
                       :foreground ,anti-darkokai-red
                       :weight bold))
     (,terminal-class (:inherit compilation-error
                                :foreground ,terminal-anti-darkokai-red
                                :weight bold))))

  `(compilation-mode-line-run
    ((,class (:foreground ,anti-darkokai-orange
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :weight bold))))

  ;; CSCOPE
  `(cscope-file-face
    ((,class (:foreground ,anti-darkokai-green
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :weight bold))))

  `(cscope-function-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(cscope-line-number-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(cscope-line-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(cscope-mouse-face
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-fg))))

  ;; ctable
  `(ctbl:face-cell-select
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-emph
                          :underline ,anti-darkokai-emph
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-emph
                                   :underline ,terminal-anti-darkokai-emph
                                   :weight bold))))

  `(ctbl:face-continue-bar
    ((,class (:background ,anti-darkokai-gray
                          :foreground ,anti-darkokai-yellow))
     (,terminal-class (:background ,terminal-anti-darkokai-gray
                                   :foreground ,terminal-anti-darkokai-yellow))))

  `(ctbl:face-row-select
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-fg
                          :underline t))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-fg
                                   :underline t))))

  ;; coffee
  `(coffee-mode-class-name
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(coffee-mode-function-param
    ((,class (:foreground ,anti-darkokai-violet
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :slant italic))))

  ;; custom
  `(custom-face-tag
    ((,class (:inherit ,s-variable-pitch
                       :height ,anti-darkokai-height-plus-3
                       :foreground ,anti-darkokai-violet
                       :weight bold))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :height ,anti-darkokai-height-plus-3
                                :foreground ,terminal-anti-darkokai-violet
                                :weight bold))))

  `(custom-variable-tag
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-cyan
                       :height ,anti-darkokai-height-plus-3))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-cyan
                                :height ,anti-darkokai-height-plus-3))))

  `(custom-comment-tag
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(custom-group-tag
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-blue
                       :height ,anti-darkokai-height-plus-3))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-blue
                                :height ,anti-darkokai-height-plus-3))))

  `(custom-group-tag-1
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-red
                       :height ,anti-darkokai-height-plus-3))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-red
                                :height ,anti-darkokai-height-plus-3))))

  `(custom-state
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  ;; diff
  `(diff-added
    ((,class (:foreground ,anti-darkokai-green-plain
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :background ,terminal-anti-darkokai-bg))))

  `(diff-changed
    ((,class (:foreground ,anti-darkokai-blue
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :background ,terminal-anti-darkokai-bg))))

  `(diff-removed
    ((,class (:foreground ,anti-darkokai-red-plain
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-bg))))

  `(diff-header
    ((,class (:background ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-bg))))

  `(diff-file-header
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-fg
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-fg
                                   :weight bold))))

  `(diff-refine-added
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-green-plain))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-green))))

  `(diff-refine-change
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-blue))))

  `(diff-refine-removed
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-red-plain))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-red))))

  ;; diff-hl
  `(diff-hl-change
    ((,class (:background ,anti-darkokai-blue-lc
                          :foreground ,anti-darkokai-blue-hc))
     (,terminal-class (:background ,terminal-anti-darkokai-blue-lc
                                   :foreground ,terminal-anti-darkokai-blue-hc))))

  `(diff-hl-delete
    ((,class (:background ,anti-darkokai-red-lc
                          :foreground ,anti-darkokai-red-hc))
     (,terminal-class (:background ,terminal-anti-darkokai-red-lc
                                   :foreground ,terminal-anti-darkokai-red-hc))))

  `(diff-hl-insert
    ((,class (:background ,anti-darkokai-green-lc
                          :foreground ,anti-darkokai-green-hc))
     (,terminal-class (:background ,terminal-anti-darkokai-green-lc
                                   :foreground ,terminal-anti-darkokai-green-hc))))

  `(diff-hl-unknown
    ((,class (:background ,anti-darkokai-violet-lc
                          :foreground ,anti-darkokai-violet-hc))
     (,terminal-class (:background ,terminal-anti-darkokai-violet-lc
                                   :foreground ,terminal-anti-darkokai-violet-hc))))

  ;; ediff
  `(ediff-fine-diff-A
    ((,class (:background ,anti-darkokai-orange-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-orange-lc))))

  `(ediff-fine-diff-B
    ((,class (:background ,anti-darkokai-green-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-green-lc))))

  `(ediff-fine-diff-C
    ((,class (:background ,anti-darkokai-yellow-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow-lc))))

  `(ediff-current-diff-C
    ((,class (:background ,anti-darkokai-blue-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-blue-lc))))

  `(ediff-even-diff-A
    ((,class (:background ,anti-darkokai-comments
                          :foreground ,anti-darkokai-fg-lc ))
     (,terminal-class (:background ,terminal-anti-darkokai-comments
                                   :foreground ,terminal-anti-darkokai-fg-lc ))))

  `(ediff-odd-diff-A
    ((,class (:background ,anti-darkokai-comments
                          :foreground ,anti-darkokai-fg-hc ))
     (,terminal-class (:background ,terminal-anti-darkokai-comments
                                   :foreground ,terminal-anti-darkokai-fg-hc ))))

  `(ediff-even-diff-B
    ((,class (:background ,anti-darkokai-comments
                          :foreground ,anti-darkokai-fg-hc ))
     (,terminal-class (:background ,terminal-anti-darkokai-comments
                                   :foreground ,terminal-anti-darkokai-fg-hc ))))

  `(ediff-odd-diff-B
    ((,class (:background ,anti-darkokai-comments
                          :foreground ,anti-darkokai-fg-lc ))
     (,terminal-class (:background ,terminal-anti-darkokai-comments
                                   :foreground ,terminal-anti-darkokai-fg-lc ))))

  `(ediff-even-diff-C
    ((,class (:background ,anti-darkokai-comments
                          :foreground ,anti-darkokai-fg ))
     (,terminal-class (:background ,terminal-anti-darkokai-comments
                                   :foreground ,terminal-anti-darkokai-fg ))))

  `(ediff-odd-diff-C
    ((,class (:background ,anti-darkokai-comments
                          :foreground ,anti-darkokai-bg ))
     (,terminal-class (:background ,terminal-anti-darkokai-comments
                                   :foreground ,terminal-anti-darkokai-bg ))))

  ;; edts
  `(edts-face-error-line
    ((,(append '((supports :underline (:style line))) class)
      (:underline (:style line :color ,anti-darkokai-red)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-red-hc
                          :background ,anti-darkokai-red-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style line))) terminal-class)
      (:underline (:style line :color ,terminal-anti-darkokai-red)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red-hc
                                   :background ,terminal-anti-darkokai-red-lc
                                   :weight bold
                                   :underline t))))

  `(edts-face-warning-line
    ((,(append '((supports :underline (:style line))) class)
      (:underline (:style line :color ,anti-darkokai-yellow)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-yellow-hc
                          :background ,anti-darkokai-yellow-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style line))) terminal-class)
      (:underline (:style line :color ,terminal-anti-darkokai-yellow)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow-hc
                                   :background ,terminal-anti-darkokai-yellow-lc
                                   :weight bold
                                   :underline t))))

  `(edts-face-error-fringe-bitmap
    ((,class (:foreground ,anti-darkokai-red
                          :background unspecified
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background unspecified
                                   :weight bold))))

  `(edts-face-warning-fringe-bitmap
    ((,class (:foreground ,anti-darkokai-yellow
                          :background unspecified
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :background unspecified
                                   :weight bold))))

  `(edts-face-error-mode-line
    ((,class (:background ,anti-darkokai-red
                          :foreground unspecified))
     (,terminal-class (:background ,terminal-anti-darkokai-red
                                   :foreground unspecified))))

  `(edts-face-warning-mode-line
    ((,class (:background ,anti-darkokai-yellow
                          :foreground unspecified))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow
                                   :foreground unspecified))))


  ;; elfeed
  `(elfeed-search-date-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(elfeed-search-feed-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(elfeed-search-tag-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(elfeed-search-title-face
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  ;; ein
  `(ein:cell-input-area
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))
  `(ein:cell-input-prompt
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))
  `(ein:cell-output-prompt
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))
  `(ein:notification-tab-normal
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))
  `(ein:notification-tab-selected
    ((,class (:foreground ,anti-darkokai-orange :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange :inherit bold))))

  ;; enhanced ruby mode
  `(enh-ruby-string-delimiter-face
    ((,class (:inherit font-lock-string-face))
     (,terminal-class (:inherit font-lock-string-face))))

  `(enh-ruby-heredoc-delimiter-face
    ((,class (:inherit font-lock-string-face))
     (,terminal-class (:inherit font-lock-string-face))))

  `(enh-ruby-regexp-delimiter-face
    ((,class (:inherit font-lock-string-face))
     (,terminal-class (:inherit font-lock-string-face))))

  `(enh-ruby-op-face
    ((,class (:inherit font-lock-keyword-face))
     (,terminal-class (:inherit font-lock-keyword-face))))

  ;; erm-syn
  `(erm-syn-errline
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-red)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-red-hc
                          :background ,anti-darkokai-red-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-red)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red-hc
                                   :background ,terminal-anti-darkokai-red-lc
                                   :weight bold
                                   :underline t))))

  `(erm-syn-warnline
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-orange)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-orange-hc
                          :background ,anti-darkokai-orange-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-orange)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange-hc
                                   :background ,terminal-anti-darkokai-orange-lc
                                   :weight bold
                                   :underline t))))

  ;; epc
  `(epc:face-title
    ((,class (:foreground ,anti-darkokai-blue
                          :background ,anti-darkokai-bg
                          :weight normal
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :background ,terminal-anti-darkokai-bg
                                   :weight normal
                                   :underline nil))))

  ;; erc
  `(erc-action-face
    ((,class (:inherit erc-default-face))
     (,terminal-class (:inherit erc-default-face))))

  `(erc-bold-face
    ((,class (:weight bold))
     (,terminal-class (:weight bold))))

  `(erc-current-nick-face
    ((,class (:foreground ,anti-darkokai-blue :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :weight bold))))

  `(erc-dangerous-host-face
    ((,class (:inherit font-lock-warning-face))
     (,terminal-class (:inherit font-lock-warning-face))))

  `(erc-default-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(erc-highlight-face
    ((,class (:inherit erc-default-face
                       :background ,anti-darkokai-highlight))
     (,terminal-class (:inherit erc-default-face
                                :background ,terminal-anti-darkokai-highlight))))

  `(erc-direct-msg-face
    ((,class (:inherit erc-default-face))
     (,terminal-class (:inherit erc-default-face))))

  `(erc-error-face
    ((,class (:inherit font-lock-warning-face))
     (,terminal-class (:inherit font-lock-warning-face))))

  `(erc-fool-face
    ((,class (:inherit erc-default-face))
     (,terminal-class (:inherit erc-default-face))))

  `(erc-input-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(erc-keyword-face
    ((,class (:foreground ,anti-darkokai-blue
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :weight bold))))

  `(erc-nick-default-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(erc-my-nick-face
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold))))

  `(erc-nick-msg-face
    ((,class (:inherit erc-default-face))
     (,terminal-class (:inherit erc-default-face))))

  `(erc-notice-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(erc-pal-face
    ((,class (:foreground ,anti-darkokai-orange
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :weight bold))))

  `(erc-prompt-face
    ((,class (:foreground ,anti-darkokai-orange
                          :background ,anti-darkokai-bg
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :background ,terminal-anti-darkokai-bg
                                   :weight bold))))

  `(erc-timestamp-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(erc-underline-face
    ((t (:underline t))))

  ;; eshell
  `(eshell-prompt
    ((,class (:foreground ,anti-darkokai-blue
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :inherit bold))))

  `(eshell-ls-archive
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :inherit bold))))

  `(eshell-ls-backup
    ((,class (:inherit font-lock-comment-face))
     (,terminal-class (:inherit font-lock-comment-face))))

  `(eshell-ls-clutter
    ((,class (:inherit font-lock-comment-face))
     (,terminal-class (:inherit font-lock-comment-face))))

  `(eshell-ls-directory
    ((,class (:foreground ,anti-darkokai-blue
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :inherit bold))))

  `(eshell-ls-executable
    ((,class (:foreground ,anti-darkokai-green
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :inherit bold))))

  `(eshell-ls-unreadable
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(eshell-ls-missing
    ((,class (:inherit font-lock-warning-face))
     (,terminal-class (:inherit font-lock-warning-face))))

  `(eshell-ls-product
    ((,class (:inherit font-lock-doc-face))
     (,terminal-class (:inherit font-lock-doc-face))))

  `(eshell-ls-special
    ((,class (:foreground ,anti-darkokai-yellow
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :inherit bold))))

  `(eshell-ls-symlink
    ((,class (:foreground ,anti-darkokai-cyan
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :inherit bold))))

  ;; evil-ex-substitute
  `(evil-ex-substitute-matches
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-red-l
                          :inherit italic))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-red-l
                                   :inherit italic))))
  `(evil-ex-substitute-replacement
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-green-l
                          :inherit italic))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line :foreground ,terminal-anti-darkokai-green-l :inherit italic))))

  ;; evil-search-highlight-persist
  `(evil-search-highlight-persist-highlight-face
    ((,class (:inherit region))
     (,terminal-class (:inherit region))))

  ;; fic
  `(fic-author-face
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-orange
                          :underline t
                          :slant italic))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-orange
                                   :underline t
                                   :slant italic))))

  `(fic-face
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-orange
                          :weight normal
                          :slant italic))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-orange
                                   :weight normal
                                   :slant italic))))

  `(font-lock-fic-face
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-orange
                          :weight normal
                          :slant italic))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-orange
                                   :weight normal
                                   :slant italic))))

  ;; flx
  `(flx-highlight-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :weight normal
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :weight normal
                                   :underline t))))

  ;; flymake
  `(flymake-errline
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-red)
                  :inherit unspecified
                  :foreground unspecified
                  :background unspecified))
     (,class (:foreground ,anti-darkokai-red-hc
                          :background ,anti-darkokai-red-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-red)
                  :inherit unspecified
                  :foreground unspecified
                  :background unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red-hc
                                   :background ,terminal-anti-darkokai-red-lc
                                   :weight bold
                                   :underline t))))

  `(flymake-infoline
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-green)
                  :inherit unspecified
                  :foreground unspecified
                  :background unspecified))
     (,class (:foreground ,anti-darkokai-green-hc
                          :background ,anti-darkokai-green-lc))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-green)
                  :inherit unspecified
                  :foreground unspecified
                  :background unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green-hc
                                   :background ,terminal-anti-darkokai-green-lc))))

  `(flymake-warnline
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-yellow)
                  :inherit unspecified
                  :foreground unspecified
                  :background unspecified))
     (,class (:foreground ,anti-darkokai-yellow-hc
                          :background ,anti-darkokai-yellow-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-yellow)
                  :inherit unspecified
                  :foreground unspecified
                  :background unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow-hc
                                   :background ,terminal-anti-darkokai-yellow-lc
                                   :weight bold
                                   :underline t))))

  ;; flycheck
  `(flycheck-error
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-red)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-red-hc
                          :background ,anti-darkokai-red-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-red)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red-hc
                                   :background ,terminal-anti-darkokai-red-lc
                                   :weight bold
                                   :underline t))))

  `(flycheck-warning
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-yellow)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-yellow-hc
                          :background ,anti-darkokai-yellow-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-yellow)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow-hc
                                   :background ,terminal-anti-darkokai-yellow-lc
                                   :weight bold
                                   :underline t))))

  `(flycheck-info
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-blue)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-blue-hc
                          :background ,anti-darkokai-blue-lc
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-blue)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue-hc
                                   :background ,terminal-anti-darkokai-blue-lc
                                   :weight bold
                                   :underline t))))

  `(flycheck-fringe-error
    ((,class (:foreground ,anti-darkokai-red-hc
                          :background ,anti-darkokai-red-lc
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red-hc
                                   :background ,terminal-anti-darkokai-red-lc
                                   :weight bold))))

  `(flycheck-fringe-warning
    ((,class (:foreground ,anti-darkokai-yellow-hc
                          :background ,anti-darkokai-yellow-lc
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow-hc
                                   :background ,terminal-anti-darkokai-yellow-lc
                                   :weight bold))))

  `(flycheck-fringe-info
    ((,class (:foreground ,anti-darkokai-blue-hc
                          :background ,anti-darkokai-blue-lc
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue-hc
                                   :background ,terminal-anti-darkokai-blue-lc
                                   :weight bold))))

  ;; flyspell
  `(flyspell-duplicate
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-yellow)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-yellow
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-yellow)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold
                                   :underline t))))

  `(flyspell-incorrect
    ((,(append '((supports :underline (:style wave))) class)
      (:underline (:style wave :color ,anti-darkokai-red)
                  :inherit unspecified))
     (,class (:foreground ,anti-darkokai-red
                          :weight bold
                          :underline t))
     (,(append '((supports :underline (:style wave))) terminal-class)
      (:underline (:style wave :color ,terminal-anti-darkokai-red)
                  :inherit unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold
                                   :underline t))))


  ;; git-gutter
  `(git-gutter:added
    ((,class (:background ,anti-darkokai-green
                          :foreground ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:background ,terminal-anti-darkokai-green
                                   :foreground ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  `(git-gutter:deleted
    ((,class (:background ,anti-darkokai-red
                          :foreground ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:background ,terminal-anti-darkokai-red
                                   :foreground ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  `(git-gutter:modified
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  `(git-gutter:unchanged
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  ;; git-gutter-fr
  `(git-gutter-fr:added
    ((,class (:foreground ,anti-darkokai-green
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :inherit bold))))

  `(git-gutter-fr:deleted
    ((,class (:foreground ,anti-darkokai-red
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :inherit bold))))

  `(git-gutter-fr:modified
    ((,class (:foreground ,anti-darkokai-blue
                          :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :inherit bold))))

  ;; git-gutter+ and git-gutter+-fr
  `(git-gutter+-added
    ((,class (:background ,anti-darkokai-green
                          :foreground ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:background ,terminal-anti-darkokai-green
                                   :foreground ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  `(git-gutter+-deleted
    ((,class (:background ,anti-darkokai-red
                          :foreground ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:background ,terminal-anti-darkokai-red
                                   :foreground ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  `(git-gutter+-modified
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  `(git-gutter+-unchanged
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-bg
                          :inherit bold))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-bg
                                   :inherit bold))))

  `(git-gutter-fr+-added
    ((,class (:foreground ,anti-darkokai-green
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :weight bold))))

  `(git-gutter-fr+-deleted
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold))))

  `(git-gutter-fr+-modified
    ((,class (:foreground ,anti-darkokai-blue
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :weight bold))))

  ;; git-timemachine
  `(git-timemachine-minibuffer-detail-face
    ((,class (:foreground ,anti-darkokai-blue
                          :background ,anti-darkokai-highlight-line
                          :inherit bold))
     (,terminal-class (:foreground ,anti-darkokai-blue
                                   :background ,terminal-anti-darkokai-highlight-line
                                   :inherit bold))))

  ;; guide-key
  `(guide-key/highlight-command-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(guide-key/key-face
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(guide-key/prefix-command-face
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  ;; gnus
  `(gnus-group-mail-1
    ((,class (:weight bold
                      :inherit gnus-group-mail-1-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-mail-1-empty))))

  `(gnus-group-mail-1-empty
    ((,class (:inherit gnus-group-news-1-empty))
     (,terminal-class (:inherit gnus-group-news-1-empty))))

  `(gnus-group-mail-2
    ((,class (:weight bold
                      :inherit gnus-group-mail-2-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-mail-2-empty))))

  `(gnus-group-mail-2-empty
    ((,class (:inherit gnus-group-news-2-empty))
     (,terminal-class (:inherit gnus-group-news-2-empty))))

  `(gnus-group-mail-3
    ((,class (:weight bold
                      :inherit gnus-group-mail-3-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-mail-3-empty))))

  `(gnus-group-mail-3-empty
    ((,class (:inherit gnus-group-news-3-empty))
     (,terminal-class (:inherit gnus-group-news-3-empty))))

  `(gnus-group-mail-low
    ((,class (:weight bold
                      :inherit gnus-group-mail-low-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-mail-low-empty))))

  `(gnus-group-mail-low-empty
    ((,class (:inherit gnus-group-news-low-empty))
     (,terminal-class (:inherit gnus-group-news-low-empty))))

  `(gnus-group-news-1
    ((,class (:weight bold
                      :inherit gnus-group-news-1-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-news-1-empty))))

  `(gnus-group-news-2
    ((,class (:weight bold
                      :inherit gnus-group-news-2-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-news-2-empty))))

  `(gnus-group-news-3
    ((,class (:weight bold
                      :inherit gnus-group-news-3-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-news-3-empty))))

  `(gnus-group-news-4
    ((,class (:weight bold
                      :inherit gnus-group-news-4-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-news-4-empty))))

  `(gnus-group-news-5
    ((,class (:weight bold
                      :inherit gnus-group-news-5-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-news-5-empty))))

  `(gnus-group-news-6
    ((,class (:weight bold
                      :inherit gnus-group-news-6-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-news-6-empty))))

  `(gnus-group-news-low
    ((,class (:weight bold
                      :inherit gnus-group-news-low-empty))
     (,terminal-class (:weight bold
                               :inherit gnus-group-news-low-empty))))

  `(gnus-header-content
    ((,class (:inherit message-header-other))
     (,terminal-class (:inherit message-header-other))))

  `(gnus-header-from
    ((,class (:inherit message-header-other))
     (,terminal-class (:inherit message-header-other))))

  `(gnus-header-name
    ((,class (:inherit message-header-name))
     (,terminal-class (:inherit message-header-name))))

  `(gnus-header-newsgroups
    ((,class (:inherit message-header-other))
     (,terminal-class (:inherit message-header-other))))

  `(gnus-header-subject
    ((,class (:inherit message-header-subject))
     (,terminal-class (:inherit message-header-subject))))

  `(gnus-summary-cancelled
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(gnus-summary-high-ancient
    ((,class (:foreground ,anti-darkokai-blue
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :weight bold))))

  `(gnus-summary-high-read
    ((,class (:foreground ,anti-darkokai-green
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :weight bold))))

  `(gnus-summary-high-ticked
    ((,class (:foreground ,anti-darkokai-orange
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :weight bold))))

  `(gnus-summary-high-unread
    ((,class (:foreground ,anti-darkokai-fg
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :weight bold))))

  `(gnus-summary-low-ancient
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(gnus-summary-low-read
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(gnus-summary-low-ticked
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(gnus-summary-low-unread
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(gnus-summary-normal-ancient
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(gnus-summary-normal-read
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(gnus-summary-normal-ticked
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(gnus-summary-normal-unread
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(gnus-summary-selected
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(gnus-cite-1
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(gnus-cite-2
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(gnus-cite-3
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(gnus-cite-4
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(gnus-cite-5
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(gnus-cite-6
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(gnus-cite-7
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(gnus-cite-8
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(gnus-cite-9
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(gnus-cite-10
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(gnus-cite-11
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(gnus-group-news-1-empty
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(gnus-group-news-2-empty
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(gnus-group-news-3-empty
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(gnus-group-news-4-empty
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(gnus-group-news-5-empty
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(gnus-group-news-6-empty
    ((,class (:foreground ,anti-darkokai-blue-lc))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue-lc))))

  `(gnus-group-news-low-empty
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(gnus-signature
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(gnus-x-face
    ((,class (:background ,anti-darkokai-fg
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-fg
                                   :foreground ,terminal-anti-darkokai-bg))))


  ;; helm
  `(helm-apt-deinstalled
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(helm-apt-installed
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(helm-bookmark-directory
    ((,class (:inherit helm-ff-directory))
     (,terminal-class (:inherit helm-ff-directory))))

  `(helm-bookmark-file
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(helm-bookmark-gnus
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(helm-bookmark-info
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(helm-bookmark-man
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(helm-bookmark-w3m
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(helm-bookmarks-su
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(helm-buffer-file
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(helm-buffer-directory
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(helm-buffer-process
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(helm-buffer-saved-out
    ((,class (:foreground ,anti-darkokai-red
                          :background ,anti-darkokai-bg
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-bg
                                   :inverse-video t))))

  `(helm-buffer-size
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(helm-candidate-number
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-emph
                          :bold t))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-emph
                                   :bold t))))

  `(helm-ff-directory
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(helm-ff-executable
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(helm-ff-file
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(helm-ff-invalid-symlink
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-orange
                          :slant italic))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-orange
                                   :slant italic))))

  `(helm-ff-prefix
    ((,class (:background ,anti-darkokai-green
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-green
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(helm-ff-symlink
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(helm-grep-file
    ((,class (:foreground ,anti-darkokai-cyan
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :underline t))))

  `(helm-grep-finish
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(helm-grep-lineno
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(helm-grep-match
    ((,class (:inherit helm-match)))
    ((,terminal-class (:inherit helm-match))))

  `(helm-grep-running
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(helm-header
    ((,class (:inherit header-line))
     (,terminal-class (:inherit terminal-header-line))))

  `(helm-lisp-completion-info
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(helm-lisp-show-completion
    ((,class (:foreground ,anti-darkokai-yellow
                          :background ,anti-darkokai-highlight-line
                          :bold t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :background ,terminal-anti-darkokai-highlight-line
                                   :bold t))))

  `(helm-M-x-key
    ((,class (:foreground ,anti-darkokai-orange
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :underline t))))

  `(helm-moccur-buffer
    ((,class (:foreground ,anti-darkokai-cyan
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :underline t))))

  `(helm-match
    ((,class (:foreground ,anti-darkokai-green :inherit bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green :inherit bold))))

  `(helm-match-item
    ((,class (:inherit helm-match))
     (,terminal-class (:inherit helm-match))))

  `(helm-selection
    ((,class (:background ,anti-darkokai-highlight-line
                          :inherit bold
                          :underline nil))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :inherit bold
                                   :underline nil))))

  `(helm-selection-line
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-emph
                          :underline nil))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-emph
                                   :underline nil))))

  `(helm-separator
    ((,class (:foreground ,anti-darkokai-gray))
     (,terminal-class (:foreground ,terminal-anti-darkokai-gray))))

  `(helm-source-header
    ((,class (:background ,anti-darkokai-violet-l
                          :foreground ,anti-darkokai-bg
                          :underline nil))
     (,terminal-class (:background ,terminal-anti-darkokai-violet-l
                                   :foreground ,terminal-anti-darkokai-bg
                                   :underline nil))))

  `(helm-swoop-target-line-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(helm-swoop-target-line-block-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(helm-swoop-target-word-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(helm-time-zone-current
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(helm-time-zone-home
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(helm-visible-mark
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-magenta :bold t))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-magenta :bold t))))

  ;; helm-ls-git
  `(helm-ls-git-modified-not-staged-face
    ((,class :foreground ,anti-darkokai-blue)
     (,terminal-class :foreground ,terminal-anti-darkokai-blue)))

  `(helm-ls-git-modified-and-staged-face
    ((,class :foreground ,anti-darkokai-blue-l)
     (,terminal-class :foreground ,terminal-anti-darkokai-blue-l)))

  `(helm-ls-git-renamed-modified-face
    ((,class :foreground ,anti-darkokai-blue-l)
     (,terminal-class :foreground ,terminal-anti-darkokai-blue-l)))

  `(helm-ls-git-untracked-face
    ((,class :foreground ,anti-darkokai-orange)
     (,terminal-class :foreground ,terminal-anti-darkokai-orange)))

  `(helm-ls-git-added-copied-face
    ((,class :foreground ,anti-darkokai-green)
     (,terminal-class :foreground ,terminal-anti-darkokai-green)))

  `(helm-ls-git-added-modified-face
    ((,class :foreground ,anti-darkokai-green-l)
     (,terminal-class :foreground ,terminal-anti-darkokai-green-l)))

  `(helm-ls-git-deleted-not-staged-face
    ((,class :foreground ,anti-darkokai-red)
     (,terminal-class :foreground ,terminal-anti-darkokai-red)))

  `(helm-ls-git-deleted-and-staged-face
    ((,class :foreground ,anti-darkokai-red-l)
     (,terminal-class :foreground ,terminal-anti-darkokai-red-l)))

  `(helm-ls-git-conflict-face
    ((,class :foreground ,anti-darkokai-yellow)
     (,terminal-class :foreground ,terminal-anti-darkokai-yellow)))

  ;; hi-lock-mode
  `(hi-yellow
    ((,class (:foreground ,anti-darkokai-yellow-lc
                          :background ,anti-darkokai-yellow-hc))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow-lc
                                   :background ,terminal-anti-darkokai-yellow-hc))))

  `(hi-pink
    ((,class (:foreground ,anti-darkokai-magenta-lc
                          :background ,anti-darkokai-magenta-hc))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta-lc
                                   :background ,terminal-anti-darkokai-magenta-hc))))

  `(hi-green
    ((,class (:foreground ,anti-darkokai-green-lc
                          :background ,anti-darkokai-green-hc))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green-lc
                                   :background ,terminal-anti-darkokai-green-hc))))

  `(hi-blue
    ((,class (:foreground ,anti-darkokai-blue-lc
                          :background ,anti-darkokai-blue-hc))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue-lc
                                   :background ,terminal-anti-darkokai-blue-hc))))

  `(hi-black-b
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-bg
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-bg
                                   :weight bold))))

  `(hi-blue-b
    ((,class (:foreground ,anti-darkokai-blue-lc
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue-lc
                                   :weight bold))))

  `(hi-green-b
    ((,class (:foreground ,anti-darkokai-green-lc
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green-lc
                                   :weight bold))))

  `(hi-red-b
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold))))

  `(hi-black-hb
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-bg
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-bg
                                   :weight bold))))

  ;; highlight-changes
  `(highlight-changes
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(highlight-changes-delete
    ((,class (:foreground ,anti-darkokai-red
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :underline t))))

  ;; highlight-indentation
  `(highlight-indentation-face
    ((,class (:background ,anti-darkokai-gray))
     (,terminal-class (:background ,terminal-anti-darkokai-gray))))

  `(highlight-indentation-current-column-face
    ((,class (:background ,anti-darkokai-gray))
     (,terminal-class (:background ,terminal-anti-darkokai-gray))))

  ;; hl-line-mode
  `(hl-line
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(hl-line-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  ;; ido-mode
  `(ido-first-match
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight normal))))

  `(ido-only-match
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-yellow
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-yellow
                                   :weight normal))))

  `(ido-subdir
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(ido-incomplete-regexp
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold ))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold ))))

  `(ido-indicator
    ((,class (:background ,anti-darkokai-red
                          :foreground ,anti-darkokai-bg
                          :width condensed))
     (,terminal-class (:background ,terminal-anti-darkokai-red
                                   :foreground ,terminal-anti-darkokai-bg
                                   :width condensed))))

  `(ido-virtual
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(jabber-activity-face
    ((,class (:weight bold
                      :foreground ,anti-darkokai-red))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-red))))

  `(jabber-activity-personal-face
    ((,class (:weight bold
                      :foreground ,anti-darkokai-blue))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-blue))))

  `(jabber-chat-error
    ((,class (:weight bold
                      :foreground ,anti-darkokai-red))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-red))))

  `(jabber-chat-prompt-foreign
    ((,class (:weight bold
                      :foreground ,anti-darkokai-red))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-red))))

  `(jabber-chat-prompt-local
    ((,class (:weight bold
                      :foreground ,anti-darkokai-blue))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-blue))))

  `(jabber-chat-prompt-system
    ((,class (:weight bold
                      :foreground ,anti-darkokai-green))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-green))))

  `(jabber-chat-text-foreign
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(jabber-chat-text-local
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(jabber-chat-rare-time-face
    ((,class (:underline t
                         :foreground ,anti-darkokai-green))
     (,terminal-class (:underline t
                                  :foreground ,terminal-anti-darkokai-green))))

  `(jabber-roster-user-away
    ((,class (:slant italic
                     :foreground ,anti-darkokai-green))
     (,terminal-class (:slant italic
                              :foreground ,terminal-anti-darkokai-green))))

  `(jabber-roster-user-chatty
    ((,class (:weight bold
                      :foreground ,anti-darkokai-orange))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-orange))))

  `(jabber-roster-user-dnd
    ((,class (:slant italic
                     :foreground ,anti-darkokai-red))
     (,terminal-class (:slant italic
                              :foreground ,terminal-anti-darkokai-red))))

  `(jabber-roster-user-error
    ((,class (:weight light
                      :slant italic
                      :foreground ,anti-darkokai-red))
     (,terminal-class (:weight light
                               :slant italic
                               :foreground ,terminal-anti-darkokai-red))))

  `(jabber-roster-user-offline
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(jabber-roster-user-online
    ((,class (:weight bold
                      :foreground ,anti-darkokai-blue))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-blue))))

  `(jabber-roster-user-xa
    ((,class (:slant italic
                     :foreground ,anti-darkokai-magenta))
     (,terminal-class (:slant italic
                              :foreground ,terminal-anti-darkokai-magenta))))

  ;; js2-mode colors
  `(js2-error
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(js2-external-variable
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(js2-function-param
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(js2-instance-member
    ((,class (:foreground ,anti-darkokai-magenta))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta))))

  `(js2-jsdoc-html-tag-delimiter
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(js2-jsdoc-html-tag-name
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(js2-object-property
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(js2-function-call
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(js2-jsdoc-tag
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(js2-jsdoc-type
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(js2-jsdoc-value
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(js2-magic-paren
    ((,class (:underline t))
     (,terminal-class (:underline t))))

  `(js2-private-function-call
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(js2-private-member
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(js2-warning
    ((,class (:underline ,anti-darkokai-orange))
     (,terminal-class (:underline ,terminal-anti-darkokai-orange))))

  ;; jedi
  `(jedi:highlight-function-argument
    ((,class (:inherit bold))
     (,terminal-class (:inherit bold))))

  ;; linum-mode
  `(linum
    ((,class (:foreground ,anti-darkokai-highlight
                          :background ,s-fringe-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :background ,terminal-s-fringe-bg))))

  ;; lusty-explorer
  `(lusty-directory-face
    ((,class (:inherit dianti-darkokai-red-directory))
     (,terminal-class (:inherit dianti-darkokai-red-directory))))

  `(lusty-file-face
    ((,class nil)
     (,terminal-class nil)))

  `(lusty-match-face
    ((,class (:inherit ido-first-match))
     (,terminal-class (:inherit ido-first-match))))

  `(lusty-slash-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :weight bold))))

  ;; magit
  ;;
  ;; TODO: Add supports for all magit faces
  ;; https://github.com/magit/magit/search?utf8=%E2%9C%93&q=face
  ;;
  `(magit-diff-added
    ((,class (:foreground ,anti-darkokai-green-plain
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :background ,terminal-anti-darkokai-bg))))

  `(magit-diff-added-highlight
    ((,class (:foreground ,anti-darkokai-green-plain
                          :background ,anti-darkokai-highlight-line))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :background ,terminal-anti-darkokai-highlight-line))))

  `(magit-diff-removed
    ((,class (:foreground ,anti-darkokai-red-plain
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-bg))))

  `(magit-diff-removed-highlight
    ((,class (:foreground ,anti-darkokai-red-plain
                          :background ,anti-darkokai-highlight-line))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-highlight-line))))

  `(magit-section-title
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(magit-branch
    ((,class (:foreground ,anti-darkokai-orange
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :weight bold))))

  `(magit-cherry-equivalent
    ((,class (:foreground ,anti-darkokai-magenta))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta))))

  `(magit-cherry-unmatched
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(magit-head
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(magit-branch-local
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(magit-branch-remote
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(magit-section-heading
    ((,class (:foreground ,anti-darkokai-yellow :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow :weight bold))))

  `(magit-process-ok
    ((,class (:foreground ,anti-darkokai-green-plain
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :weight bold))))

  `(magit-process-ng
    ((,class (:foreground ,anti-darkokai-red-plain
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold))))

  `(magit-item-highlight
    ((,class (:background ,anti-darkokai-highlight-line
                          :weight unspecified))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :weight unspecified))))

  `(magit-log-author
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(magit-log-graph
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(magit-log-head-label-bisect-bad
    ((,class (:background ,anti-darkokai-red-hc
                          :foreground ,anti-darkokai-red-lc
                          :box 1))
     (,terminal-class (:background ,terminal-anti-darkokai-red-hc
                                   :foreground ,terminal-anti-darkokai-red-lc
                                   :box 1))))

  `(magit-log-head-label-bisect-good
    ((,class (:background ,anti-darkokai-green-hc
                          :foreground ,anti-darkokai-green-lc
                          :box 1))
     (,terminal-class (:background ,terminal-anti-darkokai-green-hc
                                   :foreground ,terminal-anti-darkokai-green-lc
                                   :box 1))))

  `(magit-log-head-label-default
    ((,class (:background ,anti-darkokai-highlight-line
                          :box 1))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :box 1))))

  `(magit-log-head-label-local
    ((,class (:background ,anti-darkokai-blue-lc
                          :foreground ,anti-darkokai-blue-hc
                          :box 1))
     (,terminal-class (:background ,terminal-anti-darkokai-blue-lc
                                   :foreground ,terminal-anti-darkokai-blue-hc
                                   :box 1))))

  `(magit-log-head-label-patches
    ((,class (:background ,anti-darkokai-red-lc
                          :foreground ,anti-darkokai-red-hc
                          :box 1))
     (,terminal-class (:background ,terminal-anti-darkokai-red-lc
                                   :foreground ,terminal-anti-darkokai-red-hc
                                   :box 1))))

  `(magit-log-head-label-remote
    ((,class (:background ,anti-darkokai-green-lc
                          :foreground ,anti-darkokai-green-hc
                          :box 1))
     (,terminal-class (:background ,terminal-anti-darkokai-green-lc
                                   :foreground ,terminal-anti-darkokai-green-hc
                                   :box 1))))

  `(magit-log-head-label-tags
    ((,class (:background ,anti-darkokai-yellow-lc
                          :foreground ,anti-darkokai-yellow-hc
                          :box 1))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow-lc
                                   :foreground ,terminal-anti-darkokai-yellow-hc
                                   :box 1))))

  `(magit-log-sha1
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(magit-reflog-amend
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))
  `(magit-reflog-rebase
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))
  `(magit-reflog-checkout
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))
  `(magit-reflog-reset
    ((,class (:foreground ,anti-darkokai-red-plain))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))
  `(magit-reflog-commit
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))
  `(magit-reflog-merge
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))
  `(magit-reflog-cherry-pick
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))
  `(magit-reflog-other
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))
  `(magit-reflog-remote
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  ;; man
  `(Man-overstrike
    ((,class (:foreground ,anti-darkokai-blue
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :weight bold))))

  `(Man-reverse
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(Man-underline
    ((,class (:foreground ,anti-darkokai-green :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green :underline t))))

  ;; monky
  `(monky-section-title
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(monky-diff-title
    ((,class (:foreground ,anti-darkokai-cyan-l
                          :background ,anti-darkokai-gray-ld))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan-l
                                   :background ,terminal-anti-darkokai-gray-d))))

  `(monky-diff-add
    ((,class (:foreground ,anti-darkokai-green-plain))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(monky-diff-del
    ((,class (:foreground ,anti-darkokai-red-plain))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  ;; markdown-mode
  `(markdown-header-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(markdown-header-face-1
    ((,class (:inherit markdown-header-face
                       :height ,anti-darkokai-height-plus-4))
     (,terminal-class (:inherit markdown-header-face
                                :height ,anti-darkokai-height-plus-4))))

  `(markdown-header-face-2
    ((,class (:inherit markdown-header-face
                       :height ,anti-darkokai-height-plus-3))
     (,terminal-class (:inherit markdown-header-face
                                :height ,anti-darkokai-height-plus-3))))

  `(markdown-header-face-3
    ((,class (:inherit markdown-header-face
                       :height ,anti-darkokai-height-plus-2))
     (,terminal-class (:inherit markdown-header-face
                                :height ,anti-darkokai-height-plus-2))))

  `(markdown-header-face-4
    ((,class (:inherit markdown-header-face
                       :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:inherit markdown-header-face
                                :height ,anti-darkokai-height-plus-1))))

  `(markdown-header-face-5
    ((,class (:inherit markdown-header-face))
     (,terminal-class (:inherit markdown-header-face))))

  `(markdown-header-face-6
    ((,class (:inherit markdown-header-face))
     (,terminal-class (:inherit markdown-header-face))))

  ;; message-mode
  `(message-cited-text
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(message-header-name
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(message-header-other
    ((,class (:foreground ,anti-darkokai-fg
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :weight normal))))

  `(message-header-to
    ((,class (:foreground ,anti-darkokai-fg
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :weight normal))))

  `(message-header-cc
    ((,class (:foreground ,anti-darkokai-fg
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :weight normal))))

  `(message-header-newsgroups
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(message-header-subject
    ((,class (:foreground ,anti-darkokai-cyan
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :weight normal))))

  `(message-header-xheader
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(message-mml
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(message-separator
    ((,class (:foreground ,anti-darkokai-comments
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :slant italic))))

  ;; mew
  `(mew-face-header-subject
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(mew-face-header-from
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(mew-face-header-date
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(mew-face-header-to
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(mew-face-header-key
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(mew-face-header-private
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(mew-face-header-important
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(mew-face-header-marginal
    ((,class (:foreground ,anti-darkokai-fg
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :weight bold))))

  `(mew-face-header-warning
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(mew-face-header-xmew
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(mew-face-header-xmew-bad
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(mew-face-body-url
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(mew-face-body-comment
    ((,class (:foreground ,anti-darkokai-fg
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :slant italic))))

  `(mew-face-body-cite1
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(mew-face-body-cite2
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(mew-face-body-cite3
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(mew-face-body-cite4
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(mew-face-body-cite5
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(mew-face-mark-review
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(mew-face-mark-escape
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(mew-face-mark-delete
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(mew-face-mark-unlink
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(mew-face-mark-refile
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(mew-face-mark-unread
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(mew-face-eof-message
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(mew-face-eof-part
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  ;; mingus
  `(mingus-directory-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(mingus-pausing-face
    ((,class (:foreground ,anti-darkokai-magenta))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta))))

  `(mingus-playing-face
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(mingus-playlist-face
    ((,class (:foreground ,anti-darkokai-cyan ))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan ))))

  `(mingus-song-file-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(mingus-stopped-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  ;; mmm
  `(mmm-init-submode-face
    ((,class (:background ,anti-darkokai-violet-d))
     (,terminal-class (:background ,terminal-anti-darkokai-violet-d))))

  `(mmm-cleanup-submode-face
    ((,class (:background ,anti-darkokai-orange-d))
     (,terminal-class (:background ,terminal-anti-darkokai-orange-d))))

  `(mmm-declaration-submode-face
    ((,class (:background ,anti-darkokai-cyan-d))
     (,terminal-class (:background ,terminal-anti-darkokai-cyan-d))))

  `(mmm-comment-submode-face
    ((,class (:background ,anti-darkokai-blue-d))
     (,terminal-class (:background ,terminal-anti-darkokai-blue-d))))

  `(mmm-output-submode-face
    ((,class (:background ,anti-darkokai-red-d))
     (,terminal-class (:background ,terminal-anti-darkokai-red-d))))

  `(mmm-special-submode-face
    ((,class (:background ,anti-darkokai-green-d))
     (,terminal-class (:background ,terminal-anti-darkokai-green-d))))

  `(mmm-code-submode-face
    ((,class (:background ,anti-darkokai-gray))
     (,terminal-class (:background ,terminal-anti-darkokai-gray))))

  `(mmm-default-submode-face
    ((,class (:background ,anti-darkokai-gray-d))
     (,terminal-class (:background ,terminal-anti-darkokai-gray-d))))

  ;; moccur
  `(moccur-current-line-face
    ((,class (:underline t))
     (,terminal-class (:underline t))))

  `(moccur-edit-done-face
    ((,class (:foreground ,anti-darkokai-comments
                          :background ,anti-darkokai-bg
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :background ,terminal-anti-darkokai-bg
                                   :slant italic))))

  `(moccur-edit-face
    ((,class (:background ,anti-darkokai-yellow
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(moccur-edit-file-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(moccur-edit-reject-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(moccur-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-emph
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-emph
                                   :weight bold))))

  `(search-buffers-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-emph
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-emph
                                   :weight bold))))

  `(search-buffers-header-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  ;; mu4e
  `(mu4e-cited-1-face
    ((,class (:foreground ,anti-darkokai-green
                          :slant italic
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :slant italic
                                   :weight normal))))

  `(mu4e-cited-2-face
    ((,class (:foreground ,anti-darkokai-blue
                          :slant italic
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :slant italic
                                   :weight normal))))

  `(mu4e-cited-3-face
    ((,class (:foreground ,anti-darkokai-orange
                          :slant italic
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :slant italic
                                   :weight normal))))

  `(mu4e-cited-4-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :slant italic
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :slant italic
                                   :weight normal))))

  `(mu4e-cited-5-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :slant italic
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :slant italic
                                   :weight normal))))

  `(mu4e-cited-6-face
    ((,class (:foreground ,anti-darkokai-green
                          :slant italic
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :slant italic
                                   :weight normal))))

  `(mu4e-cited-7-face
    ((,class (:foreground ,anti-darkokai-blue
                          :slant italic
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :slant italic
                                   :weight normal))))

  `(mu4e-flagged-face
    ((,class (:foreground ,anti-darkokai-magenta
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta
                                   :weight bold))))

  `(mu4e-view-url-number-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight normal))))

  `(mu4e-warning-face
    ((,class (:foreground ,anti-darkokai-red
                          :slant normal
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :slant normal
                                   :weight bold))))

  `(mu4e-header-highlight-face
    ((,class (:inherit unspecified
                       :foreground unspecified
                       :background ,anti-darkokai-highlight-line
                       :underline ,anti-darkokai-emph
                       :weight normal))
     (,terminal-class (:inherit unspecified
                                :foreground unspecified
                                :background ,terminal-anti-darkokai-highlight-line
                                :underline ,terminal-anti-darkokai-emph
                                :weight normal))))


  `(mu4e-draft-face
    ((,class (:inherit font-lock-string-face))
     (,terminal-class (:inherit font-lock-string-face))))

  `(mu4e-footer-face
    ((,class (:inherit font-lock-comment-face))
     (,terminal-class (:inherit font-lock-comment-face))))

  `(mu4e-forwarded-face
    ((,class (:inherit font-lock-builtin-face
                       :weight normal))
     (,terminal-class (:inherit font-lock-builtin-face
                                :weight normal))))

  `(mu4e-header-face
    ((,class (:inherit default))
     (,terminal-class (:inherit default))))

  `(mu4e-header-marks-face
    ((,class (:inherit font-lock-preprocessor-face))
     (,terminal-class (:inherit font-lock-preprocessor-face))))

  `(mu4e-header-title-face
    ((,class (:inherit font-lock-type-face))
     (,terminal-class (:inherit font-lock-type-face))))

  `(mu4e-highlight-face
    ((,class (:inherit font-lock-pseudo-keyword-face
                       :weight bold))
     (,terminal-class (:inherit font-lock-pseudo-keyword-face
                                :weight bold))))

  `(mu4e-moved-face
    ((,class (:inherit font-lock-comment-face
                       :slant italic))
     (,terminal-class (:inherit font-lock-comment-face
                                :slant italic))))

  `(mu4e-ok-face
    ((,class (:inherit font-lock-comment-face
                       :slant normal
                       :weight bold))
     (,terminal-class (:inherit font-lock-comment-face
                                :slant normal
                                :weight bold))))

  `(mu4e-replied-face
    ((,class (:inherit font-lock-builtin-face
                       :weight normal))
     (,terminal-class (:inherit font-lock-builtin-face
                                :weight normal))))

  `(mu4e-system-face
    ((,class (:inherit font-lock-comment-face
                       :slant italic))
     (,terminal-class (:inherit font-lock-comment-face
                                :slant italic))))

  `(mu4e-title-face
    ((,class (:inherit font-lock-type-face
                       :weight bold))
     (,terminal-class (:inherit font-lock-type-face
                                :weight bold))))

  `(mu4e-trashed-face
    ((,class (:inherit font-lock-comment-face
                       :strike-through t))
     (,terminal-class (:inherit font-lock-comment-face
                                :strike-through t))))

  `(mu4e-unread-face
    ((,class (:inherit font-lock-keyword-face
                       :weight bold))
     (,terminal-class (:inherit font-lock-keyword-face
                                :weight bold))))

  `(mu4e-view-attach-number-face
    ((,class (:inherit font-lock-variable-name-face
                       :weight bold))
     (,terminal-class (:inherit font-lock-variable-name-face
                                :weight bold))))

  `(mu4e-view-contact-face
    ((,class (:foreground ,anti-darkokai-fg
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :weight normal))))

  `(mu4e-view-header-key-face
    ((,class (:inherit message-header-name
                       :weight normal))
     (,terminal-class (:inherit message-header-name
                                :weight normal))))

  `(mu4e-view-header-value-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :weight normal
                          :slant normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :weight normal
                                   :slant normal))))

  `(mu4e-view-link-face
    ((,class (:inherit link))
     (,terminal-class (:inherit link))))

  `(mu4e-view-special-header-value-face
    ((,class (:foreground ,anti-darkokai-blue
                          :weight normal
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :weight normal
                                   :underline nil))))

  ;; mumamo
  `(mumamo-background-chunk-submode1
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  ;; nav
  `(nav-face-heading
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(nav-face-button-num
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(nav-face-dir
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(nav-face-hdir
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(nav-face-file
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(nav-face-hfile
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  ;; nav-flash
  `(nav-flash-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  ;; neo-tree
  `(neo-banner-face
    ((,class (:foreground ,anti-darkokai-blue
                          :background ,anti-darkokai-bg
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :background ,terminal-anti-darkokai-bg
                                   :weight bold))))


  `(neo-header-face
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-bg))))

  `(neo-root-dir-face
    ((,class (:foreground ,anti-darkokai-green
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :background ,terminal-anti-darkokai-bg))))

  `(neo-dir-link-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :background ,terminal-anti-darkokai-bg))))

  `(neo-file-link-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(neo-button-face
    ((,class (:underline nil))
     (,terminal-class (:underline nil))))

  `(neo-expand-btn-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(neo-vc-default-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(neo-vc-user-face
    ((,class (:foreground ,anti-darkokai-red
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :slant italic))))

  `(neo-vc-up-to-date-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(neo-vc-edited-face
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(neo-vc-needs-update-face
    ((,class (:underline t))
     (,terminal-class (:underline t))))

  `(neo-vc-needs-merge-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(neo-vc-unlocked-changes-face
    ((,class (:foreground ,anti-darkokai-red
                          :background ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-comments))))

  `(neo-vc-added-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(neo-vc-removed-face
    ((,class (:strike-through t))
     (,terminal-class (:strike-through t))))

  `(neo-vc-conflict-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(neo-vc-missing-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(neo-vc-ignored-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))


  ;; org-mode
  `(org-agenda-structure
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-highlight-line
                          :weight bold
                          :slant normal
                          :inverse-video nil
                          :height ,anti-darkokai-height-plus-1
                          :underline nil
                          :box (:line-width 2 :color ,anti-darkokai-bg)))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-highlight-line
                                   :weight bold
                                   :slant normal
                                   :inverse-video nil
                                   :height ,anti-darkokai-height-plus-1
                                   :underline nil
                                   :box (:line-width 2 :color ,terminal-anti-darkokai-bg)))))

  `(org-agenda-calendar-event
    ((,class (:foreground ,anti-darkokai-emph))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph))))

  `(org-agenda-calendar-sexp
    ((,class (:foreground ,anti-darkokai-fg
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :slant italic))))

  `(org-agenda-date
    ((,class (:foreground ,anti-darkokai-comments
                          :background ,anti-darkokai-bg
                          :weight normal
                          :inverse-video nil
                          :overline nil
                          :slant normal
                          :height 1.0
                          :box (:line-width 2 :color ,anti-darkokai-bg)))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :background ,terminal-anti-darkokai-bg
                                   :weight normal
                                   :inverse-video nil
                                   :overline nil
                                   :slant normal
                                   :height 1.0
                                   :box (:line-width 2 :color ,terminal-anti-darkokai-bg)))) t)

  `(org-agenda-date-weekend
    ((,class (:inherit org-agenda-date
                       :inverse-video nil
                       :background unspecified
                       :foreground ,anti-darkokai-comments
                       :weight unspecified
                       :underline t
                       :overline nil
                       :box unspecified))
     (,terminal-class (:inherit org-agenda-date
                                :inverse-video nil
                                :background unspecified
                                :foreground ,terminal-anti-darkokai-comments
                                :weight unspecified
                                :underline t
                                :overline nil
                                :box unspecified))) t)

  `(org-agenda-date-today
    ((,class (:inherit org-agenda-date
                       :inverse-video t
                       :weight bold
                       :underline unspecified
                       :overline nil
                       :box unspecified
                       :foreground ,anti-darkokai-blue
                       :background ,anti-darkokai-bg))
     (,terminal-class (:inherit org-agenda-date
                                :inverse-video t
                                :weight bold
                                :underline unspecified
                                :overline nil
                                :box unspecified
                                :foreground ,terminal-anti-darkokai-blue
                                :background ,terminal-anti-darkokai-bg))) t)

  `(org-agenda-done
    ((,class (:foreground ,anti-darkokai-comments
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :slant italic))) t)

  `(org-archived
    ((,class (:foreground ,anti-darkokai-comments
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :weight normal))))

  `(org-block
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(org-block-begin-line
    ((,class (:foreground ,anti-darkokai-comments
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :slant italic))))

  `(org-checkbox
    ((,class (:background ,anti-darkokai-gray
                          :foreground ,anti-darkokai-violet
                          :box nil))
     (,terminal-class (:background ,terminal-anti-darkokai-gray
                                   :foreground ,terminal-anti-darkokai-violet
                                   :box nil))))

  `(org-code
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(org-date
    ((,class (:foreground ,anti-darkokai-blue
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :underline t))))

  `(org-done
    ((,class (:weight bold
                      :foreground ,anti-darkokai-green))
     (,terminal-class (:weight bold
                               :foreground ,terminal-anti-darkokai-green))))

  `(org-ellipsis
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(org-formula
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(org-headline-done
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(org-hide
    ((,class (:foreground ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg))))

  `(org-level-1
    ((,class (:inherit ,s-variable-pitch
                       :height ,anti-darkokai-height-plus-4
                       :foreground ,anti-darkokai-orange))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :height ,anti-darkokai-height-plus-4
                                :foreground ,terminal-anti-darkokai-orange))))

  `(org-level-2
    ((,class (:inherit ,s-variable-pitch
                       :height ,anti-darkokai-height-plus-3
                       :foreground ,anti-darkokai-green))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :height ,anti-darkokai-height-plus-3
                                :foreground ,terminal-anti-darkokai-green))))

  `(org-level-3
    ((,class (:inherit ,s-variable-pitch
                       :height ,anti-darkokai-height-plus-2
                       :foreground ,anti-darkokai-blue))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :height ,anti-darkokai-height-plus-2
                                :foreground ,terminal-anti-darkokai-blue))))

  `(org-level-4
    ((,class (:inherit ,s-variable-pitch
                       :height ,anti-darkokai-height-plus-1
                       :foreground ,anti-darkokai-yellow))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :height ,anti-darkokai-height-plus-1
                                :foreground ,terminal-anti-darkokai-yellow))))

  `(org-level-5
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-cyan))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-cyan))))

  `(org-level-6
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-green))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-green))))

  `(org-level-7
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-red))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-red))))

  `(org-level-8
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-blue))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-blue))))

  `(org-link
    ((,class (:foreground ,anti-darkokai-yellow
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :underline t))))

  `(org-sexp-date
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(org-scheduled
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(org-scheduled-previously
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(org-scheduled-today
    ((,class (:foreground ,anti-darkokai-blue
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :weight normal))))

  `(org-special-keyword
    ((,class (:foreground ,anti-darkokai-comments
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :weight bold))))

  `(org-table
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(org-tag
    ((,class (:weight bold))
     (,terminal-class (:weight bold))))

  `(org-time-grid
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(org-todo
    ((,class (:foreground ,anti-darkokai-red
                          :weight bold)))
    ((,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :weight bold))))

  `(org-upcoming-deadline
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight normal
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight normal
                                   :underline nil))))

  `(org-warning
    ((,class (:foreground ,anti-darkokai-orange
                          :weight normal
                          :underline nil))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange
                                   :weight normal
                                   :underline nil))))

  ;; org-habit (clear=blue, ready=green, alert=yellow, overdue=red. future=lower contrast)
  `(org-habit-clear-face
    ((,class (:background ,anti-darkokai-blue-lc
                          :foreground ,anti-darkokai-blue-hc))
     (,terminal-class (:background ,terminal-anti-darkokai-blue-lc
                                   :foreground ,terminal-anti-darkokai-blue-hc))))

  `(org-habit-clear-future-face
    ((,class (:background ,anti-darkokai-blue-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-blue-lc))))

  `(org-habit-ready-face
    ((,class (:background ,anti-darkokai-green-lc
                          :foreground ,anti-darkokai-green))
     (,terminal-class (:background ,terminal-anti-darkokai-green-lc
                                   :foreground ,terminal-anti-darkokai-green))))

  `(org-habit-ready-future-face
    ((,class (:background ,anti-darkokai-green-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-green-lc))))

  `(org-habit-alert-face
    ((,class (:background ,anti-darkokai-yellow
                          :foreground ,anti-darkokai-yellow-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow
                                   :foreground ,terminal-anti-darkokai-yellow-lc))))

  `(org-habit-alert-future-face
    ((,class (:background ,anti-darkokai-yellow-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow-lc))))

  `(org-habit-overdue-face
    ((,class (:background ,anti-darkokai-red
                          :foreground ,anti-darkokai-red-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-red
                                   :foreground ,terminal-anti-darkokai-red-lc))))

  `(org-habit-overdue-future-face
    ((,class (:background ,anti-darkokai-red-lc))
     (,terminal-class (:background ,terminal-anti-darkokai-red-lc))))

  ;; latest additions
  `(org-agenda-dimmed-todo-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(org-agenda-restriction-lock
    ((,class (:background ,anti-darkokai-yellow))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow))))

  `(org-clock-overlay
    ((,class (:background ,anti-darkokai-yellow))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow))))

  `(org-column
    ((,class (:background ,anti-darkokai-highlight-line
                          :strike-through nil
                          :underline nil
                          :slant normal
                          :weight normal
                          :inherit default))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :strike-through nil
                                   :underline nil
                                   :slant normal
                                   :weight normal
                                   :inherit default))))

  `(org-column-title
    ((,class (:background ,anti-darkokai-highlight-line
                          :underline t
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :underline t
                                   :weight bold))))

  `(org-date-selected
    ((,class (:foreground ,anti-darkokai-red
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :inverse-video t))))

  `(org-document-info
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(org-document-title
    ((,class (:foreground ,anti-darkokai-emph
                          :weight bold
                          :height ,anti-darkokai-height-plus-4))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :weight bold
                                   :height ,anti-darkokai-height-plus-4))))

  `(org-drawer
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(org-footnote
    ((,class (:foreground ,anti-darkokai-magenta
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta
                                   :underline t))))

  `(org-latex-and-export-specials
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(org-mode-line-clock-overrun
    ((,class (:inherit mode-line))
     (,terminal-class (:inherit mode-line))))

  ;; outline
  `(outline-1
    ((,class (:inherit org-level-1))
     (,terminal-class (:inherit org-level-1))))

  `(outline-2
    ((,class (:inherit org-level-2))
     (,terminal-class (:inherit org-level-2))))

  `(outline-3
    ((,class (:inherit org-level-3))
     (,terminal-class (:inherit org-level-3))))

  `(outline-4
    ((,class (:inherit org-level-4))
     (,terminal-class (:inherit org-level-4))))

  `(outline-5
    ((,class (:inherit org-level-5))
     (,terminal-class (:inherit org-level-5))))

  `(outline-6
    ((,class (:inherit org-level-6))
     (,terminal-class (:inherit org-level-6))))

  `(outline-7
    ((,class (:inherit org-level-7))
     (,terminal-class (:inherit org-level-7))))

  `(outline-8
    ((,class (:inherit org-level-8))
     (,terminal-class (:inherit org-level-8))))

  ;; parenface
  `(paren-face
    ((,terminal-class (:foreground ,anti-darkokai-comments))))

  ;; perspective
  `(persp-selected-face
    ((,class (:foreground ,anti-darkokai-violet
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :weight bold))))

  ;; pretty-mode
  `(pretty-mode-symbol-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight normal))))

  ;; popup
  `(popup-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(popup-isearch-match
    ((,class (:background ,anti-darkokai-green))
     (,terminal-class (:background ,terminal-anti-darkokai-green))))

  `(popup-menu-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(popup-menu-mouse-face
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(popup-menu-selection-face
    ((,class (:background ,anti-darkokai-magenta
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-magenta
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(popup-scroll-bar-background-face
    ((,class (:background ,anti-darkokai-comments))
     (,terminal-class (:background ,terminal-anti-darkokai-comments))))

  `(popup-scroll-bar-foreground-face
    ((,class (:background ,anti-darkokai-emph))
     (,terminal-class (:background ,terminal-anti-darkokai-emph))))

  `(popup-tip-face
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-fg))))

  ;; powerline
  `(powerline-active1
    ((,class (:background ,s-powerline-active1-bg :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-gray :foreground ,anti-darkokai-fg))))

  `(powerline-active2
    ((,class (:background ,s-powerline-active2-bg :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-gray-l :foreground ,anti-darkokai-fg))))

  `(powerline-inactive1
    ((,class (:background ,s-powerline-inactive1-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-gray-d))))

  `(powerline-inactive2
    ((,class (:background ,s-powerline-inactive2-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-gray))))

  ;; rainbow-delimiters
  `(rainbow-delimiters-depth-1-face
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(rainbow-delimiters-depth-2-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(rainbow-delimiters-depth-3-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(rainbow-delimiters-depth-4-face
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(rainbow-delimiters-depth-5-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(rainbow-delimiters-depth-6-face
    ((,class (:foreground ,anti-darkokai-magenta-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta))))

  `(rainbow-delimiters-depth-7-face
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(rainbow-delimiters-depth-8-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(rainbow-delimiters-depth-9-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(rainbow-delimiters-unmatched-face
    ((,class (:foreground ,anti-darkokai-fg
                          :background ,anti-darkokai-bg
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :background ,terminal-anti-darkokai-bg
                                   :inverse-video t))))

  ;; rhtm-mode
  `(erb-face
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-bg))))

  `(erb-delim-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :background ,terminal-anti-darkokai-bg))))

  `(erb-exec-face
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-bg))))

  `(erb-exec-delim-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :background ,terminal-anti-darkokai-bg))))

  `(erb-out-face
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-bg))))

  `(erb-out-delim-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :background ,terminal-anti-darkokai-bg))))

  `(erb-comment-face
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-bg))))

  `(erb-comment-delim-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :background ,terminal-anti-darkokai-bg))))

  ;; rst-mode
  `(rst-level-1-face
    ((,class (:background ,anti-darkokai-yellow
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(rst-level-2-face
    ((,class (:background ,anti-darkokai-cyan
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-cyan
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(rst-level-3-face
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(rst-level-4-face
    ((,class (:background ,anti-darkokai-violet
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-violet
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(rst-level-5-face
    ((,class (:background ,anti-darkokai-magenta
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-magenta
                                   :foreground ,terminal-anti-darkokai-bg))))

  `(rst-level-6-face
    ((,class (:background ,anti-darkokai-red
                          :foreground ,anti-darkokai-bg))
     (,terminal-class (:background ,terminal-anti-darkokai-red
                                   :foreground ,terminal-anti-darkokai-bg))))

  ;; rpm-mode
  `(rpm-spec-dir-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(rpm-spec-doc-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(rpm-spec-ghost-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(rpm-spec-macro-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(rpm-spec-obsolete-tag-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(rpm-spec-package-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(rpm-spec-section-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(rpm-spec-tag-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(rpm-spec-var-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  ;; sh-mode
  `(sh-quoted-exec
    ((,class (:foreground ,anti-darkokai-violet
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :weight bold))))

  `(sh-escaped-newline
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  `(sh-heredoc
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight bold))))

  ;; smartparens
  `(sp-pair-overlay-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(sp-wrap-overlay-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(sp-wrap-tag-overlay-face
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(sp-show-pair-enclosing
    ((,class (:inherit highlight))
     (,terminal-class (:inherit highlight))))

  `(sp-show-pair-match-face
    ((,class (:background ,anti-darkokai-cyan-l
                          :foreground ,anti-darkokai-cyan-d
                          :weight normal
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :background ,terminal-anti-darkokai-bg
                                   :weight normal
                                   :inverse-video t))))

  `(sp-show-pair-mismatch-face
    ((,class (:foreground ,anti-darkokai-red
                          :background ,anti-darkokai-bg
                          :weight normal
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-bg
                                   :weight normal
                                   :inverse-video t))))

  ;; show-paren
  `(show-paren-match
    ((,class (:foreground ,anti-darkokai-cyan-d
                          :background ,anti-darkokai-cyan-l
                          :weight normal
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan-d
                                   :background ,terminal-anti-darkokai-cyan-l
                                   :weight normal
                                   :inverse-video t))))

  `(show-paren-mismatch
    ((,class (:foreground ,anti-darkokai-red
                          :background ,anti-darkokai-bg
                          :weight normal
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-bg
                                   :weight normal
                                   :inverse-video t))))

  ;; mic-paren
  `(paren-face-match
    ((,class (:foreground ,anti-darkokai-green
                          :background ,anti-darkokai-bg
                          :weight normal
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :background ,terminal-anti-darkokai-bg
                                   :weight normal
                                   :inverse-video t))))

  `(paren-face-mismatch
    ((,class (:foreground ,anti-darkokai-red
                          :background ,anti-darkokai-bg
                          :weight normal
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-bg
                                   :weight normal
                                   :inverse-video t))))

  `(paren-face-no-match
    ((,class (:foreground ,anti-darkokai-red
                          :background ,anti-darkokai-bg
                          :weight normal
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-bg
                                   :weight normal
                                   :inverse-video t))))

  ;; SLIME
  `(slime-repl-inputed-output-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  ;; speedbar
  `(speedbar-button-face
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-comments))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-comments))))

  `(speedbar-directory-face
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-blue))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-blue))))

  `(speedbar-file-face
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-fg))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-fg))))

  `(speedbar-highlight-face
    ((,class (:inherit ,s-variable-pitch
                       :background ,anti-darkokai-highlight-line))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :background ,terminal-anti-darkokai-highlight-line))))

  `(speedbar-selected-face
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-yellow
                       :underline t))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-yellow
                                :underline t))))

  `(speedbar-separator-face
    ((,class (:inherit ,s-variable-pitch
                       :background ,anti-darkokai-blue
                       :foreground ,anti-darkokai-bg
                       :overline ,anti-darkokai-cyan-lc))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :background ,terminal-anti-darkokai-blue
                                :foreground ,terminal-anti-darkokai-bg
                                :overline ,terminal-anti-darkokai-cyan-lc))))

  `(speedbar-tag-face
    ((,class (:inherit ,s-variable-pitch
                       :foreground ,anti-darkokai-green))
     (,terminal-class (:inherit ,terminal-s-variable-pitch
                                :foreground ,terminal-anti-darkokai-green))))

  ;; sunrise commander headings
  `(sr-active-path-face
    ((,class (:background ,anti-darkokai-blue
                          :foreground ,anti-darkokai-bg
                          :height ,anti-darkokai-height-plus-1
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-blue
                                   :foreground ,terminal-anti-darkokai-bg
                                   :height ,anti-darkokai-height-plus-1
                                   :weight bold))))

  `(sr-editing-path-face
    ((,class (:background ,anti-darkokai-yellow
                          :foreground ,anti-darkokai-bg
                          :weight bold
                          :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:background ,terminal-anti-darkokai-yellow
                                   :foreground ,terminal-anti-darkokai-bg
                                   :weight bold
                                   :height ,anti-darkokai-height-plus-1))))

  `(sr-highlight-path-face
    ((,class (:background ,anti-darkokai-green
                          :foreground ,anti-darkokai-bg
                          :weight bold
                          :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:background ,terminal-anti-darkokai-green
                                   :foreground ,terminal-anti-darkokai-bg
                                   :weight bold
                                   :height ,anti-darkokai-height-plus-1))))

  `(sr-passive-path-face
    ((,class (:background ,anti-darkokai-comments
                          :foreground ,anti-darkokai-bg
                          :weight bold
                          :height ,anti-darkokai-height-plus-1))
     (,terminal-class (:background ,terminal-anti-darkokai-comments
                                   :foreground ,terminal-anti-darkokai-bg
                                   :weight bold
                                   :height ,anti-darkokai-height-plus-1))))

  ;; sunrise commander marked
  `(sr-marked-dir-face
    ((,class (:inherit dianti-darkokai-red-marked))
     (,terminal-class (:inherit dianti-darkokai-red-marked))))

  `(sr-marked-file-face
    ((,class (:inherit dianti-darkokai-red-marked))
     (,terminal-class (:inherit dianti-darkokai-red-marked))))

  `(sr-alt-marked-dir-face
    ((,class (:background ,anti-darkokai-magenta
                          :foreground ,anti-darkokai-bg
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-magenta
                                   :foreground ,terminal-anti-darkokai-bg
                                   :weight bold))))

  `(sr-alt-marked-file-face
    ((,class (:background ,anti-darkokai-magenta
                          :foreground ,anti-darkokai-bg
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-magenta
                                   :foreground ,terminal-anti-darkokai-bg
                                   :weight bold))))

  ;; sunrise commander fstat
  `(sr-directory-face
    ((,class (:inherit dianti-darkokai-red-directory
                       :weight normal))
     (,terminal-class (:inherit dianti-darkokai-red-directory
                                :weight normal))))

  `(sr-symlink-directory-face
    ((,class (:inherit dianti-darkokai-red-directory
                       :slant italic
                       :weight normal))
     (,terminal-class (:inherit dianti-darkokai-red-directory
                                :slant italic
                                :weight normal))))

  `(sr-symlink-face
    ((,class (:inherit dianti-darkokai-red-symlink
                       :slant italic
                       :weight normal))
     (,terminal-class (:inherit dianti-darkokai-red-symlink
                                :slant italic
                                :weight normal))))

  `(sr-broken-link-face
    ((,class (:inherit dianti-darkokai-red-warning
                       :slant italic
                       :weight normal))
     (,terminal-class (:inherit dianti-darkokai-red-warning
                                :slant italic
                                :weight normal))))

  ;; sunrise commander file types
  `(sr-compressed-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(sr-encrypted-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(sr-log-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(sr-packaged-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(sr-html-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(sr-xml-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  ;; sunrise commander misc
  `(sr-clex-hotchar-face
    ((,class (:background ,anti-darkokai-red
                          :foreground ,anti-darkokai-bg
                          :weight bold))
     (,terminal-class (:background ,terminal-anti-darkokai-red
                                   :foreground ,terminal-anti-darkokai-bg
                                   :weight bold))))

  ;; syslog-mode
  `(syslog-ip-face
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-yellow))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-yellow))))

  `(syslog-hour-face
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-green))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-green))))

  `(syslog-error-face
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-red
                          :weight bold))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-red
                                   :weight bold))))

  `(syslog-warn-face
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-orange
                          :weight bold))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-orange
                                   :weight bold))))

  `(syslog-info-face
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-blue
                          :weight bold))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-blue
                                   :weight bold))))

  `(syslog-debug-face
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-cyan
                          :weight bold))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-cyan
                                   :weight bold))))

  `(syslog-su-face
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-magenta))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-magenta))))

  ;; table
  `(table-cell
    ((,class (:foreground ,anti-darkokai-fg
                          :background ,anti-darkokai-highlight-line))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :background ,terminal-anti-darkokai-highlight-line))))

  ;; term
  `(term-color-black
    ((,class (:foreground ,anti-darkokai-bg
                          :background ,anti-darkokai-highlight-line))
     (,terminal-class (:foreground ,terminal-anti-darkokai-bg
                                   :background ,terminal-anti-darkokai-highlight-line))))

  `(term-color-red
    ((,class (:foreground ,anti-darkokai-red
                          :background ,anti-darkokai-red-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red
                                   :background ,terminal-anti-darkokai-red-d))))

  `(term-color-green
    ((,class (:foreground ,anti-darkokai-green
                          :background ,anti-darkokai-green-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :background ,terminal-anti-darkokai-green-d))))

  `(term-color-yellow
    ((,class (:foreground ,anti-darkokai-yellow
                          :background ,anti-darkokai-yellow-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :background ,terminal-anti-darkokai-yellow-d))))

  `(term-color-blue
    ((,class (:foreground ,anti-darkokai-blue
                          :background ,anti-darkokai-blue-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :background ,terminal-anti-darkokai-blue-d))))

  `(term-color-magenta
    ((,class (:foreground ,anti-darkokai-magenta
                          :background ,anti-darkokai-magenta-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta
                                   :background ,terminal-anti-darkokai-magenta-d))))

  `(term-color-cyan
    ((,class (:foreground ,anti-darkokai-cyan
                          :background ,anti-darkokai-cyan-d))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :background ,terminal-anti-darkokai-cyan-d))))

  `(term-color-white
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-fg))))

  `(term-default-fg-color
    ((,class (:inherit term-color-white))
     (,terminal-class (:inherit term-color-white))))

  `(term-default-bg-color
    ((,class (:inherit term-color-black))
     (,terminal-class (:inherit term-color-black))))

  ;; tooltip. (NOTE: This setting has no effect on the os widgets for me
  ;; zencoding uses this)
  `(tooltip
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-yellow
                          :inherit ,s-variable-pitch))))

  ;; tuareg
  `(tuareg-font-lock-governing-face
    ((,class (:foreground ,anti-darkokai-magenta
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta
                                   :weight bold))))

  `(tuareg-font-lock-multistage-face
    ((,class (:foreground ,anti-darkokai-blue
                          :background ,anti-darkokai-highlight-line
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :background ,terminal-anti-darkokai-highlight-line
                                   :weight bold))))

  `(tuareg-font-lock-operator-face
    ((,class (:foreground ,anti-darkokai-emph))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph))))

  `(tuareg-font-lock-error-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :background ,anti-darkokai-red
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :background ,terminal-anti-darkokai-red
                                   :weight bold))))

  `(tuareg-font-lock-interactive-output-face
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(tuareg-font-lock-interactive-error-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  ;; undo-tree
  `(undo-tree-visualizer-default-face
    ((,class (:foreground ,anti-darkokai-comments
                          :background ,anti-darkokai-bg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :background ,terminal-anti-darkokai-bg))))

  `(undo-tree-visualizer-unmodified-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(undo-tree-visualizer-current-face
    ((,class (:foreground ,anti-darkokai-blue
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :inverse-video t))))

  `(undo-tree-visualizer-active-branch-face
    ((,class (:foreground ,anti-darkokai-emph
                          :background ,anti-darkokai-bg
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :background ,terminal-anti-darkokai-bg
                                   :weight bold))))

  `(undo-tree-visualizer-register-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  ;; volatile highlights
  `(vhl/default-face
    ((,class (:background ,anti-darkokai-green-lc
                          :foreground ,anti-darkokai-green-hc))
     (,terminal-class (:background ,terminal-anti-darkokai-green-lc
                                   :foreground ,terminal-anti-darkokai-green-hc))))

  ;; w3m
  `(w3m-anchor
    ((,class (:inherit link))
     (,terminal-class (:inherit link))))

  `(w3m-arrived-anchor
    ((,class (:inherit link-visited))
     (,terminal-class (:inherit link-visited))))

  `(w3m-form
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(w3m-header-line-location-title
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-yellow))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-yellow))))

  `(w3m-header-line-location-content

    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(w3m-bold
    ((,class (:foreground ,anti-darkokai-emph
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :weight bold))))

  `(w3m-image-anchor
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-cyan
                          :inherit link))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-cyan
                                   :inherit link))))

  `(w3m-image
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-cyan))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-cyan))))

  `(w3m-lnum-minibuffer-prompt
    ((,class (:foreground ,anti-darkokai-emph))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph))))

  `(w3m-lnum-match
    ((,class (:background ,anti-darkokai-highlight-line))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line))))

  `(w3m-lnum
    ((,class (:underline nil
                         :bold nil
                         :foreground ,anti-darkokai-red))
     (,terminal-class (:underline nil
                                  :bold nil
                                  :foreground ,terminal-anti-darkokai-red))))

  `(w3m-session-select
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(w3m-session-selected
    ((,class (:foreground ,anti-darkokai-emph
                          :bold t
                          :underline t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :bold t
                                   :underline t))))

  `(w3m-tab-background
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(w3m-tab-selected-background
    ((,class (:background ,anti-darkokai-bg
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-bg
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(w3m-tab-mouse
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-yellow))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-yellow))))

  `(w3m-tab-selected
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-emph
                          :bold t))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-emph
                                   :bold t))))

  `(w3m-tab-unselected
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-fg))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-fg))))

  `(w3m-tab-selected-retrieving
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-red))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-red))))

  `(w3m-tab-unselected-retrieving
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-orange))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-orange))))

  `(w3m-tab-unselected-unseen
    ((,class (:background ,anti-darkokai-highlight-line
                          :foreground ,anti-darkokai-violet))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :foreground ,terminal-anti-darkokai-violet))))

  ;; web-mode
  `(web-mode-builtin-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(web-mode-comment-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  `(web-mode-constant-face
    ((,class (:foreground ,anti-darkokai-blue
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :weight bold))))

  `(web-mode-current-element-highlight-face
    ((,class (:underline unspecified
                         :weight unspecified
                         :background ,anti-darkokai-highlight-line))
     (,terminal-class (:underline unspecified
                                  :weight unspecified
                                  :background ,terminal-anti-darkokai-highlight-line))))

  `(web-mode-css-at-rule-face
    ((,class (:foreground ,anti-darkokai-violet
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet
                                   :slant italic))))

  `(web-mode-css-pseudo-class-face
    ((,class (:foreground ,anti-darkokai-green
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :slant italic))))

  `(web-mode-doctype-face
    ((,class (:foreground ,anti-darkokai-comments
                          :slant italic
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :slant italic
                                   :weight bold))))

  `(web-mode-folded-face
    ((,class (:underline t))
     (,terminal-class (:underline t))))

  `(web-mode-function-name-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(web-mode-html-attr-name-face
    ((,class (:foreground ,anti-darkokai-blue
                          :slant normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue
                                   :slant normal))))

  `(web-mode-html-attr-value-face
    ((,class (:foreground ,anti-darkokai-cyan
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan
                                   :slant italic))))

  `(web-mode-html-tag-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(web-mode-keyword-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :weight normal))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :weight normal))))

  `(web-mode-preprocessor-face
    ((,class (:foreground ,anti-darkokai-yellow
                          :slant normal
                          :weight unspecified))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow
                                   :slant normal
                                   :weight unspecified))))

  `(web-mode-string-face
    ((,class (:foreground ,anti-darkokai-cyan))
     (,terminal-class (:foreground ,terminal-anti-darkokai-cyan))))

  `(web-mode-type-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(web-mode-variable-name-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(web-mode-warning-face
    ((,class (:inherit font-lock-warning-face))
     (,terminal-class (:inherit font-lock-warning-face))))

  `(web-mode-block-attr-name-face
    ((,class (:inherit web-mode-html-attr-name-face))
     (,terminal-class (:inherit web-mode-html-attr-name-face))))

  `(web-mode-block-attr-value-face
    ((,class (:inherit web-mode-html-attr-value-face))
     (,terminal-class (:inherit web-mode-html-attr-value-face))))

  `(web-mode-block-comment-face
    ((,class (:inherit web-mode-comment-face))
     (,terminal-class (:inherit web-mode-comment-face))))

  `(web-mode-block-control-face
    ((,class (:inherit font-lock-preprocessor-face))
     (,terminal-class (:inherit font-lock-preprocessor-face))))

  `(web-mode-block-face
    ((,class (:background unspecified))
     (,terminal-class (:background unspecified))))

  `(web-mode-block-string-face
    ((,class (:inherit web-mode-string-face))
     (,terminal-class (:inherit web-mode-string-face))))

  `(web-mode-comment-keyword-face
    ((,class (:box 1
                   :weight bold))
     (,terminal-class (:box 1
                            :weight bold))))

  `(web-mode-css-color-face
    ((,class (:inherit font-lock-builtin-face))
     (,terminal-class (:inherit font-lock-builtin-face))))

  `(web-mode-css-function-face
    ((,class (:inherit font-lock-builtin-face))
     (,terminal-class (:inherit font-lock-builtin-face))))

  `(web-mode-css-priority-face
    ((,class (:inherit font-lock-builtin-face))
     (,terminal-class (:inherit font-lock-builtin-face))))

  `(web-mode-css-property-name-face
    ((,class (:inherit font-lock-variable-name-face))
     (,terminal-class (:inherit font-lock-variable-name-face))))

  `(web-mode-css-selector-face
    ((,class (:inherit font-lock-keyword-face))
     (,terminal-class (:inherit font-lock-keyword-face))))

  `(web-mode-css-string-face
    ((,class (:inherit web-mode-string-face))
     (,terminal-class (:inherit web-mode-string-face))))

  `(web-mode-javascript-string-face
    ((,class (:inherit web-mode-string-face))
     (,terminal-class (:inherit web-mode-string-face))))

  `(web-mode-json-context-face
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(web-mode-json-key-face
    ((,class (:foreground ,anti-darkokai-violet))
     (,terminal-class (:foreground ,terminal-anti-darkokai-violet))))

  `(web-mode-json-string-face
    ((,class (:inherit web-mode-string-face))
     (,terminal-class (:inherit web-mode-string-face))))

  `(web-mode-param-name-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(web-mode-part-comment-face
    ((,class (:inherit web-mode-comment-face))
     (,terminal-class (:inherit web-mode-comment-face))))

  `(web-mode-part-face
    ((,class (:inherit web-mode-block-face))
     (,terminal-class (:inherit web-mode-block-face))))

  `(web-mode-part-string-face
    ((,class (:inherit web-mode-string-face))
     (,terminal-class (:inherit web-mode-string-face))))

  `(web-mode-symbol-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(web-mode-whitespace-face
    ((,class (:background ,anti-darkokai-red))
     (,terminal-class (:background ,terminal-anti-darkokai-red))))

  ;; whitespace-mode
  `(whitespace-space
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-comments
                          :inverse-video unspecified
                          :slant italic))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-comments
                                   :inverse-video unspecified
                                   :slant italic))))

  `(whitespace-hspace
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-emph
                          :inverse-video unspecified))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-emph
                                   :inverse-video unspecified))))

  `(whitespace-tab
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-red
                          :inverse-video unspecified
                          :weight bold))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-red
                                   :inverse-video unspecified
                                   :weight bold))))

  `(whitespace-newline
    ((,class(:background unspecified
                         :foreground ,anti-darkokai-comments
                         :inverse-video unspecified))
     (,terminal-class(:background unspecified
                                  :foreground ,terminal-anti-darkokai-comments
                                  :inverse-video unspecified))))

  `(whitespace-trailing
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-orange-lc
                          :inverse-video t))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-orange-lc
                                   :inverse-video t))))

  `(whitespace-line
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-magenta
                          :inverse-video unspecified))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-magenta
                                   :inverse-video unspecified))))

  `(whitespace-space-before-tab
    ((,class (:background ,anti-darkokai-red-lc
                          :foreground unspecified
                          :inverse-video unspecified))
     (,terminal-class (:background ,terminal-anti-darkokai-red-lc
                                   :foreground unspecified
                                   :inverse-video unspecified))))

  `(whitespace-indentation
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-yellow
                          :inverse-video unspecified
                          :weight bold))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-yellow
                                   :inverse-video unspecified
                                   :weight bold))))

  `(whitespace-empty
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-red-lc
                          :inverse-video t))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-red-lc
                                   :inverse-video t))))

  `(whitespace-space-after-tab
    ((,class (:background unspecified
                          :foreground ,anti-darkokai-orange
                          :inverse-video t
                          :weight bold))
     (,terminal-class (:background unspecified
                                   :foreground ,terminal-anti-darkokai-orange
                                   :inverse-video t
                                   :weight bold))))

  ;; wanderlust
  `(wl-highlight-folder-few-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(wl-highlight-folder-many-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(wl-highlight-folder-path-face
    ((,class (:foreground ,anti-darkokai-orange))
     (,terminal-class (:foreground ,terminal-anti-darkokai-orange))))

  `(wl-highlight-folder-unread-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(wl-highlight-folder-zero-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(wl-highlight-folder-unknown-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(wl-highlight-message-citation-header
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(wl-highlight-message-cited-text-1
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(wl-highlight-message-cited-text-2
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(wl-highlight-message-cited-text-3
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(wl-highlight-message-cited-text-4
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(wl-highlight-message-header-contents-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(wl-highlight-message-headers-face
    ((,class (:foreground ,anti-darkokai-red))
     (,terminal-class (:foreground ,terminal-anti-darkokai-red))))

  `(wl-highlight-message-important-header-contents
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(wl-highlight-message-header-contents
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(wl-highlight-message-important-header-contents2
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(wl-highlight-message-signature
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  `(wl-highlight-message-unimportant-header-contents
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(wl-highlight-summary-answeanti-darkokai-red-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(wl-highlight-summary-disposed-face
    ((,class (:foreground ,anti-darkokai-fg
                          :slant italic))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg
                                   :slant italic))))

  `(wl-highlight-summary-new-face
    ((,class (:foreground ,anti-darkokai-blue))
     (,terminal-class (:foreground ,terminal-anti-darkokai-blue))))

  `(wl-highlight-summary-normal-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(wl-highlight-summary-thread-top-face
    ((,class (:foreground ,anti-darkokai-yellow))
     (,terminal-class (:foreground ,terminal-anti-darkokai-yellow))))

  `(wl-highlight-thread-indent-face
    ((,class (:foreground ,anti-darkokai-magenta))
     (,terminal-class (:foreground ,terminal-anti-darkokai-magenta))))

  `(wl-highlight-summary-refiled-face
    ((,class (:foreground ,anti-darkokai-fg))
     (,terminal-class (:foreground ,terminal-anti-darkokai-fg))))

  `(wl-highlight-summary-displaying-face
    ((,class (:underline t
                         :weight bold))
     (,terminal-class (:underline t
                                  :weight bold))))

  ;; weechat
  `(weechat-error-face
    ((,class (:inherit error))
     (,terminal-class (:inherit error))))

  `(weechat-highlight-face
    ((,class (:foreground ,anti-darkokai-emph
                          :weight bold))
     (,terminal-class (:foreground ,terminal-anti-darkokai-emph
                                   :weight bold))))

  `(weechat-nick-self-face
    ((,class (:foreground ,anti-darkokai-green
                          :weight unspecified
                          :inverse-video t))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green
                                   :weight unspecified
                                   :inverse-video t))))

  `(weechat-prompt-face
    ((,class (:inherit minibuffer-prompt))
     (,terminal-class (:inherit minibuffer-prompt))))

  `(weechat-time-face
    ((,class (:foreground ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments))))

  ;; which-func-mode
  `(which-func
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  ;; window-number-mode
  `(window-number-face
    ((,class (:foreground ,anti-darkokai-green))
     (,terminal-class (:foreground ,terminal-anti-darkokai-green))))

  ;; yascroll
  `(yascroll:thumb-text-area
    ((,class (:foreground ,anti-darkokai-comments
                          :background ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :background ,terminal-anti-darkokai-comments))))

  `(yascroll:thumb-fringe
    ((,class (:foreground ,anti-darkokai-comments
                          :background ,anti-darkokai-comments))
     (,terminal-class (:foreground ,terminal-anti-darkokai-comments
                                   :background ,terminal-anti-darkokai-comments))))

  ;; zencoding
  `(zencoding-preview-input
    ((,class (:background ,anti-darkokai-highlight-line
                          :box ,anti-darkokai-emph))
     (,terminal-class (:background ,terminal-anti-darkokai-highlight-line
                                   :box ,terminal-anti-darkokai-emph)))))

 (custom-theme-set-variables
  'anti-darkokai
  `(ansi-color-names-vector [,anti-darkokai-bg ,anti-darkokai-red ,anti-darkokai-green ,anti-darkokai-yellow
                                               ,anti-darkokai-blue ,anti-darkokai-magenta ,anti-darkokai-cyan ,anti-darkokai-fg])

  ;; compilation
  `(compilation-message-face 'default)

  ;; fill-column-indicator
  `(fci-rule-color ,anti-darkokai-highlight-line)

  ;; magit
  `(magit-diff-use-overlays nil)

  ;; highlight-changes
  `(highlight-changes-colors '(,anti-darkokai-magenta ,anti-darkokai-violet))

  ;; highlight-tail
  `(highlight-tail-colors
    '((,anti-darkokai-highlight-line . 0)
      (,anti-darkokai-green-lc . 20)
      (,anti-darkokai-cyan-lc . 30)
      (,anti-darkokai-blue-lc . 50)
      (,anti-darkokai-yellow-lc . 60)
      (,anti-darkokai-orange-lc . 70)
      (,anti-darkokai-magenta-lc . 85)
      (,anti-darkokai-highlight-line . 100)))

  ;; pos-tip
  `(pos-tip-foreground-color ,anti-darkokai-bg)
  `(pos-tip-background-color ,anti-darkokai-yellow)

  ;; vc
  `(vc-annotate-color-map
    '((20 . ,anti-darkokai-red)
      (40 . "#30B0E0")
      (60 . "#3D93F0")
      (80 . ,anti-darkokai-yellow)
      (100 . "#5473FF")
      (120 . "#5E70FF")
      (140 . "#676DFF")
      (160 . "#716AFF")
      (180 . ,anti-darkokai-green)
      (200 . "#8D65E1")
      (220 . "#9F63C3")
      (240 . "#B162A4")
      (260 . "#C36086")
      (280 . ,anti-darkokai-cyan)
      (300 . "#D66459")
      (320 . "#D7694A")
      (340 . "#D86F3C")
      (360 . ,anti-darkokai-blue)))
  `(vc-annotate-very-old-color nil)
  `(vc-annotate-background nil)

  ;; weechat
  `(weechat-color-list
    (unspecified ,anti-darkokai-bg ,anti-darkokai-highlight-line
                 ,anti-darkokai-red-d ,anti-darkokai-red
                 ,anti-darkokai-green-d ,anti-darkokai-green
                 ,anti-darkokai-yellow-d ,anti-darkokai-yellow
                 ,anti-darkokai-blue-d ,anti-darkokai-blue
                 ,anti-darkokai-magenta-d ,anti-darkokai-magenta
                 ,anti-darkokai-cyan-d ,anti-darkokai-cyan
                 ,anti-darkokai-fg ,anti-darkokai-emph))))

;;;#AUTOLOAD
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'anti-darkokai)

;; Local Variables:
;; no-byte-compile: t
;; fill-column: 95
;; End:

;;; anti-darkokai-theme.el ends here
