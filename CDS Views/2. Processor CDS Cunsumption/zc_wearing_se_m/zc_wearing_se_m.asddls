@EndUserText.label: 'Wearing Cunsumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_WEARING_SE_M 
provider contract transactional_query 
as projection on ZI_WEARING_SE_M
{
    @Search.defaultSearchElement: true
    key WearingId,
  
    @Search.defaultSearchElement: true
    @ObjectModel.text.element: [ 'DepartmentName' ]
    DepartmentId,
    _Department.DepartmentName as DepartmentName,
     @Search.defaultSearchElement: true
    @ObjectModel.text.element: [ 'EmployeeName' ]
    EmployeeId,
    _Employee.EmployeeName as EmployeeName,    
    ClothingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    @ObjectModel.text.element: [ 'OverallStatusText' ]
    OverallStatus,
    _Status._Text.Text as OverallStatusText: localized,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Clothing: redirected to composition child ZC_CLOTHING_SE_M,
    _Currency,
    _Department,
    _Employee,
    _Status
}
