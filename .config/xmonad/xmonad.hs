import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import XMonad.Layout.Spacing
import XMonad.Hooks.EwmhDesktops
import XMonad.ManageHook
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Actions.CycleWS (nextWS, prevWS)

myLayout = avoidStruts $ spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True $ layoutHook def
myWorkspaces = ["1:web", "2:code", "3:term", "4:media", "5", "6", "7", "8", "9"]

myManageHook = composeAll
    [ className =? "Thunar" --> doShift "3:term"
    , className =? "Code"   --> doShift "2:code"
    ] <+> manageHook def

myStartupHook = do
  spawn "$HOME/.config/polybar/launch.sh"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, xK_Right), nextWS)  -- Move to the next workspace
    , ((modm, xK_Left), prevWS)   -- Move to the previous workspace
    ]
    ++
    [((modm .|. mask, key), windows $ f i)
        | (i, key) <- zip myWorkspaces [xK_1 .. xK_9]
        , (f, mask) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]

main = xmonad $ ewmh $ docks def {
    workspaces = myWorkspaces,
    layoutHook = myLayout,
    manageHook = myManageHook,
    startupHook = myStartupHook,
    terminal = "terminator",
    keys = \c -> myKeys c `M.union` keys def c
}
