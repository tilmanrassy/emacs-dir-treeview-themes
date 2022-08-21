#! /bin/bash

readonly base_dir=$(pwd)
readonly thirdparty_dir="thirdparty"

readonly oxygen_pkg="oxygen-icons5-5.95.0"
readonly oxygen_url="https://github.com/KDE/oxygen-icons5"
readonly oxygen_download_url="${oxygen_url}/archive/refs/tags/v5.95.0.tar.gz"

readonly emerald_pkg="emerald-icon-theme"
readonly emerald_commit_id="e2d35203b447e428b68be44421f54765d62b4929"
readonly emerald_url="https://github.com/vinceliuice/emerald-icon-theme"
readonly emerald_clone_url="https://github.com/vinceliuice/emerald-icon-theme.git"

readonly faenza_pkg="faenza-icon-theme"
readonly faenza_url="https://github.com/shlinux/faenza-icon-theme"
readonly faenza_clone_url="https://github.com/shlinux/faenza-icon-theme.git"
readonly faenza_commit_id="f361c7ecef7286e8785544567ae8be6fa2a723ec"

readonly tela_pkg="tela-icon-theme-2022-02-21"
readonly tela_url="https://github.com/vinceliuice/Tela-icon-theme"
readonly tela_download_url="https://github.com/vinceliuice/Tela-icon-theme/archive/refs/tags/2022-02-21.zip"

readonly known_themes="\
  hortensia
  petunia
"

function error
{
  echo "ERROR: $*" >&2
  exit 1
} 

function download_oxygen
{
  cd "$thirdparty_dir"
  rm -rf "$oxygen_pkg" "${oxygen_pkg}.tgz"
  wget -O "${oxygen_pkg}.tgz" "$oxygen_download_url" || error "Downloading Oxygen icons failed"
  tar xzvf "${oxygen_pkg}.tgz" || error "Extracting Oxygen icons failed"
  rm -f "${oxygen_pkg}.tgz"
  cd "$base_dir"
}

function download_emerald
{
  cd "$thirdparty_dir"
  rm -rf "$emerald_pkg"
  git clone "$emerald_clone_url"
  cd "$emerald_pkg"
  git checkout "$emerald_commit_id"
  cd "$base_dir"
}

function download_faenza
{
  cd "$thirdparty_dir"
  rm -rf "$faenza_pkg"
  git clone "$faenza_clone_url"
  cd "$faenza_pkg"
  git checkout "$faenza_commit_id"
  cd "$base_dir"
}

function download_tela
{
  cd "$thirdparty_dir"
  rm -rf "$tela_pkg" "${tela_pkg}.zip"
  wget -O "${tela_pkg}.zip" "$tela_download_url" || error "Downloading Tela icons failed"
  unzip "${tela_pkg}.zip" || error "Extracting Tela icons failed"
  mv "Tela-icon-theme-2022-02-21" "$tela_pkg"
  rm -f "${tela_pkg}.zip"
  cd "$base_dir"
}

function theme_exists
{
  local theme="$1"
  echo "$known_themes" | grep -Fwq "$theme"
}

function get_icondef_file
{
  local theme="$1"
  local icondef_file="${theme}_icondef.txt"
  [ -e "$icondef_file" ] || error "Missing file \"${icondef_file}\""
  echo "$icondef_file"
}

function get_target_icon_dir
{
  local theme="$1"
  echo "../icons/${theme}"
}

function get_pkg_root
{
  local pkg="$1"
  case "$pkg" in
    oxygen) echo "${thirdparty_dir}/${oxygen_pkg}" ;;
    emerald) echo "${thirdparty_dir}/${emerald_pkg}" ;;
    faenza) echo "${thirdparty_dir}/${faenza_pkg}" ;;
    tela) echo "${thirdparty_dir}/${tela_pkg}" ;;
    *) error "Unknown package: ${pkg}" ;;
  esac
}

function create_icon
{
  local theme="$1" name="$2" pkg="$3" path="$4"
  echo
  echo "$name"
  local src_icon_path="$(get_pkg_root "$pkg")/${path}"
  local trg_icon_path="$(get_target_icon_dir "$theme")/${name}"
  local suff="${path##*.}" # Suffix, withou dot, e.g. "svg", "svgz"
  local temp_icon="temp_icon.${suff}"
  cp "$src_icon_path" "$temp_icon"
  shift 4
  while [ "$1" ] ; do
    local transf="$1"
    shift
    echo "$transf"
    case "$transf" in
      svg_to_png)
        [[ $temp_icon =~ \.svgz?$ ]] || error "Not an svg image"
        inkscape -w 16 -h 16 -o "temp_icon.png" "$temp_icon" || error "svg_to_png failed"
        rm "$temp_icon"
        temp_icon="temp_icon.png" ;;
      change_bgcolor)
        xsltproc -o "temp_icon_out.svg" "${theme}_${transf}.xsl" "$temp_icon" || error "change_bgcolor failed"
        rm "$temp_icon"
        mv "temp_icon_out.svg" "temp_icon.svg"
        temp_icon="temp_icon.svg" ;;
      text_js_to_el|text_js_to_elc|text_c_to_o)
        rm "$temp_icon"
        cp "prebuild/${pkg}/${name%.*}.svg" "temp_icon.svg"
        temp_icon="temp_icon.svg" ;;
      *) error "Unknown transformation: ${transf}"
    esac
  done
  mv "$temp_icon" "$trg_icon_path"
}

function create_icons
{
  local theme="$1"
  local icondef_file=$(get_icondef_file "$theme")
  local target_icon_dir=$(get_target_icon_dir "$theme")
  rm -rf "$target_icon_dir"
  mkdir -p "$target_icon_dir"
  local icondef
  while read icondef ; do
    [ "$icondef" ] || continue
    echo "$icondef" | egrep -q '[[:space:]]*#' && continue
    create_icon "$theme" $icondef
  done < "$icondef_file"
}

function get_all_pkgs
{
  local icondef_file="$1"
  sed -e '/^[[:space:]]*#/d' -e '/^[[:space:]]*$/d' "$icondef_file" | awk '{print $2}' | sort | uniq  
}

function get_pkg_short_name
{
  local pkg="$1"
  case "$pkg" in
    oxygen) echo "Oxygen" ;;
    emerald) echo "Emerald" ;;
    faenza) echo "Feanza" ;;
    tela) echo "Tela" ;;
    *)
      error "Unknown source package: ${pkg}" ;;
  esac  
}

function get_pkg_description
{
  local pkg="$1"
  case "$pkg" in
    oxygen)
      echo "\
Oxygen icon theme v5.95.0 (\"Oxygen\" for short in the following)
Project page: ${oxygen_url}
Downloaded from GitHub
Download URL: ${oxygen_download_url}
License: LGPL (GNU Lesser General Public License) v3, 29 June 2007" ;;
    emerald)
      echo "\
Emerald icon theme (\"Emerald\" for short in the following)
Project page: ${emerald_url}
Cloned from GitHUb
Clone URL: ${emerald_url}
Commit ID: ${emerald_commit_id}
License: CC BY-SA (Creative Commons Attribution-ShareAlike) v4.0" ;;
    faenza)
      echo "\
Faenza icon theme (\"Faenza\" for short in the following)
Project page: ${faenza_url}
Cloned from GitHUb
Clone URL: ${faenza_url}
Commit ID: ${faenza_commit_id}
License: GPL (GNU General Public License) v3, 29 June 2007" ;;
    tela)
      echo "\
Tela icon theme (\"Tela\" for short in the following)
Project page: ${tela_url}
Downloaded from GitHub
Download URL: ${tela_download_url}
(corresponds to git tag 2022-02-21)
License: GPL (GNU General Public License) v3, 29 June 2007" ;;
    *)
      error "Unknown source package: ${pkg}" ;;
  esac  
}

function create_icon_src_description
{
  local name="$1" pkg="$2" path="$3"
  echo "${name}"
  echo "    Source package: $(get_pkg_short_name "$pkg")"
  echo "    Source icon: ${path}"
  echo -n "    Modifications:"
  shift 3
  if [ "$1" ] ; then
    while [ "$1" ] ; do
      local transf="$1"
      case "$transf" in
        svg_to_png)
          echo -n " converted to PNG" ;;
        change_bgcolor)
          echo -n " changed background color" ;;
        text_js_to_el|text_js_to_elc)
          echo -n " replaced text \"js\" by \"${transf#text_js_to_}\"" ;;
        text_c_to_o)
          echo -n " replaced text \"c\" by \"o\"" ;;
        *)
          error  "No description for transformation \"${transf}\""
      esac
      shift
      [ "$1" ] && echo -n ","
    done
    echo
  else
    echo " none"
  fi
}

function create_readme
{
  local theme="$1"
  local icondef_file=$(get_icondef_file "$theme")
  local pks=$(get_all_pkgs "$icondef_file")
  local pkg_count=$(echo "$pks" | wc -w)

  if [ "$pkg_count" -eq 1 ] ; then
    echo "The icons in this folder are based on the icons of the following package:"
  else
    echo "The icons in this folder are based on the icons of the following packages:"
  fi

  local pkg
  for pkg in $pks ; do
    echo
    get_pkg_description "$pkg"
  done

  echo
  echo "Here is a complete list of all icons and their sources:"
  
  local icondef
  while read icondef ; do
    [ "$icondef" ] || continue
    echo "$icondef" | egrep -q '[[:space:]]*#' && continue
    echo
    create_icon_src_description $icondef
  done < "$icondef_file"

  echo
}

function write_readme
{
  local theme="$1"
  local readme_file="$(get_target_icon_dir "$theme")/README.txt"
  create_readme "$theme" > "$readme_file"
}


show_help=""
params=$(getopt --options h --longoptions help -- "$@") || error "Failed to parse command line"
eval set -- "$params"
while [ "$1" ] ; do
  case "$1" in
    --help|-h) show_help="show_help" ; shift ;;
    --) shift ; break ;;
  esac
done

if [ "$show_help" ] ; then
  cat <<EOF
Usage:
  ./build.sh {TARGET|--help|-h}
Description:
  Executes a build target. See the list of targets below.
Targets:
  thirdparty
      Downloads the required third-party packages from the internet
  hortensia-icons
      Creates the hortensia icons
  petunia-icons
      Creates the petunia icons
Options:
  -h, --help
      Prints this help text and exits.
EOF
  exit
fi

target="$1"
[ "$1" ] || error "No target specified"
shift
[ "$*" ] && error "Extra parameter(s): $*"

case "$target" in
  thirdparty)
    download_oxygen
    download_emerald
    download_faenza
    download_tela ;;
  *-icons)
    theme="${target%-icons}"
    theme_exists "$theme" || error "Unknown theme: ${theme}"
    create_icons "$theme"
    write_readme "$theme" ;;
  *)
    error "Unknown target: ${target}"
esac
