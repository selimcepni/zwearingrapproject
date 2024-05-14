@EndUserText.label: 'Clothing Approver Cunsumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@UI.headerInfo: {
    typeName: 'Clothing',
    typeNamePlural: 'Clothings',
    title: {
        type: #STANDARD,
        label: 'Clothing',
        value: 'ClothingId'
    }
}
define view entity ZC_CLOTHING_APPROVER_M
  as projection on ZI_CLOTHING_SE_M
{
      @UI.facet: [{
           id: 'Clothing',
           purpose: #STANDARD,
           position: 10,
           label: 'Clothing',
           type: #IDENTIFICATION_REFERENCE
       }]
      @UI.lineItem: [{ position: 10, importance: #HIGH}]
      @UI.identification: [{ position: 10 , label: 'Wearing ID'}]
      @Search.defaultSearchElement: true
  key WearingId,
      @Search.defaultSearchElement: true
      @UI:{lineItem: [{ position: 20, importance: #HIGH },{ label: 'Clothing ID' }],
      selectionField: [{ position: 20 }], identification: [{ position: 20 }] }
  key ClothingId,
      @Search.defaultSearchElement: true
      @UI:{lineItem: [{ position: 40, importance: #HIGH}, { label: 'Employee(ID)' }], selectionField: [{ position: 40 }], identification: [{ position: 40 }] }
      @Consumption.valueHelpDefinition: [{ entity.name: 'ZI_EMPLOYEE_SE_M' , entity.element: 'EmployeeId' }]
      @ObjectModel.text.element: [ 'EmployeeName' ]
      EmployeeId,
      _Employee.EmployeeName    as EmployeeName,
      @UI.identification: [{ position: 50 }]
      @UI.lineItem: [{ position: 50 }]
      ProductId,
      @UI.identification: [{ position: 60 }]
      @UI.lineItem: [{ position: 60 }]
      ProductCategory,
      @UI.identification: [{ position: 70 }]
      @UI.lineItem: [{ position: 70 }]
      ProductSize,
      @UI.identification: [{ position: 80 }]
      @UI.lineItem: [{ position: 80 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @UI.identification: [{ position: 85 }]
      @Consumption.valueHelpDefinition: [{ entity.name: 'I_Currency' , entity.element: 'Currency' }]
      CurrencyCode,
      @UI.textArrangement: #TEXT_ONLY
      @UI.lineItem: [{ position: 90 }]
      @UI.identification: [{ position: 90 }]
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Booking_Status_VH' , entity.element: 'BookingStatus' }]
      @ObjectModel.text: {     element: [ 'ClothingStatusText' ]}
      ClothingStatus,
      @UI.hidden: true
      _ClothesStatus._Text.Text as ClothingStatusText : localized,
      @UI.hidden: true
      LastChangedAt,
      /* Associations */
      _Clothes,
      _ClothesStatus,
      _Employee,
      _Wearing : redirected to parent ZC_WEARING_APPROVER_M
}
