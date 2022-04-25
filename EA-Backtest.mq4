//+------------------------------------------------------------------+
//|                                                     EA-Backtest.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                                                  |
//+------------------------------------------------------------------+
#property strict
#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Edit.mqh>
#include <Controls\Label.mqh>
CAppDialog D1;
CButton BBuy, BSell;
CEdit ELot, EStop, ETake;
CLabel LLot, LStop, LTake;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
  //---
  D1.Create(0, "D1", 0, 0, 0, 300, 300);
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
  ETake.Create(0, "ETake", 0, 0, 0, 80, 20);
  ETake.Shift(100, 40);
  ETake.Text("200");
  //---
  EStop.Create(0, "EStop", 0, 0, 0, 80, 20);
  EStop.Shift(10, 70);
  EStop.Text("200");
  //---
  LLot.Create(0, "LLot", 0, 0, 0, 80, 20);
  LLot.Shift(15, 40);
  LLot.Text("Lot");
  //---
  LStop.Create(0, "LStop", 0, 0, 0, 80, 20);
  LStop.Shift(100, 40);
  LStop.Text("Stop");
  //---
  LTake.Create(0, "LTake", 0, 0, 0, 80, 20);
  LTake.Shift(100, 40);
  LTake.Text("Take");
  //---

  //--- Add controls to dialog
  D1.Add(BBuy);
  D1.Add(BSell);
  D1.Add(ELot);
  // D1.Add(ETake);
  // D1.Add(EStop);
  D1.Add(LLot);
  // D1.Add(LStop);
  // D1.Add(LTake);
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
