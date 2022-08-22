class Indicators{

public:

   double MovingAverage(int MA, int candle){
      double MovingAverageArray[];
      int MovingAverageDefinition = iMA(_Symbol,_Period,MA,0,MODE_EMA,PRICE_CLOSE);
      ArraySetAsSeries(MovingAverageArray, true);
      CopyBuffer(MovingAverageDefinition,0,0,20,MovingAverageArray);
      double MovingAverageValue = NormalizeDouble(MovingAverageArray[candle], _Digits);
   return MovingAverageValue;
   }

   float MACD(){
      double PriceArray[];
      int MACDDefinition = iMACD(_Symbol, _Period,12,26,9,PRICE_CLOSE);
      ArraySetAsSeries(PriceArray, true);
      CopyBuffer(MACDDefinition,0,0,3,PriceArray);
      
      float MACDValue = (PriceArray[0]);
      
      return MACDValue;
   }
   
   double RelativeStrengthIndex(){
      double RSIArray[];
      int RsiDefinition = iRSI(_Symbol,_Period,14,PRICE_CLOSE);
      ArraySetAsSeries(RSIArray,true);
      CopyBuffer(RsiDefinition,0,0,3,RSIArray);
      
      double RsiValue = NormalizeDouble(RSIArray[0], 2);
      
      return RsiValue;
   }
   
   
   double PriceArray(int Index){
      MqlRates PriceInformation[];
      double returnValue = PriceInformation[Index].close;
      ArraySetAsSeries(PriceInformation, true); 
      int Data = CopyRates(_Symbol,PERIOD_CURRENT,0,10, PriceInformation);
   
   return returnValue;

}
   
   int EngulfingCandle(){
      datetime time = iTime(_Symbol,PERIOD_CURRENT,1);
      // Returns 1 for bullish engulfing and 0 for bearish engulfing
      int engulfingCandle;
      //Candle shift 1
      double high1 = iHigh(_Symbol,PERIOD_CURRENT,1);
      double low1 = iLow(_Symbol,PERIOD_CURRENT,1);
      double open1 = iOpen(_Symbol,PERIOD_CURRENT,1);
      double close1 = iClose(_Symbol,PERIOD_CURRENT,1);
      //Candle shift 2
      double high2 = iHigh(_Symbol,PERIOD_CURRENT,2);
      double low2 = iLow(_Symbol,PERIOD_CURRENT,2);
      double open2 = iOpen(_Symbol,PERIOD_CURRENT,2);
      double close2 = iClose(_Symbol,PERIOD_CURRENT,2);
      //Candle shift 3
      double high3 = iHigh(_Symbol,PERIOD_CURRENT,3);
      double low3 = iLow(_Symbol,PERIOD_CURRENT,3);
      double open3 = iOpen(_Symbol,PERIOD_CURRENT,3);
      double close3 = iClose(_Symbol,PERIOD_CURRENT,3);
      //Candle shift 4
      double high4 = iHigh(_Symbol,PERIOD_CURRENT,4);
      double low4 = iLow(_Symbol,PERIOD_CURRENT,4);
      double open4 = iOpen(_Symbol,PERIOD_CURRENT,4);
      double close4 = iClose(_Symbol,PERIOD_CURRENT,4);
      
      //Bullish Engulfing
      
      if(open4 > close4 && close4 > close3){
         if(open3 > close3 && close3 > close2){
            if(open2 > close2 && close2 < close1){
               engulfingCandle = 1;
            }
         }
      }
      
      if(open4 < close4 && close4 < close3){
         if(open3 < close3 && close3 < close2){
            if(open2 < close2 && close2 > close1){
               engulfingCandle = 0;
            }
         }
      }
      
      return engulfingCandle;
   }
   

};
