package Corda is
   protected type Def_Monitor is
      entry Cabo_Nord;
      procedure Unlock_Nord;
      entry Cabo_Sud;
      procedure Unlock_Sud;
   private
      NBabuins_N : Integer := 0;
      NBabuins_S : Integer := 0;
   end Def_Monitor;
end Corda;
