import XMonad
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig
import XMonad.Config.Gnome

main = xmonad $ gnomeConfig
	{ --modMask = mod4Mask
	  terminal = "urxvt"
    , focusFollowsMouse = False
	, layoutHook = ThreeColMid 1 (3/100) (1/3) ||| ThreeCol 1 (3/100) (1/3)
	}
    `additionalKeysP`
        [ ("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
        , ("M-S-l", spawn "gnome-screensaver-command -l")
        ]
