#include %A_ScriptDir%\..\Zip\Zip.ahk

; 
; Map() by infogulch. http://www.autohotkey.com/forum/viewtopic.php?t=76136
; see: http://en.wikipedia.org/wiki/Map_(higher-order_function)
; behavior is similar to: http://docs.python.org/library/functions.html#map
; 

Map(func, args*) {
    try return Map_Z(func, Zip("all", args*))
    catch e
        throw Exception("All args after func passed to " A_ThisFunc "() must be arrays.", -1)

}

Map_C(func, args*) {
    try return Map_Z(func, Zip("copy", args*))
    catch e
        throw Exception("All args after func passed to " A_ThisFunc "() must be arrays.", -1)

}

Map_Z(func, args) {
    ret := []
    loop % args.MaxIndex()
        ret[A_Index] := func.(args[A_Index]*)
    return ret
}
