@EndUserText.label: 'Clothing Cunsumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_CLOTHING_SE_M 
as projection on ZI_CLOTHING_SE_M
{
    key  WearingId  ,
    key ClothingId,
    @ObjectModel.text.element: [ 'EmployeeName' ] 
    EmployeeId, 
     _Employee.EmployeeName as EmployeeName,
    ProductId,
    ProductCategory,
    ProductSize,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    @ObjectModel.text: {     element: [ 'ClothingStatusText' ]}  
    ClothingStatus,
    _ClothesStatus._Text.Text as ClothingStatusText: localized,
    LastChangedAt,
    /* Associations */
    _Clothes,
    _ClothesStatus,
    _Employee,
    _Wearing : redirected to parent ZC_WEARING_SE_M
 
}
