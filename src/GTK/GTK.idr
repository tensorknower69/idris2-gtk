module GTK.GTK

import GTK.Utils

libgtk : String -> String
libgtk fname = "C:\{fname},libgtk-3.so"

export
data GtkWidget : Type where

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

-- gtk_init

export %foreign libgtk "gtk_init"
gtk_init : (argc : Ptr Int) -> (argv : Ptr String) -> PrimIO ()

-- gtk_widget

export %foreign libgtk "gtk_widget_show"
gtk_widget_show : Ptr GtkWidget -> PrimIO ()

-- gtk_window

export %foreign libgtk "gtk_window_new"
gtk_window_new : GtkWindowType -> PrimIO (Ptr GtkWidget)

export %foreign libgtk "gtk_window_set_title"
gtk_window_set_title : Ptr GtkWidget -> String -> PrimIO ()

export %foreign libgtk "gtk_window_set_default_size"
gtk_window_set_default_size : Ptr GtkWidget -> Int -> Int -> PrimIO ()

-- gtk_button

export %foreign libgtk "gtk_button_new_with_label"
gtk_button_new_with_label : String -> PrimIO (Ptr GtkWidget)

-- gtk_alignment

export %foreign libgtk "gtk_alignment_new"
gtk_alignment_new : Int -> Int -> Int -> Int -> PrimIO (Ptr GtkWidget)

-- gtk_container

export %foreign libgtk "gtk_container_add"
gtk_container_add : Ptr GtkWidget -> Ptr GtkWidget -> PrimIO ()

export %foreign libgtk "gtk_container_set_border_width"
gtk_container_set_border_width : Ptr GtkWidget -> Int -> PrimIO ()

-- gtk_widget

export %foreign libgtk "gtk_widget_show_all"
gtk_widget_show_all : Ptr GtkWidget -> PrimIO ()

export %foreign libgtk "gtk_widget_set_tooltip_text"
gtk_widget_set_tooltip_text : Ptr GtkWidget -> String -> PrimIO ()

export %foreign libgtk "gtk_widget_set_halign"
gtk_widget_set_halign : Ptr GtkWidget -> GtkAlign -> PrimIO ()

export %foreign libgtk "gtk_widget_set_valign"
gtk_widget_set_valign : Ptr GtkWidget -> GtkAlign -> PrimIO ()

-- gtk_main

export %foreign libgtk "gtk_main"
gtk_main : PrimIO ()

export %foreign libgtk "gtk_main_quit"
gtk_main_quit : PrimIO ()
