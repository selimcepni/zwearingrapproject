@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Wearing Interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define root view entity ZI_WEARING_SE_M 
as select from zwearing_se_m
composition [0..*] of ZI_CLOTHING_SE_M as _Clothing
association [0..1] to ZI_DEPARTMENT_SE_M as _Department on $projection.DepartmentId = _Department.DepartmentId
association [1..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency 
association [1..1] to /DMO/I_Overall_Status_VH as _Status on $projection.OverallStatus = _Status.OverallStatus 
association [0..1] to  ZI_EMPLOYEE_SE_M  as _Employee on $projection.EmployeeId  = _Employee.EmployeeId
{
  
    @Search.defaultSearchElement: true
    key wearing_id as WearingId,
    department_id as DepartmentId,  
    employee_id as EmployeeId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    clothing_fee as ClothingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as OverallStatus,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.localInstanceLastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    last_changed_at as LastChangedAt,
    
    
    
    
//    //assc

       _Department,
       _Currency,
       _Status,
       _Employee,
        _Clothing
    }
