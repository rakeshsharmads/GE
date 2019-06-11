#include "Backend_ChartsData.h"

BackendChartsData::BackendChartsData()
{

}


{
    QVector<double> yValue;
    yValue.clear();

    for (int i = 0; i <= 50; i++) {
        yValue.push_back(sin(30*i)/*random()*/);
    }

   return yValue;

}
