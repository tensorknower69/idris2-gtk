module GTK.GTK

import GTK.Utils

libgtk : String -> String
libgtk fname = "C:\{fname},libgtk-3.so"

export
data GtkWidget : Type where

export
%foreign libgtk "gtk_init"
gtk_init : (argc : Ptr Int) -> (argv : Ptr String) -> PrimIO ()

public export
GTK_WINDOW_TOPLEVEL : Int
GTK_WINDOW_TOPLEVEL = 0

export
%foreign libgtk "gtk_window_new"
gtk_window_new : (window_type : Int) -> PrimIO (Ptr GtkWidget)

export
%foreign libgtk "gtk_widget_show"
gtk_widget_show : Ptr GtkWidget -> PrimIO ()

export
%foreign libgtk "gtk_window_set_title"
gtk_window_set_title : Ptr GtkWidget -> String -> PrimIO ()

export
%foreign libgtk "gtk_window_set_default_size"
gtk_window_set_default_size : Ptr GtkWidget -> Int -> Int -> PrimIO ()

export
%foreign libgtk "gtk_main"
gtk_main : PrimIO ()

export
%foreign libgtk "gtk_main_quit"
gtk_main_quit : PrimIO ()

