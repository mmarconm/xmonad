import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import XMonad.Layout.Spacing
import XMonad.Hooks.EwmhDesktops
import XMonad.ManageHook

myLayout = avoidStruts $ spacingRaw True (Border 0 2 2 2) True (Border 5 5 5 5) True $ layoutHook def

-- Creating new workspaces
myWorkspaces = ["1:web", "2:code", "3:term", "4:media", "5", "6", "7", "8", "9"]

myManageHook = composeAll
    [ className =? "Thunar" --> doShift "3:term" ]
    <+> manageHook def

main = xmonad $ ewmh $ docks def {
    workspaces = myWorkspaces
    , layoutHook = myLayout
    , manageHook = myManageHook -- Use seu manageHook personalizado aqui
    , startupHook = myStartupHook
    , terminal = "terminator"
    }
  where
    myStartupHook = do
      spawn "$HOME/.config/polybar/launch.sh"
