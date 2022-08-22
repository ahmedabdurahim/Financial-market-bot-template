#include <Trade/Trade.mqh>

CTrade trade;

double Ask = NormalizeDouble(SymbolInfoDouble (_Symbol, SYMBOL_ASK), _Digits);
double Bid = NormalizeDouble(SymbolInfoDouble (_Symbol, SYMBOL_BID), _Digits);

class sClass {


struct Levels{
   double Level1;
   double Level2;
   double Level3;
   double Level4;
   double Level5;
   double Level6;
};


public:

   Levels Initialization(){
      Levels lvl;
      lvl.Level1 = Ask + (100* _Point);
      lvl.Level2 = Ask + (200* _Point);
      lvl.Level3 = Ask + (300 *_Point);
      lvl.Level4 = Bid - (100 * _Point);
      lvl.Level5 = Bid - (200 * _Point);
      lvl.Level6 = Bid - (300 * _Point);
            
      return lvl;
   }
   
   ulong OpenTrade(int Direction, double Volume){
      ulong TradeTicket;
      
      if(Direction == 1){trade.Buy(Volume,_Symbol,Ask);}
      if(Direction == 0){trade.Buy(Volume,_Symbol,Ask);}
      
      if(GetLastError() == 0){ 
         for(int i = PositionsTotal()-1; i>=0; i--){
            TradeTicket = PositionGetTicket(i); 
         }       
      }
      if(!GetLastError() == 0) {Print("Error Refer Code: " + GetLastError());} 
      return TradeTicket;
   }
   
   

};

