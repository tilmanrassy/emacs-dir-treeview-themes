;;; dir-treeview-themes.el --- Themes for dir-treeview -*- lexical-binding: t -*-

;; Copyright (C) 2022 Tilman Rassy

;; Author: Tilman Rassy <tilman.rassy@googlemail.com>
;; URL: https://github.com/tilmanrassy/emacs-dir-treeview-themes
;; Version: 1.0.1
;; Package-Requires: ((emacs "24.4") (dir-treeview "1.3.3"))
;; Keywords: tools, convenience, files

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

;; Themes for dir-treeview, a file browser and manager for Emacs
;; (cf. https://github.com/tilmanrassy/emacs-dir-treeview).

;; Provides two themes, "Hortensia" and "Petunia".
;; Visit https://github.com/tilmanrassy/emacs-dir-treeview-themes for
;; screenshots.

;; The themes use pixmap icons based on the "Oxygen", "Emerald", and "Tela" icon
;; themes (see https://github.com/KDE/oxygen-icons5,
;; https://github.com/vinceliuice/emerald-icon-theme, and
;; https://github.com/vinceliuice/Tela-icon-theme, respectively).

;;; Code:

;; Not much code here.  Most of the code is included in the theme files.

(require 'dir-treeview)

(dir-treeview-add-theme-dir-by-load-file-name)
(dir-treeview-add-icon-dir-by-load-file-name)
(dir-treeview-register-theme 'dir-treeview-themes-hortensia "Hortensia")
(dir-treeview-register-theme 'dir-treeview-themes-petunia "Petunia")

(provide 'dir-treeview-themes)

;;; dir-treeview-themes.el ends here
