//+------------------------------------------------------------------+
//|                                                  EA-Backtest.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                                   Design Layout  |
//+------------------------------------------------------------------+
#property strict
#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Edit.mqh>
#include <Controls\Label.mqh>
CAppDialog D1;
CButton BBuy, BSell, BCloseAll, BCloseAllSell, BCloseAllBuy, BCloseByOrder, BSubmitOrder;
CEdit ELot, EStop, ETake, ECloseByOrder,EOrderEdit,EEditOrderTake,EEditOrderStop;
CLabel LLot, LStop, LTake, LTitle, LOrderEdit, LEditOrderTake,LEditOrderStop;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
   //---
   D1.Create(0, "D1", 0, 0, 0, 200, 500);
   D1.Shift(10, 10);
   D1.Caption("EQ trade");

   //----
   BBuy.Create(0, "BBuy", 0, 0, 0, 80, 20);
   BBuy.Shift(10, 10);
   BBuy.Text("Buy");
   //---
   BSell.Create(0, "BSell", 0, 0, 0, 80, 20);
   BSell.Shift(100, 10);
   BSell.Text("Sell");
   //---
   ELot.Create(0, "ELot", 0, 0, 0, 80, 20);
   ELot.Shift(100, 40);
   ELot.Text("0.01");
   //---
   LLot.Create(0, "LLot", 0, 0, 0, 80, 20);
   LLot.Shift(10, 40);
   LLot.Text("Lot");
   //---
   ETake.Create(0, "ETake", 0, 0, 0, 80, 20);
   ETake.Shift(100, 70);
   ETake.Text("0");
   //---
   LTake.Create(0, "LTake", 0, 0, 0, 80, 20);
   LTake.Shift(10, 70);
   LTake.Text("Take Profit");
   //---
   EStop.Create(0, "EStop", 0, 0, 0, 80, 20);
   EStop.Shift(100, 100);
   EStop.Text("0");
   //---
   LStop.Create(0, "LStop", 0, 0, 0, 80, 20);
   LStop.Shift(10, 100);
   LStop.Text("Stop Loss");
   //---
   BCloseAll.Create(0, "BCloseAll", 0, 0, 0, 80, 20);
   BCloseAll.Shift(10, 130);
   BCloseAll.Text("Close All");
   //---
   BCloseAllBuy.Create(0, "BCloseAllBuy", 0, 0, 0, 80, 20);
   BCloseAllBuy.Shift(10, 170);
   BCloseAllBuy.Text("Close All Buy");
   //---
   BCloseAllSell.Create(0, "BCloseAllSell", 0, 0, 0, 80, 20);
   BCloseAllSell.Shift(100, 170);
   BCloseAllSell.Text("Close All Sell");
   // ---
   BCloseByOrder.Create(0, "BCloseByOrder", 0, 0, 0, 80, 20);
   BCloseByOrder.Shift(10, 200);
   BCloseByOrder.Text("Close ID");
   //---
   ECloseByOrder.Create(0, "ECloseByOrder", 0, 0, 0, 80, 20);
   ECloseByOrder.Shift(100, 200);
   ECloseByOrder.Text("0");
   //---
   LTitle.Create(0, "LTitle", 0, 0, 0, 80, 40);
   LTitle.Shift(10, 230);
   LTitle.Text("Control Order ID -----------");
   LTitle.Color(99949);
   //---
   EOrderEdit.Create(0, "EOrderEdit", 0, 0, 0, 80, 20);
   EOrderEdit.Shift(100, 260);
   EOrderEdit.Text("");
   //---
   LOrderEdit.Create(0, "LOrderEdit", 0, 0, 0, 80, 20);
   LOrderEdit.Shift(10, 260);
   LOrderEdit.Text("Order ID");
   //---
   EEditOrderTake.Create(0, "EEditOrderTake", 0, 0, 0, 80, 20);
   EEditOrderTake.Shift(100, 290);
   EEditOrderTake.Text("0");
   //---
   EEditOrderStop.Create(0, "EEditOrderStop", 0, 0, 0, 80, 20);
   EEditOrderStop.Shift(100, 320);
   EEditOrderStop.Text("0");
   //---
   LEditOrderTake.Create(0, "LEditOrderTake", 0, 0, 0, 80, 20);
   LEditOrderTake.Shift(10, 290);
   LEditOrderTake.Text("Take Profit");
   //---
   LEditOrderStop.Create(0, "LEditOrderStop", 0, 0, 0, 80, 20);
   LEditOrderStop.Shift(10, 320);
   LEditOrderStop.Text("Stop Loss");
   //---
   BSubmitOrder.Create(0, "BSubmitOrder", 0, 0, 0, 160, 20);
   BSubmitOrder.Shift(15, 350);
   BSubmitOrder.Text("Send Order");
   //---

   //--- Add controls to dialog
   D1.Add(BBuy);
   D1.Add(BSell);
   D1.Add(ELot);
   D1.Add(LLot);
   D1.Add(ETake);
   D1.Add(LTake);
   D1.Add(EStop);
   D1.Add(LStop);
   D1.Add(BCloseAll);
   D1.Add(BCloseAllBuy);
   D1.Add(BCloseAllSell);
   D1.Add(BCloseByOrder);
   D1.Add(ECloseByOrder);
   D1.Add(LTitle);
   D1.Add(EOrderEdit);
   D1.Add(LOrderEdit);
   D1.Add(EEditOrderTake);
   D1.Add(EEditOrderStop);
   D1.Add(LEditOrderTake);
   D1.Add(LEditOrderStop);
   D1.Add(BSubmitOrder);


   //---
   D1.Run();
   //---
   return (INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   //---
   D1.Destroy(reason);
}
// +------------------------------------------------------------------+
// | ChartEvent function                                             |
// +------------------------------------------------------------------+
void OnChartEvent(const int id,         // Event ID
                  const long &lparam,   // Parameter of type long event
                  const double &dparam, // Parameter of type double event
                  const string &sparam  // Parameter of type string events
)
{
   D1.ChartEvent(id, lparam, dparam, sparam);
}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   //---
}
//+------------------------------------------------------------------+