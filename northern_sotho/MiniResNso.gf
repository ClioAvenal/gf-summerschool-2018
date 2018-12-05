resource MiniResNso = {

    param
        Number = Sg | Pl ;
        ClassGender = C1_2 | C3_4 | C5_6 | C7_8 | C9_10 | C_14;
        Case = Nom | Loc ;

    oper 
        nprefix : ClassGender => Number => Str = table {
            C1_2 => table {
                Sg => "mo";
                Pl => "ba"
            };
            C3_4 => table {
                Sg => "mo";
                Pl => "me"
            };
            C5_6 => table {
                Sg => "le";
                Pl => "ma"
            };
            C7_8 => table {
                Sg => "se";
                Pl => "di"
            };
            C9_10 => table {
                Sg => "";
                Pl => "di"
            };
            C_14 => table {
                Sg => "bo";
                Pl => ""
            }
        };   
        locsuffix : ClassGender => Str = table {
            C1_2 => "ng";
            C3_4 => "ng";
            C5_6 => "ng";
            C7_8 => "ng";
            C9_10 => "ng";
            C_14 => "ng"
        };            
            
        regNoun : Str -> ClassGender -> { s : Case => Number => Str ; cg : ClassGender } = \stem,cg -> 
            {s =
                table { 
                    Nom => table {
                        Sg => nprefix!cg!Sg + stem;
                        Pl => nprefix!cg!Pl + stem
                    };
                    Loc => table {
                        Sg => nprefix!cg!Sg + stem + locsuffix!cg;
                        Pl => nprefix!cg!Pl + stem + locsuffix!cg
                    }
                };
                cg = cg 
        } ;

--         dumbNoun : (_,_,_,_ : Str) -> ClassGender -> { s : Case => Number => Str ; cg : ClassGender }
--         = \noms, nompl, locs, locpl, cg -> {
--             s = table {
--                 Nom => table {
--                     Sg => noms ;
--                     Pl => nompl
--                 } ;
--                 Loc => table {
--                     Sg => locs ;
--                     Pl => locpl
--                 }
--             } ;
--             cg = cg
--         } ;
 }