module GTK.GLib

import GTK.Utils
import GTK.GTK

libglib : String -> String
libglib fname = "C:\{fname},libglib-2.0.so"

public export
G_CONNECT_AFTER : Int
G_CONNECT_AFTER = 0b1

public export
G_CONNECT_SWAPPED : Int
G_CONNECT_SWAPPED = 0b10

public export
GConnectFlags : Type
GConnectFlags = Int

public export
GCallback : Type
GCallback = PrimIO ()

export
data GClosure : Type where

public export
GClosureNotify : Type
GClosureNotify = AnyPtr -> Ptr GClosure -> PrimIO ()

export
data GObject : Type where

export
%foreign libglib "g_signal_connect_data"
g_signal_connect_data : Ptr GObject -> (detailed_signal : String) -> GCallback -> (data_ : AnyPtr) -> GConnectFlags -> GClosureNotify -> PrimIO Int

export
to_object : Ptr GtkWidget -> Ptr GObject
to_object = believe_me
