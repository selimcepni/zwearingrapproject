@EndUserText.label: 'Approver Projection Wearing'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
  headerInfo: { typeName: 'Wearing',
               typeNamePlural: 'Wearings',
               title: { type: #STANDARD, value: 'WearingId' }
               } }
@Search.searchable: true


define root view entity ZC_WEARING_APPROVER_M
  provider contract transactional_query
  as projection on ZI_WEARING_SE_M
{
      @UI.facet: [ { id:              'Wearing',
                              purpose:         #STANDARD,
                              type:            #IDENTIFICATION_REFERENCE,
                              label:           'Wearing',
                              position:        10 } ,
                            { id:              'Booking',
                              purpose:         #STANDARD,
                              type:            #LINEITEM_REFERENCE,
                              label:           'Clothing',
                              position:        20,
                              targetElement:   '_Clothing'}]
      @UI: {
                lineItem:       [ { position: 10, importance: #HIGH } ],
                identification: [ { position: 10 } ] }
      @Search.defaultSearchElement: true


  key WearingId,


      ////      ClothingId,
      @UI: {
             lineItem:       [ { position: 20, importance: #HIGH } ],
             identification: [ { position: 20 } ],
             selectionField: [ { position: 20 } ] }
      @Consumption.valueHelpDefinition: [ { entity : {name: 'ZI_DEPARTMENT_SE_M',
                                           element: 'DepartmentId'  } } ]
      @ObjectModel.text.element: ['DepartmentName']
      @Search.defaultSearchElement: true


      DepartmentId,
      _Department.DepartmentName as DepartmentName,

      @UI: {
         lineItem:       [ { position: 30, importance: #HIGH } ],
         identification: [ { position: 30 } ],
         selectionField: [ { position: 30 } ] }
      @Consumption.valueHelpDefinition: [ { entity : {name: 'ZI_EMPLOYEE_SE_M', element: 'EmployeeId'  } } ]

      @ObjectModel.text.element: ['EmployeeName']
      @Search.defaultSearchElement: true
      EmployeeId,
      _Employee.EmployeeName     as EmployeeName,


      @UI: {
      lineItem:       [ { position: 42, importance: #MEDIUM } ],
      identification: [ { position: 42 } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ClothingFee,
      @UI: {
        lineItem:       [ { position: 43, importance: #MEDIUM } ],
        identification: [ { position: 43, label: 'Total Price' } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ {entity: {name: 'I_Currency', element: 'Currency' } } ]
      CurrencyCode,
      //      Description,
      @UI: {
                lineItem:       [ { position: 15, importance: #HIGH },
                                  { type: #FOR_ACTION, dataAction: 'acceptWearing', label: 'Accept Wearing' },
                                  { type: #FOR_ACTION, dataAction: 'rejectWearing', label: 'Reject Wearing' } ],
                identification: [ { position: 15 },
                                  { type: #FOR_ACTION, dataAction: 'acceptWearing', label: 'Accept Wearing' },
                                  { type: #FOR_ACTION, dataAction: 'rejectWearing', label: 'Reject Wearing' } ] ,
                textArrangement: #TEXT_ONLY,
                selectionField: [ { position: 40 } ] }
      @EndUserText.label: 'Overall Status'
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' }}]
      @ObjectModel.text.element: ['OverallStatusText']

      OverallStatus,
      @UI.hidden: true
      _Status._Text.Text         as OverallStatusText : localized,
      @UI.hidden: true
      CreatedBy,
      @UI.hidden: true
      CreatedAt,
      @UI.hidden: true
      LastChangedBy,
      @UI.hidden: true
      LastChangedAt,
      /* Associations */
      _Clothing : redirected to composition child ZC_CLOTHING_APPROVER_M,
      _Currency,
      _Department,
      _Employee,
      _Status
}
