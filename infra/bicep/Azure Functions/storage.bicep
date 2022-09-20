param storageAccountType string
param saname string
//param location string = deployment().location
param location string 

resource storageAccountName 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: saname
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageAccountType
  }
}

var storagecnnstrng ='DefaultEndpointsProtocol=https;AccountName=${saname};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccountName.listKeys().keys[0].value}'
output storagecnn string = storagecnnstrng
