# don't need prev as we're not patching any existing functions
final: _:
let
  lib = final;
in
{
  # will be lib.custom
  custom = rec {
    mkOverrideRecursive =
      priority:
      let
        recurse =
          value:
          if builtins.isAttrs value then
            if builtins.hasAttr "_type" value then
              value // { content = recurse value.content; }
            else
              builtins.mapAttrs (_: recurse) value
          else if builtins.isList value then
            value
          else
            lib.mkOverride priority value;
      in
      recurse;
    mkDefaultRecursive = mkOverrideRecursive 900;
    anythingWithMergeLists = lib.mkOptionType {
      name = "anything";
      description = "anything";
      descriptionClass = "noun";
      check = value: true;
      merge =
        loc: defs:
        let
          inherit (builtins)
            isAttrs
            foldl'
            head
            ;
          inherit (lib)
            isStringLike
            showOption
            showFiles
            getFiles
            mergeOneOption
            mergeEqualOption
            ;
          inherit (lib.types) attrsOf listOf;
          getType =
            value: if isAttrs value && isStringLike value then "stringCoercibleSet" else builtins.typeOf value;

          # Returns the common type of all definitions, throws an error if they
          # don't have the same type
          commonType = foldl' (
            type: def:
            if getType def.value == type then
              type
            else
              throw "The option `${showOption loc}' has conflicting option types in ${showFiles (getFiles defs)}"
          ) (getType (head defs).value) defs;

          mergeFunction =
            {
              # Recursively merge attribute sets
              set = (attrsOf anythingWithMergeLists).merge;
              # This is the type of packages, only accept a single definition
              stringCoercibleSet = mergeOneOption;
              lambda =
                loc: defs: arg:
                anythingWithMergeLists.merge (loc ++ [ "<function body>" ]) (
                  map (def: {
                    inherit (def) file;
                    value = def.value arg;
                  }) defs
                );
              list = (listOf anythingWithMergeLists).merge;
              # Otherwise fall back to only allowing all equal definitions
            }
            .${commonType} or mergeEqualOption;
        in
        mergeFunction loc defs;
    };
  };
}
