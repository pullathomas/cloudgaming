//targetScope = 'subscription'
param rgname string
param saname string
param location string = 'southcentralus'
param storageAccountType string
param applicationInsightsName string
param hostingPlanName string
param functionAppName string

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' existing = {
  scope: subscription()
  name: rgname
}

module storageaccount 'storage.bicep' = {
  scope: resourceGroup(rg.name)
  name: saname
  params: {
    saname: saname
    location: location
    storageAccountType: storageAccountType
  }
}

module appinsight 'appinsight.bicep' = {
  scope: resourceGroup(rg.name)
  name: applicationInsightsName
  params: {
    applicationInsightsName: applicationInsightsName
    location: location
  }
}

module hosting 'hostingplan.bicep' = {
  scope: resourceGroup(rg.name)
  name: hostingPlanName
  params: {
    hostingPlanName: hostingPlanName
    location: location
  }
}



module functionapp 'functionapps.bicep' = {
  scope: resourceGroup(rg.name)
  name: functionAppName
  params: {
    functionAppName: functionAppName
    location: location
    serverfarmid: hosting.outputs.serverfarmid 
    appinsightid: appinsight.outputs.appinsightid
    storageid: storageaccount.outputs.storagecnn
  }
}



