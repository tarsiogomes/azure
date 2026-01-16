param virtualMachines_vm_sv_ubuntu_01_name string = 'vm-sv-ubuntu-01'
param disks_vm_sv_ubuntu_01_OsDisk_1_ce10cdbf7c4646078d557f994f742e49_externalid string = '/subscriptions/c08a3587-14a7-4a46-9850-a1e804418751/resourceGroups/rg-prd-01/providers/Microsoft.Compute/disks/vm-sv-ubuntu-01_OsDisk_1_ce10cdbf7c4646078d557f994f742e49'
param networkInterfaces_vm_sv_ubuntu_01140_externalid string = '/subscriptions/c08a3587-14a7-4a46-9850-a1e804418751/resourceGroups/rg-prd-01/providers/Microsoft.Network/networkInterfaces/vm-sv-ubuntu-01140'

resource virtualMachines_vm_sv_ubuntu_01_name_resource 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: virtualMachines_vm_sv_ubuntu_01_name
  location: 'brazilsouth'
  tags: {
    ambiente: 'prod'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1s'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_vm_sv_ubuntu_01_name}_OsDisk_1_ce10cdbf7c4646078d557f994f742e49'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
          id: disks_vm_sv_ubuntu_01_OsDisk_1_ce10cdbf7c4646078d557f994f742e49_externalid
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_vm_sv_ubuntu_01_name
      adminUsername: 'gomes'
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/gomes/.ssh/authorized_keys'
              keyData: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZPHJo6RFlWDOV48gHoEdjgPmHyldsHb2S9e13AQgDAuYlxGQlnVUE9oyWoUkWSorxNO+Ut99hUdRjIYzK4OAA7DP6e1syrHdEhWFzSn3wsGT52RHRvml+fHes7esY1TnK96zA9GhRItYeoWM9isQUftqVgXuAg3uEL/k9Yzlb5eWy4Eu4/VtV9iLIvDZMblDm+Jp/4DdgPmJHM0pRW9m2NkBmOk0Ruye4ot1KM1SteJzYoIbOIqW2rFOCbf/hf1AkNMaR9LI6UYhaK8DhbwHvojnOPtNW1CyLZd2wwO6VxDZwbFBQyvOAKPV/2BwOlbcOh+fUB6gND1UyfisJXDu0gpPMb5VTSLnFewnbq7PRgmoRHKnqsmjm5KNhOxyRCGaWL1BPGj/Fui+G7R2ledArntKnSYj4eFjnCG8Yk7TCaPjBDPMtgXWhLWuBpr6cJ1g8hSX0bSv6v0hR/HwC8Jy0vC4ekgsTV9vQ5YCCzupKXEvHR6keeccBkejm5mVFnZE= generated-by-azure'
            }
          ]
        }
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_vm_sv_ubuntu_01140_externalid
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}
