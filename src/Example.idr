module Main

import GTK
import GTK.Utils

-- reference: https://zetcode.com/gui/gtk2/

tooltip_test : IO ()
tooltip_test = do
  primIO $ gtk_init nullptr nullptr
  -- make window
  window <- primIO $ gtk_window_new GTK_WINDOW_TOPLEVEL
  primIO $ gtk_window_set_title window "Tooltip Test"
  primIO $ gtk_container_set_border_width window 15
  primIO $ gtk_window_set_default_size window 300 200
  _ <- primIO $ g_signal_connect_data (to_object window) "destroy" gtk_main_quit nullanyptr 0 (\_, _ => prim__io_pure ())
  -- make button
  button <- primIO $ gtk_button_new_with_mnemonic "B_utton"
  primIO $ gtk_widget_set_halign button GTK_ALIGN_START
  primIO $ gtk_widget_set_valign button GTK_ALIGN_START
  primIO $ gtk_widget_set_tooltip_text button "why"
  primIO $ gtk_container_add window button
  -- main
  primIO $ gtk_widget_show_all window
  primIO $ gtk_main

simple_menu : IO ()
simple_menu = do
  primIO $ gtk_init nullptr nullptr
  -- make window
  window <- primIO $ gtk_window_new GTK_WINDOW_TOPLEVEL
  primIO $ gtk_window_set_title window "Simple Menu"
  primIO $ gtk_window_set_position window GTK_WIN_POS_CENTER -- must be before set_default_size or else the size will shrink
  primIO $ gtk_window_set_default_size window 300 200
  _ <- primIO $ g_signal_connect_data (to_object window) "destroy" gtk_main_quit nullanyptr 0 (\_, _ => prim__io_pure ())
  -- make vbox
  vbox <- primIO $ gtk_vbox_new false 0
  primIO $ gtk_container_add window vbox
  -- menu
  menu_bar <- primIO $ gtk_menu_bar_new
  file_menu <- primIO $ gtk_menu_new
  file_menu_item <- primIO $ gtk_menu_item_new_with_label "File"
  quit_menu_item <- primIO $ gtk_menu_item_new_with_label "Quit"

  primIO $ gtk_menu_item_set_submenu file_menu_item file_menu
  primIO $ gtk_menu_shell_append file_menu quit_menu_item
  primIO $ gtk_menu_shell_append menu_bar file_menu_item
  primIO $ gtk_box_pack_start vbox menu_bar false false 0

  _ <- primIO $ g_signal_connect_data (to_object window) "destroy" gtk_main_quit nullanyptr 0 (\_, _ => prim__io_pure ())
  _ <- primIO $ g_signal_connect_data (to_object quit_menu_item) "activate" gtk_main_quit nullanyptr 0 (\_, _ => prim__io_pure ())

  -- main
  primIO $ gtk_widget_show_all window
  primIO $ gtk_main
