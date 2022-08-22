class AccMng{
public:
   
   AccMng(){
      if(GetLastError() > 0){
         Print ("Error Refer: " + GetLastError());
      }
      else{
         Print("Initialized successfully ");
      }
   }

   double AccountBalance(){
      double balance;
      balance = AccountInfoDouble(ACCOUNT_BALANCE);
      
      return balance;
   }
   
   double AccountEquity(){
      double equity;
      equity = AccountInfoDouble(ACCOUNT_EQUITY);
      
      return equity;
   }
   
   double AccountMargin(){
      double margin;
      margin = AccountInfoDouble(ACCOUNT_MARGIN);
      
      return margin;
   }
   
   double Floating(){
      double prft;
      if(PositionsTotal() > 0){
         for(int i = PositionsTotal() - 1; i>-0; i--){
            prft = PositionGetDouble(POSITION_PROFIT);
         }
      }
      else{
         prft = 0.0;
      }
      
      return prft;
   }
   
   double FreeMargin(){
      double freeMargin;
      freeMargin = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
      
      return freeMargin;
   }
};
