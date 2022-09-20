param hostingPlanName string
param location string

resource hostingPlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: hostingPlanName
  location: location
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
    size: 'Y1'
    family: 'Y'
    capacity: 0
  }
  properties: {
   //computeMode: 'Dynamic'
    reserved: true
  }
}

output serverfarmid string = hostingPlan.id
