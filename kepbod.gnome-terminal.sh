#!/usr/bin/env bash
# kepbod - Gnome Terminal color scheme install script
# Xiao-Ou Zhang <kepbod@gmail.com>

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="kepbod"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="kepbod"
[[ -z "$GCONFTOOL" ]] && GCONFTOOL=gconftool
[[ -z "$BASE_KEY" ]] && BASE_KEY=/apps/gnome-terminal/profiles

PROFILE_KEY="$BASE_KEY/$PROFILE_SLUG"

gset() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  "$GCONFTOOL" --set --type "$type" "$PROFILE_KEY/$key" -- "$val"
}

# Because gconftool doesn't have "append"
glist_append() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  local entries="$(
    {
      "$GCONFTOOL" --get "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
      echo "$val"
    } | head -c-1 | tr "\n" ,
  )"

  "$GCONFTOOL" --set --type list --list-type $type "$key" "[$entries]"
}

# Append the kepbod profile to the profile list
glist_append string /apps/gnome-terminal/global/profile_list "$PROFILE_SLUG"

gset string visible_name "$PROFILE_NAME"
gset string palette "#227722882222:#ffbb99ffbb11:#aa66ee2222ee:#ffdd997711ff:#6666dd99eeff:#aaee8811ffff:#aa11eeffee44:#ff55ff44ff11:#338833883300:#ddeeaaff88ff:#aacccc226677:#ff44bbff7755:#66ffcc22eeff:#ee11aa33eeee:#1122ccffcc00:#ff99ff88ff55"
gset string background_color "#227722882222"
gset string foreground_color "#ff99ff88ff55"
gset string bold_color "#ff99ff88ff55"
gset bool bold_color_same_as_fg "true"
gset bool use_theme_colors "false"
gset bool use_theme_background "false"
