#include "Trades.mqh"
#include "Indicators.mqh"
#include "AccMng.mqh"

Indicators Indicate;
sClass Trade;
AccMng Acc;

int OnInit(){

   Print(" Account Balance: " + Acc.AccountBalance() + 
         "\n Account Equity: " + Acc.AccountEquity() +
         "\n Account Margin: " + Acc.AccountMargin() +
         "\n Floating P/L: " + Acc.Floating()); 

   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason){
   if(GetLastError() > 0){
      Print("Error! Cause DeInit Refer: " +  GetLastError());
   }
   else{
      Print("DeInit successful");
   }

}


void OnTick(){
  //Logic goes here
}

