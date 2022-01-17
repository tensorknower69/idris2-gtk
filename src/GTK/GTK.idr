module GTK.GTK

import GTK.Utils

libgtk : String -> String
libgtk fname = "C:\{fname},libgtk-3.so"

export
data GtkWidget : Type where

public export
GtkWindow, GtkBox, GtkContainer, GtkMenuItem, GtkMenuShell : Type
GtkWindow = GtkWidget
GtkBox = GtkWidget
GtkContainer = GtkWidget
GtkMenuItem = GtkWidget
GtkMenuShell = GtkWidget

public export
GtkWindowType : Type
GtkWindowType  = Int

public export
GTK_WINDOW_TOPLEVEL, GTK_WINDOW_POPUP : GtkWindowType
GTK_WINDOW_TOPLEVEL = 0
GTK_WINDOW_POPUP = 1

public export
GtkAlign : Type
GtkAlign = Int

public export
GTK_ALIGN_FILL, GTK_ALIGN_START, GTK_ALIGN_END, GTK_ALIGN_CENTER, GTK_ALIGN_BASELINE : GtkAlign
GTK_ALIGN_FILL = 0
GTK_ALIGN_START = 1
GTK_ALIGN_END = 2
GTK_ALIGN_CENTER = 3
GTK_ALIGN_BASELINE = 4

public export
GtkWindowPosition : Type
GtkWindowPosition = Int

public export
GTK_WIN_POS_NONE, GTK_WIN_POS_CENTER, GTK_WIN_POS_MOUSE, GTK_WIN_POS_CENTER_ALWAYS, GTK_WIN_POS_CENTER_ON_PARENT : GtkWindowPosition
GTK_WIN_POS_NONE = 0
GTK_WIN_POS_CENTER = 1
GTK_WIN_POS_MOUSE = 2
GTK_WIN_POS_CENTER_ALWAYS = 3
GTK_WIN_POS_CENTER_ON_PARENT = 4

-- gtk_window

export %foreign libgtk "gtk_window_new"
gtk_window_new : GtkWindowType -> PrimIO (Ptr GtkWidget)

export %foreign libgtk "gtk_window_set_title"
gtk_window_set_title : Ptr GtkWindow -> String -> PrimIO ()

export %foreign libgtk "gtk_window_set_default_size"
gtk_window_set_default_size : Ptr GtkWindow -> Int -> Int -> PrimIO ()

export %foreign libgtk "gtk_window_set_default_size"
gtk_window_set_position : Ptr GtkWindow -> GtkWindowPosition -> PrimIO ()

-- gtk_button

export %foreign libgtk "gtk_button_new_with_label"
gtk_button_new_with_label : String -> PrimIO (Ptr GtkWidget)

export %foreign libgtk "gtk_button_new_with_mnemonic"
gtk_button_new_with_mnemonic : String -> PrimIO (Ptr GtkWidget)

-- gtk_alignment

export %foreign libgtk "gtk_alignment_new"
gtk_alignment_new : (xalign : Int) -> (yalign : Int) -> (xscale : Int) -> (yscale : Int) -> PrimIO (Ptr GtkWidget)

-- gtk_container

export %foreign libgtk "gtk_container_add"
gtk_container_add : Ptr GtkContainer -> Ptr GtkWidget -> PrimIO ()

export %foreign libgtk "gtk_container_set_border_width"
gtk_container_set_border_width : Ptr GtkContainer -> Int -> PrimIO ()

-- gtk_menu

export %foreign libgtk "gtk_menu_new"
gtk_menu_new : PrimIO (Ptr GtkWidget)

-- gtk_menu_bar

export %foreign libgtk "gtk_menu_bar_new"
gtk_menu_bar_new : PrimIO (Ptr GtkWidget)

-- gtk_menu_shell

export %foreign libgtk "gtk_menu_shell_append"
gtk_menu_shell_append : Ptr GtkMenuShell -> (child : Ptr GtkWidget) -> PrimIO ()

-- gtk_menu_item

export %foreign libgtk "gtk_menu_item_new_with_label"
gtk_menu_item_new_with_label : (label : String) -> PrimIO (Ptr GtkWidget)

export %foreign libgtk "gtk_menu_item_set_submenu"
gtk_menu_item_set_submenu : Ptr GtkMenuItem -> Ptr GtkWidget -> PrimIO ()

-- gtk_seperator

export %foreign libgtk "gtk_separator_menu_item_new"
gtk_separator_menu_item_new : PrimIO (Ptr GtkWidget)


-- gtk_box

export %foreign libgtk "gtk_box_pack_start"
gtk_box_pack_start : Ptr GtkBox -> Ptr GtkWidget -> (expand : CBool) -> (fill : CBool) -> (padding : Int) -> PrimIO ()

-- gtk_vbox

export %foreign libgtk "gtk_vbox_new"
gtk_vbox_new : (homogeneous : CBool) -> (spacing : Int) -> PrimIO (Ptr GtkWidget)

-- gtk_widget

export %foreign libgtk "gtk_widget_set_tooltip_text"
gtk_widget_set_tooltip_text : Ptr GtkWidget -> String -> PrimIO ()

export %foreign libgtk "gtk_widget_set_halign"
gtk_widget_set_halign : Ptr GtkWidget -> GtkAlign -> PrimIO ()

export %foreign libgtk "gtk_widget_set_valign"
gtk_widget_set_valign : Ptr GtkWidget -> GtkAlign -> PrimIO ()

export %foreign libgtk "gtk_widget_show_all"
gtk_widget_show_all : Ptr GtkWidget -> PrimIO ()

export %foreign libgtk "gtk_widget_show"
gtk_widget_show : Ptr GtkWidget -> PrimIO ()

-- gtk_init

export %foreign libgtk "gtk_init"
gtk_init : (argc : Ptr Int) -> (argv : Ptr String) -> PrimIO ()

-- gtk_main

export %foreign libgtk "gtk_main"
gtk_main : PrimIO ()

export %foreign libgtk "gtk_main_quit"
gtk_main_quit : PrimIO ()
