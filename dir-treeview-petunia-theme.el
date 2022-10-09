;;; dir-treeview-hortensia-theme.el --- A dir-treeview theme with icons based on the Emerald and Tela icon sets -*- lexical-binding: t -*-

;; Copyright (C) 2022 Tilman Rassy <tilman.rassy@googlemail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; A theme for the "dir-treeview" package.  Uses pixmap icons from the "Emerald"
;; and "Tela" icon themes (see https://github.com/vinceliuice/emerald-icon-theme
;; and https://github.com/vinceliuice/Tela-icon-theme, respectively).
;;
;; The theme is suitable for graphical displays only.  Thus, on text displays
;; all settings of the theme are ignored, and the theme has no effect.

;;; Code:

(deftheme dir-treeview-petunia
  "A dir-treeview theme with icons based on the Emerald and Tela icon sets.")
  
(custom-theme-set-variables
 'dir-treeview-petunia
 '(dir-treeview-icon-margin-right  " ")
 '(dir-treeview-default-icon                                 "image petunia/application-x-zerosize.png")
 '(dir-treeview-folded-dir-icon                              "image petunia/folder.png")
 '(dir-treeview-expanded-dir-icon                            "image petunia/folder-open.png")
 '(dir-treeview-special-icons
   '((dir-treeview-is-image-p                             .  "image petunia/image-x-generic.png")
     (dir-treeview-is-audio-p                             .  "image petunia/audio-x-generic.png")
     (dir-treeview-is-video-p                             .  "image petunia/video-x-generic.png")
     ("\\(?:\\.tar\\.\\(?:gz\\|bz2\\|xz\\)\\|\\.tgz\\)$"  .  "image petunia/application-x-compressed-tar.png")
     ("\\.gz$"                                            .  "image petunia/application-x-gzip.png")
     (dir-treeview-is-archive-p                           .  "image petunia/package-x-generic.png")
     (file-executable-p                                   .  "image petunia/application-x-executable.png")
     ("\\.pdf$"                                           .  "image petunia/application-pdf.png")
     ("\\.deb$"                                           .  "image petunia/application-x-deb.png")
     ("\\.rpm$"                                           .  "image petunia/application-x-rpm.png")
     ("\\.\\(?:afm\\|pfa\\)$"                             .  "image petunia/application-x-font-afm.png")
     ("\\.otf$"                                           .  "image petunia/application-x-font-otf.png")
     ("\\.ttf$"                                           .  "image petunia/application-x-font-ttf.png")
     ("\\.java$"                                          .  "image petunia/application-x-java.png")
     ("\\.jar$"                                           .  "image petunia/application-x-java-archive.png")
     ("\\.js$"                                            .  "image petunia/application-x-javascript.png")
     ("\\.pl$"                                            .  "image petunia/application-x-perl.png")
     ("\\.php$"                                           .  "image petunia/application-x-php.png")
     ("\\.\\(?:sh\\|bashrc\\)$"                           .  "image petunia/text-x-script.png")
     ("\\.so\\(?:\\.[0-9._-]\\)?$"                        .  "image petunia/application-x-sharedlib.png")
     ("\\.xml$"                                           .  "image petunia/text-xml.png")
     ("\\.html$"                                          .  "image petunia/text-html.png")
     ("\\.txt$"                                           .  "image petunia/text-plain.png")
     ("\\.\\(hpp\\|h++\\)$"                               .  "image petunia/text-x-c++hdr.png")
     ("\\.\\(cpp\\|c++\\)$"                               .  "image petunia/text-x-c++src.png")
     ("\\.h$"                                             .  "image petunia/text-x-chdr.png")
     ("\\.c$"                                             .  "image petunia/text-x-csrc.png")
     ("\\.o$"                                             .  "image petunia/application-x-cobj.png")
     ("\\.py$"                                            .  "image petunia/text-x-python-bytecode.png")
     ("\\.sql$"                                           .  "image petunia/application-x-opendoc-database.png")
     ("\\.tex$"                                           .  "image petunia/text-x-tex.png")
     ("\\.el$"                                            .  "image petunia/text-x-el.png")
     ("\\.elc$"                                           .  "image petunia/application-x-elc.png")
     ("\\.\\(?:odt\\|doc\\|docx\\)$"                      .  "image petunia/x-office-document.png")
     ("\\.\\(?:ods\\|xls\\|xlsx\\)$"                      .  "image petunia/x-office-spreadsheet.png")
     ("\\.\\(?:odp\\|pp|\\ppx\\)$"                        .  "image petunia/x-office-spreadsheet.png")
     ("\\.odg$"                                           .  "image petunia/x-office-drawing.png")
     )))

(custom-theme-set-faces
 'dir-treeview-petunia
 '(dir-treeview-control-face         ((((type graphic)) . (:foreground "gray40"))))
 '(dir-treeview-indent-face          ((((type graphic)) . (:foreground "gray40"))))
 '(dir-treeview-directory-face       ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-symlink-face         ((((type graphic)) . (:inherit dir-treeview-default-filename-face :slant italic))))
 '(dir-treeview-executable-face      ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-archive-face         ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-image-face           ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-audio-face           ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-video-face           ((((type graphic)) . (:inherit dir-treeview-default-filename-face)))))
  
;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'dir-treeview-petunia)
(provide 'dir-treeview-petunia-theme)
