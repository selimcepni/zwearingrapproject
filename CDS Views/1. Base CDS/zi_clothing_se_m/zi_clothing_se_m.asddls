@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clothing Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLOTHING_SE_M as select from zclothing_se_m

association to parent ZI_WEARING_SE_M as _Wearing on $projection.WearingId = _Wearing.WearingId
association [1..*] to ZI_CLOTHES_SE_M as _Clothes on $projection.ProductId = _Clothes.ProductId
association [0..1] to  ZI_EMPLOYEE_SE_M  as _Employee on $projection.EmployeeId  = _Employee.EmployeeId
association [1..1] to /DMO/I_Booking_Status_VH as _ClothesStatus on  $projection.ClothingStatus = _ClothesStatus.BookingStatus
{
    key wearing_id as WearingId,
    key clothing_id as ClothingId,
    employee_id as EmployeeId,
    product_id as ProductId,
    product_category as ProductCategory,
    product_size as ProductSize,   
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,
    clothing_status as ClothingStatus,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    last_changed_at as LastChangedAt,
    
    //assc
    _Wearing,
    _Clothes,
    _Employee,
    _ClothesStatus

}
