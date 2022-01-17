module GTK.Utils

export
nullanyptr : AnyPtr
nullanyptr = prim__getNullAnyPtr

export
nullptr : Ptr a
nullptr = prim__castPtr $ nullanyptr

export
cast : Ptr a -> Ptr b
cast = believe_me
