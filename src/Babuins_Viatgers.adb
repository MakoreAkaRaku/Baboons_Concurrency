with Ada.Text_IO;
use Ada.Text_IO;
with Corda;
use Corda;
with Ada.Numerics.Float_Random;
use Ada.Numerics.Float_Random;
procedure Babuins_Viatgers is
   Subtype Babuins_Max_Delay is Duration range 5.0..20.0;
   Gen: Generator;
   Corda_Babuins : Def_Monitor;
   task type Babui_NORT is
      entry Start(Id: in Integer);
   end Babui_NORT;
   
   task body Babui_NORT is
      Orientacio : String := "Nord";
      Id_Babui_N : Integer;
      Corda_Delay : Float;
   begin
      accept Start(Id: Integer) do
         Id_Babui_N := Id;
      end Start;
      Corda_Delay := Random(Gen);
      Put_Line("Soc el babui "& Orientacio & Id_Babui_N'Img);
      
      for index in 1..3 loop
         Corda_Babuins.Cabo_Nord;
         delay Duration(Corda_Delay);
         Corda_Babuins.Unlock_Nord;
         Put_Line("Babui "&Orientacio&Id_Babui_N'Img&": "&Index'Img&" de 3 voltes fetes // he tardat "&Corda_Delay'Img&" de temps");
         delay 5.0;
      end loop;
      Put_Line("Babui " & Orientacio & Id_Babui_N'Img & ": He acabat!");
   end Babui_NORT;
   
   task type Babui_SUD is
      entry Start(Id: in Integer);
   end Babui_SUD;
   task body Babui_SUD is
      Orientacio : String := "Sud";
      Id_Babui_S : Integer;
      Corda_Delay : Float;
      begin
         accept Start(Id: Integer) do
            Id_Babui_S := Id;
         end Start;
         Corda_Delay := Random(Gen);
         Put_Line(ASCII.HT&"Soc el babui "& Orientacio & Id_Babui_S'Img);
      
         for Index in 1..3 loop
            Corda_Babuins.Cabo_Sud;
            delay Duration(Corda_Delay);
            Corda_Babuins.Unlock_Sud;
            Put_Line(ASCII.HT&"Babui "&Orientacio&Id_Babui_S'Img&": "&Index'Img&" de 3 voltes fetes");
            delay 5.0;
         end loop;
         Put_Line(ASCII.HT&"Babui "& Orientacio& Id_Babui_S'Img&": He acabat!");
   end Babui_SUD;
   
   
   N_BABUINS: Integer:= 5;
   type Babuins_N is array (1..N_BABUINS) of Babui_NORT;
   type Babuins_S is array (1..N_BABUINS) of Babui_SUD;
   BabuinsSud : Babuins_S;
   BabuinsNord: Babuins_N;
begin
   Reset(Gen);
   for Index in 1..N_BABUINS loop
      BabuinsSud(Index).Start(Index);
      BabuinsNord(Index).Start(Index);
   end loop;
end Babuins_Viatgers;
