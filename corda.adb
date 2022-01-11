with Ada.Text_IO;
use Ada.Text_IO;
package body Corda is
   protected body Def_Monitor is
      entry Cabo_Nord when (NBabuins_N < 3 and NBabuins_S = 0) is
      begin
         NBabuins_N := NBabuins_N+1;
         Put_Line(ASCII.HT&ASCII.HT&"+++ A la corda hi ha"&NBabuins_N'Img&" direccio Sud +++");
      end Cabo_Nord;
      
      entry Cabo_Sud when (NBabuins_S < 3 and NBabuins_N = 0) is
      begin
         NBabuins_S := NBabuins_S+1;
         Put_Line(ASCII.HT&ASCII.HT&"+++ A la corda hi ha"&NBabuins_S'Img&" direccio Nord +++");
      end Cabo_Sud;
      
      procedure Unlock_Sud is
      begin
         NBabuins_S := NBabuins_S-1;
         Put_Line(ASCII.HT&ASCII.HT&"+++ A la corda hi queden"&NBabuins_S'Img&" direccio Nord +++");
      end Unlock_Sud;
      procedure Unlock_Nord is
      begin
         NBabuins_N := NBabuins_N-1;
         Put_Line(ASCII.HT&ASCII.HT&"+++ A la corda hi queden"&NBabuins_N'Img&" direccio Sud +++");
      end Unlock_Nord;
   end Def_Monitor;
end Corda;
